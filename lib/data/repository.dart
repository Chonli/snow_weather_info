import 'dart:convert';
import 'package:snow_weather_info/model/station.dart';
import 'package:http/http.dart' as http;

//https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/nivo.20200114.csv

class Repository {
  List<Station> list;

  Future<bool> initData() async {
    final response = await http.get(
        'https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/postesNivo.json');

    if (response.statusCode == 200) {
      print(response.body);
      var data = json.decode(response.body);
      var rest = data["features"] as List;
      print(rest);
      list = rest
          .map<Station>((json) => Station.fromJson(json["properties"]))
          .toList();
    } else {
      return false;
    }
    return true;
  }

  List<Station> getStations() {
    return list;
  }
}
