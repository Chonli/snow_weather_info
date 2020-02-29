import 'dart:collection';
import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snow_weather_info/data/database_helper.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:http/http.dart' as http;

final String _lastStationPrefs = "lastStationPrefs";
final String _lastStationDataPrefs = "lastStationDataPrefs";

class Repository {
  SharedPreferences _prefs;
  bool _isInitialise = false;
  List<Station> _listStation;
  HashMap<int, List<DataStation>> _hashDataStation;
  List<AvalancheBulletin> _listAvalancheBulletin;

  Future<bool> initData() async {
    if (!_isInitialise) {
      _initAvalancheBulletin();
      _prefs = await SharedPreferences.getInstance();
      try {
        await Future.wait([_initStation(), _downloadStationData()]);
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
    _listStation.sort((a, b) => a.name.compareTo(b.name));
  }

  _initAvalancheBulletin() {
    _listAvalancheBulletin = List<AvalancheBulletin>()
      ..add(AvalancheBulletin(
          "Chablais",
          "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP01.pdf",
          Mountain.alpe))
      ..add(AvalancheBulletin(
          "Aravis",
          "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP02.pdf",
          Mountain.alpe))
      ..add(AvalancheBulletin(
          "Mont-Blanc",
          "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP03.pdf",
          Mountain.alpe))
      ..add(AvalancheBulletin(
          "Bauges",
          "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP04.pdf",
          Mountain.alpe))
      ..add(AvalancheBulletin(
          "Beaufortain",
          "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP05.pdf",
          Mountain.alpe))
      ..add(AvalancheBulletin(
          "Haute-Tarentaise",
          "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP06.pdf",
          Mountain.alpe))
      ..add(AvalancheBulletin("Chartreuse", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP07.pdf", Mountain.alpe))
      ..add(AvalancheBulletin("Belledonne", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP08.pdf", Mountain.alpe))
      ..add(AvalancheBulletin("Maurienne", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP09.pdf", Mountain.alpe))
      ..add(AvalancheBulletin("Vanoise", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP10.pdf", Mountain.alpe))
      ..add(AvalancheBulletin("Haute-Maurienne", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP11.pdf", Mountain.alpe))
      ..add(AvalancheBulletin("Grandes-Rousses", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP12.pdf", Mountain.alpe))
      ..add(AvalancheBulletin("Thabor", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP13.pdf", Mountain.alpe))
      ..add(AvalancheBulletin("Vercors", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP14.pdf", Mountain.alpe))
      ..add(AvalancheBulletin("Oisans", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP15.pdf", Mountain.alpe))
      ..add(AvalancheBulletin("Pelvoux", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP16.pdf", Mountain.alpe))
      ..add(AvalancheBulletin("Queyras", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP17.pdf", Mountain.alpe))
      ..add(AvalancheBulletin("Devoluy", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP18.pdf", Mountain.alpe))
      ..add(AvalancheBulletin("Champsaur", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP19.pdf", Mountain.alpe))
      ..add(AvalancheBulletin("Embrunnais-Parpaillon", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP20.pdf", Mountain.alpe))
      ..add(AvalancheBulletin("Ubaye", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP21.pdf", Mountain.alpe))
      ..add(AvalancheBulletin("Haut-Var-Haut-Verdon", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP22.pdf", Mountain.alpe))
      ..add(AvalancheBulletin("Mercantour", "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP23.pdf", Mountain.alpe))
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

  List<Station> get stations => _listStation.toList();

  List<AvalancheBulletin> getAvalancheBulletin(Mountain mountain) {
    return _listAvalancheBulletin
      ..where((f) => f.mountain == mountain).toList();
  }

  List<AvalancheBulletin> getAllAvalancheBulletin() {
    return _listAvalancheBulletin.toList();
  }

  List<DataStation> getDataOfStation(int id) {
    return _hashDataStation[id];
  }
}
