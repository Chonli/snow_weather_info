import 'dart:collection';
import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snow_weather_info/data/database_helper.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:http/http.dart' as http;

final String _lastDataPrefs = "lastDataPrefs";
final String _stationDataPrefs = "stationDataPrefs";

class Repository {
  SharedPreferences _prefs;
  bool _isInitialise = false;
  List<Station> _listStation;
  HashMap<int, List<DataStation>> _hashDataStation;

  Future<bool> initData() async {
    if (!_isInitialise) {
      _prefs = await SharedPreferences.getInstance();
      //try {
        await Future.wait([_initStation(), _downloadStationData()]);
        await _finalizeStationData();
        _isInitialise = true;
      //} catch (e) {
      //  print("init error : " + e.toString());
      //}
    }
    return _isInitialise;
  }

  Future<void> _finalizeStationData() async {
    _hashDataStation = HashMap();
    _listStation.forEach((s) async {
      var listOfData = await DatabaseHelper.instance.getDataStation(s.id);
      _hashDataStation[s.id] = listOfData;
    });

    _hashDataStation.values
        .forEach((l) => l.sort((a, b) => b.date.compareTo(a.date)));

    _listStation.forEach((s) => s.hasData = _hashDataStation.containsKey(s.id));
  }

  Future<void> _downloadStationData() async {
    DateTime lastDataDowload;
    var lastDateData =
        DateTime.parse(_prefs.getString(_stationDataPrefs) ?? "19700101");
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

              lastDataDowload = dateTime;
              print("get data OK");
            }
          }
        }
      }
    }

    if (lastDataDowload != null) {
      _prefs.setString(_lastDataPrefs, lastDataDowload.toString());
    }
  }

  Future<void> _initStation() async {
    var stationUpdateDate = DateTime.parse(
            _prefs.getString(_lastDataPrefs) ?? DateTime.now().toString());
        _listStation = await DatabaseHelper.instance.getAllStation();
    if (_listStation.length == 0 ||
        stationUpdateDate.difference(DateTime.now()) > Duration(days: 90)) {
      final response = await http.get(
          'https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/postesNivo.json');

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var rest = data["features"] as List;

        for (var json in rest) {
          var st = json["properties"];
          if (st['ID'] != '') _listStation.add(Station.fromJson(st));
        }
        _listStation.sort((a, b) => a.name.compareTo(b.name));
        _listStation.forEach(
            (s) async => await DatabaseHelper.instance.insertStation(s));

        _prefs.setString(_lastDataPrefs, DateTime.now().toString());

        print("donwload station ok");
      } else {
        throw Exception('Failed to load station');
      }
    }
  }

  List<Station> getStations() {
    return _listStation;
  }

  List<DataStation> getDataOfStation(int id) {
    return _hashDataStation[id];
  }
}
