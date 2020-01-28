import 'dart:collection';
import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:intl/intl.dart';
import 'package:snow_weather_info/data/database_helper.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:http/http.dart' as http;

//

class Repository {
  bool _isInitialise = false;
  List<Station> _listStation;
  HashMap<String, List<DataStation>> _hashDataStation;

  Future<bool> initData() async {
    if (!_isInitialise) {
      try {
        await Future.wait([_initStation(), _initStationData()]);
        _isInitialise = true;
        _updateHasData();
      } catch (e) {
        print("init error : " + e.toString());
      }
    }
    return _isInitialise;
  }

  Future<void> _initStationData() async {
    _hashDataStation = HashMap();
    for (int i = 0; i < 7; ++i) {
      var nowStr = DateFormat('yyyyMMdd')
          .format(DateTime.now().subtract(Duration(days: i)));
      var url =
          'https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/nivo.$nowStr.csv';
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

            listData.forEach((d) {
              if (!_hashDataStation.containsKey(d.id)) {
                _hashDataStation[d.id] = List<DataStation>();
              }
              _hashDataStation[d.id].add(d);
            });

            print("get data OK");
          }
        }
      }
    }
    //sort list data by date
    _hashDataStation.values
        .forEach((l) => l.sort((a, b) => b.date.compareTo(a.date)));
  }

  Future<void> _initStation() async {
    _listStation = await DatabaseHelper.instance.getAllStation();
    if (_listStation.length == 0) {
      final response = await http.get(
          'https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/postesNivo.json');

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var rest = data["features"] as List;
        _listStation = rest
            .map<Station>((json) => Station.fromJson(json["properties"]))
            .toList();
        _listStation.sort((a, b) => a.name.compareTo(b.name));
        _listStation.forEach(
            (s) async => await DatabaseHelper.instance.insertStation(s));
      } else {
        throw Exception('Failed to load station');
      }
    }
  }

  void _updateHasData() {
    for (var station in _listStation) {
      station.hasData = _hashDataStation.containsKey(station.id);
    }
  }

  List<Station> getStations() {
    return _listStation;
  }

  List<DataStation> getDataOfStation(String id) {
    return _hashDataStation[id];
  }
}
