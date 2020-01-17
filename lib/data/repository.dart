import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:intl/intl.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:http/http.dart' as http;

//

class Repository {
  List<Station> listStation;
  List<DataStation> listDataStation;

  Future<bool> initData() async {
    try {
      await Future.wait([_initStation(), _initStationData()]);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> _initStationData() async {
    var nowStr = DateFormat('yyyyMMdd')
        .format(DateTime.now().subtract(Duration(days: 1)));
    var url =
        'https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/nivo.$nowStr.csv';
    print(url);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var cvsResult = const CsvToListConverter().convert(response.body,
          fieldDelimiter: ';', eol: '\n', shouldParseNumbers: false);

      if (cvsResult.length > 1) {
        cvsResult.removeAt(0);
        listDataStation = cvsResult.map<DataStation>((line) {
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
      listStation = rest
          .map<Station>((json) => Station.fromJson(json["properties"]))
          .toList();
    } else {
      throw Exception('Failed to load station');
    }
  }

  List<Station> getStations() {
    return listStation;
  }

  DataStation getDataOfStation(String id) {
    try {
      return listDataStation.firstWhere((d) => d.id == id);
    } catch (_) {
      return null;
    }
  }
}
