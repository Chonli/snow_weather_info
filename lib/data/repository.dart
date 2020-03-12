import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
import 'package:intl/intl.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snow_weather_info/data/database_helper.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/model/station.dart';

import 'constant_data_list.dart';

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
  final Location _location = Location();
  LatLng currentMapLoc = LatLng(45.05, 6.3);
  LatLng currentUserLoc;
  int currentIndexTab = 0;

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

  Future<bool> updateLocation() async {
    var hasPermission = await _location.hasPermission();
    if (!hasPermission) {
      hasPermission = await _location.requestPermission();
    }
    if (hasPermission) {
      var loc = await _location.getLocation();
      currentUserLoc = LatLng(loc.latitude, loc.longitude);
    }

    return hasPermission;
  }

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
    _listAvalancheBulletin = ConstantDatalist.listAvalancheBulletin
      ..sort((a, b) => a.massifName.compareTo(b.massifName));
  }

  _initNivose() {
    _listNivose = ConstantDatalist.listNivose;
  }
}
