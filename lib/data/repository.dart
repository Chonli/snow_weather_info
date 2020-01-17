import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:intl/intl.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:http/http.dart' as http;

//

class Repository {
  bool _isInitialise = false;
  List<Station> _listStation;
  List<DataStation> _listDataStation;

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
    var nowStr = DateFormat('yyyyMMdd')
        .format(DateTime.now().subtract(Duration(days: 1, hours: 9)));
    var url =
        'https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/nivo.$nowStr.csv';
    print(url);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var cvsResult = const CsvToListConverter().convert(response.body,
          fieldDelimiter: ';', eol: '\n', shouldParseNumbers: false);

      if (cvsResult.length > 1) {
        cvsResult.removeAt(0);
        _listDataStation = cvsResult.map<DataStation>((line) {
          return DataStation.fromList(line);
        }).toList();
        print("get data OK");
      } else {
        throw Exception('Failed to parse data of stations');
      }
    } else {
      throw Exception('Failed to load data of station');
    }
  }

  Future<void> _initStation() async {
    final response = await http.get(
        'https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/postesNivo.json');

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var rest = data["features"] as List;
      _listStation = rest
          .map<Station>((json) => Station.fromJson(json["properties"]))
          .toList();
    } else {
      throw Exception('Failed to load station');
    }
  }

  void _updateHasData() {
    for (var station in _listStation) {
      try {
        _listDataStation.firstWhere((d) => d.id == station.id);
        station.hasData = true;
      } catch (_) {}
    }
  }

  List<Station> getStations() {
    return _listStation;
  }

  DataStation getDataOfStation(String id) {
    try {
      return _listDataStation.firstWhere((d) => d.id == id);
    } catch (_) {
      return null;
    }
  }
}
