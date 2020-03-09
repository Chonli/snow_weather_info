import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
import 'package:intl/intl.dart';
import 'package:latlong/latlong.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snow_weather_info/data/database_helper.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/model/station.dart';

final String _lastStationPrefs = "lastStationPrefs";
final String _lastStationDataPrefs = "lastStationDataPrefs";

class Repository {
  SharedPreferences _prefs;
  bool _isInitialise = false;
  List<Station> _listStation;
  List<Nivose> _listNivose;
  HashMap<int, List<DataStation>> _hashDataStation;
  List<AvalancheBulletin> _listAvalancheBulletin;
  PackageInfo packageInfo;

  Future<bool> initData() async {
    if (!_isInitialise) {
      packageInfo = await PackageInfo.fromPlatform();
      _initAvalancheBulletin();
      _initNivose();
      _prefs = await SharedPreferences.getInstance();
      try {
        await Future.wait([
          _initStation(),
          _downloadStationData(),
        ]);
        await _finalizeStationData();
        _isInitialise = true;
      } catch (e) {
        print("init error : " + e.toString());
      }
    }
    return _isInitialise;
  }

  Future<void> _finalizeStationData() async {
    _hashDataStation = HashMap();
    for (var s in _listStation) {
      var listOfData = await DatabaseHelper.instance.getDataStation(s.id);
      _hashDataStation[s.id] = listOfData;
      s.hasData = listOfData.length > 0 ? true : false;
      if (s.hasData) {
        var dataSt =
            listOfData.firstWhere((d) => d.hasSnowHeight, orElse: () => null);
        s.lastSnowHeight =
            dataSt != null && dataSt.hasSnowHeight ? dataSt.snowHeight : 0.0;
      } else {
        s.lastSnowHeight = 0.0;
      }
    }

    await DatabaseHelper.instance.cleanOldData(7);
  }

  Future<void> _downloadStationData() async {
    DateTime lastDataDownload;
    var lastDateData =
        DateTime.parse(_prefs.getString(_lastStationDataPrefs) ?? "19700101");
    print("last data ${lastDateData.toString()}");
    for (int i = 7; i >= 0; --i) {
      var dateTime = DateTime.now().subtract(Duration(days: i));

      if (dateTime.isAfter(lastDateData)) {
        var dateStr = DateFormat('yyyyMMdd').format(dateTime);
        var url =
            'https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/nivo.$dateStr.csv';
        print(url);
        var response = await http.get(url);

        if (response.statusCode == 200) {
          var cvsResult = const CsvToListConverter().convert(response.body,
              fieldDelimiter: ';', eol: '\n', shouldParseNumbers: false);

          if (cvsResult.length > 1) {
            if (cvsResult[0].length > 2) {
              cvsResult.removeAt(0);
              var listData = cvsResult.map<DataStation>((line) {
                return DataStation.fromList(line);
              }).toList();

              listData.forEach((d) async {
                await DatabaseHelper.instance.insertStationData(d);
              });

              lastDataDownload = dateTime;
              print("get data OK");
            }
          }
        }
      }
    }

    if (lastDataDownload != null) {
      _prefs.setString(_lastStationDataPrefs, lastDataDownload.toString());
    }
  }

  Future<void> _initStation() async {
    var stationUpdateDate = DateTime.parse(
        _prefs.getString(_lastStationPrefs) ?? DateTime.now().toString());
    _listStation = await DatabaseHelper.instance.getAllStation();
    if (_listStation.length == 0 ||
        stationUpdateDate.difference(DateTime.now()) > Duration(days: 15)) {
      final response = await http.get(
          'https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/postesNivo.json');

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var rest = data["features"] as List;

        for (var json in rest) {
          var st = json["properties"];
          if (st['ID'] != '') _listStation.add(Station.fromJson(st));
        }

        _listStation.forEach(
            (s) async => await DatabaseHelper.instance.insertStation(s));

        _prefs.setString(_lastStationPrefs, DateTime.now().toString());

        print("donwload station ok");
      } else {
        throw Exception('Failed to load station');
      }
    }
  }

  _initAvalancheBulletin() {
    _listAvalancheBulletin = List<AvalancheBulletin>()
      ..add(AvalancheBulletin(
          "Chablais",
          "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP01.pdf",
          Mountain.alpes_nord))
      ..add(AvalancheBulletin(
          "Aravis",
          "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP02.pdf",
          Mountain.alpes_nord))
      ..add(AvalancheBulletin(
          "Mont-Blanc",
          "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP03.pdf",
          Mountain.alpes_nord))
      ..add(AvalancheBulletin(
          "Bauges",
          "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP04.pdf",
          Mountain.alpes_nord))
      ..add(AvalancheBulletin(
          "Beaufortain",
          "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP05.pdf",
          Mountain.alpes_nord))
      ..add(AvalancheBulletin(
          "Haute-Tarentaise",
          "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP06.pdf",
          Mountain.alpes_nord))
      ..add(AvalancheBulletin("Chartreuse", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP07.pdf", Mountain.alpes_nord))
      ..add(AvalancheBulletin("Belledonne", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP08.pdf", Mountain.alpes_nord))
      ..add(AvalancheBulletin("Maurienne", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP09.pdf", Mountain.alpes_nord))
      ..add(AvalancheBulletin("Vanoise", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP10.pdf", Mountain.alpes_nord))
      ..add(AvalancheBulletin("Haute-Maurienne", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP11.pdf", Mountain.alpes_nord))
      ..add(AvalancheBulletin("Grandes-Rousses", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP12.pdf", Mountain.alpes_nord))
      ..add(AvalancheBulletin("Thabor", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP13.pdf", Mountain.alpes_nord))
      ..add(AvalancheBulletin("Vercors", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP14.pdf", Mountain.alpes_nord))
      ..add(AvalancheBulletin("Oisans", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP15.pdf", Mountain.alpes_nord))
      ..add(AvalancheBulletin("Pelvoux", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP16.pdf", Mountain.alpes_sud))
      ..add(AvalancheBulletin("Queyras", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP17.pdf", Mountain.alpes_sud))
      ..add(AvalancheBulletin("Devoluy", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP18.pdf", Mountain.alpes_sud))
      ..add(AvalancheBulletin("Champsaur", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP19.pdf", Mountain.alpes_sud))
      ..add(AvalancheBulletin("Embrunnais-Parpaillon", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP20.pdf", Mountain.alpes_sud))
      ..add(AvalancheBulletin("Ubaye", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP21.pdf", Mountain.alpes_sud))
      ..add(AvalancheBulletin("Haut-Var-Haut-Verdon", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP22.pdf", Mountain.alpes_sud))
      ..add(AvalancheBulletin("Mercantour", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP23.pdf", Mountain.alpes_sud))
      ..add(AvalancheBulletin("Cinto-Rotondo", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP40.pdf", Mountain.corse))
      ..add(AvalancheBulletin("Renoso", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP41.pdf", Mountain.corse))
      ..add(AvalancheBulletin("Pays-Basque", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP64.pdf", Mountain.pyrennee))
      ..add(AvalancheBulletin("Aspe-Ossau", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP65.pdf", Mountain.pyrennee))
      ..add(AvalancheBulletin("Haute-Bigorre", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP66.pdf", Mountain.pyrennee))
      ..add(AvalancheBulletin("Aure-Louron", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP67.pdf", Mountain.pyrennee))
      ..add(AvalancheBulletin("Luchonnais", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP68.pdf", Mountain.pyrennee))
      ..add(AvalancheBulletin("Couserans", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP69.pdf", Mountain.pyrennee))
      ..add(AvalancheBulletin("Haute-Ariege", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP70.pdf", Mountain.pyrennee))
      ..add(AvalancheBulletin("Andorre", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP71.pdf", Mountain.pyrennee))
      ..add(AvalancheBulletin("Orlu-St-Barthelemy", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP72.pdf", Mountain.pyrennee))
      ..add(AvalancheBulletin("Capcir-Puymorens", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP73.pdf", Mountain.pyrennee))
      ..add(AvalancheBulletin("Cerdagne-Canigou", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP74.pdf", Mountain.pyrennee));
  }

  _initNivose() {
    _listNivose = List<Nivose>()
      //alpes nord
      ..add(Nivose(
          "Aiguilles rouges", LatLng(45.986125, 6.895937), 2330, 'ZONE_AIGRG'))
      ..add(Nivose("Bellecote", LatLng(45.48881, 6.77163), 3000, 'ZONE_BELLE'))
      ..add(Nivose("Le Chevril", LatLng(45.50179, 6.95604), 2560, 'ZONE_CHEVR'))
      ..add(Nivose("Bonneval", LatLng(45.35175, 7.05132), 2720, 'ZONE_BONNE'))
      ..add(Nivose(
          "Les rochilles", LatLng(45.08467, 6.47127), 2450, 'ZONE_ROCHI'))
      ..add(Nivose("Allant", LatLng(45.66345, 6.21195), 1630, 'ZONE_ALLAN'))
      ..add(
          Nivose("Grande Parei", LatLng(45.61463, 6.64750), 2240, 'ZONE_GRPAR'))
      ..add(Nivose(
          "Col de Porte", LatLng(45.2952742, 5.7651929), 1325, 'ZONE_PORTE'))
      ..add(Nivose("St Hilaire", LatLng(45.31449, 5.86462), 1700, 'ZONE_STHIL'))
      ..add(
          Nivose("Aigleton", LatLng(45.2311598, 6.0381140), 2240, 'ZONE_AIGLE'))
      ..add(Nivose("Le Gua", LatLng(45.01517, 5.58951), 1600, 'ZONE_LEGUA'))
      ..add(Nivose("Les Ecrins", LatLng(44.93681, 6.34602), 2940, 'ZONE_ECRIN'))
      ..add(Nivose("La Meije", LatLng(45.01255, 6.26485), 3100, 'ZONE_MEIJE'))
      ..add(Nivose("Galibier", LatLng(45.05733, 6.37739), 2559, 'ZONE_GALIB'))
      //alpes sud
      ..add(Nivose("Orcières", LatLng(44.71857, 6.33378), 2294, 'ZONE_ORCIE'))
      ..add(Nivose("Col Agnel", LatLng(44.68873, 6.97625), 2630, 'ZONE_AGNEL'))
      ..add(Nivose("Restefond", LatLng(44.34205, 6.79871), 2550, 'ZONE_RESTE'))
      ..add(Nivose("Millefonts", LatLng(44.11819, 7.19226), 2430, 'ZONE_MILLE'))
      ..add(Nivose("Parpaillon", LatLng(44.49522, 6.63650), 2545, 'ZONE_PARPA'))
      //corse
      ..add(Nivose("Sponde", LatLng(42.32448, 8.88478), 1980, 'ZONE_SPOND'))
      ..add(Nivose("Maniccia", LatLng(42.20837, 9.04888), 2360, 'ZONE_MANIC'))
      //pyrennée
      ..add(Nivose("Maupas", LatLng(42.71428, 0.54995), 2430, 'ZONE_MAUPA'))
      ..add(
          Nivose("Port d`'Aula", LatLng(42.76993, 1.11493), 2140, 'ZONE_PAULA'))
      ..add(Nivose("Canigou", LatLng(42.53322, 2.46096), 2150, 'ZONE_CANIG'))
      ..add(Nivose("Hospitalet", LatLng(42.57778, 1.81140), 2293, 'ZONE_HOSPI'))
      ..add(Nivose("Puigmal", LatLng(42.38318, 2.09143), 2467, 'ZONE_PUIGN'))
      ..add(Nivose("Soum Couy", LatLng(42.96157, -0.71995), 2150, 'ZONE_SOUMC'))
      ..add(Nivose(
          "Lac d'ardiden", LatLng(42.84828, -0.06471), 2445, 'ZONE_LARDI'))
      ..add(Nivose(
          "Aiguillettes", LatLng(42.74692, 0.18128), 2120, 'ZONE_AIGTE'));
  }

  List<Station> get stations => _listStation.toList();

  List<Nivose> get nivoses => _listNivose.toList();

  List<DataStation> getDataOfStation(int id) {
    return _hashDataStation[id];
  }

  List<AvalancheBulletin> getAvalancheBulletin(Mountain mountain) {
    return _listAvalancheBulletin.where((f) => f.mountain == mountain).toList();
  }

  List<AvalancheBulletin> getAllAvalancheBulletin() {
    return _listAvalancheBulletin.toList();
  }

  Nivose getNivose(String codeMF) {
    return _listNivose.firstWhere((n) => n.codeMF == codeMF);
  }

  Future<Nivose> updateUrlNivo(String codeMF) async {
    var nivose = getNivose(codeMF);
    print(nivose.toString());
    if (nivose.urlWeek == null || nivose.urlSeason == null) {
      try {
        final response = await http.get(
            'http://www.meteofrance.com/mf3-rpc-portlet/rest/relevemontagne/releve/$codeMF/type/imgnivose7j');

        if (response.statusCode == 200) {
          nivose.urlWeek =
              'http://www.meteofrance.com/integration/sim-portail' +
                  response.body.replaceAll(RegExp('"'), '');
        } else {
          print("error url : ${response.statusCode}");
        }

        final responseSai = await http.get(
            'http://www.meteofrance.com/mf3-rpc-portlet/rest/relevemontagne/releve/$codeMF/type/imgnivosesai');

        if (responseSai.statusCode == 200) {
          nivose.urlSeason =
              'http://www.meteofrance.com/integration/sim-portail' +
                  responseSai.body.replaceAll(RegExp('"'), '');
        } else {
          print("error url : ${responseSai.statusCode}");
        }
      } catch (ex) {
        print(ex.toString());
      }
    }

    print('${nivose.urlWeek} \n${nivose.urlSeason}');
    return nivose;
  }
}
