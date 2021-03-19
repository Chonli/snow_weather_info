import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:snow_weather_info/model/station.dart';

class DataAPI {
  final client = http.Client();

  Future<List<Station>> getStation() async {
    final List<Station> stations = [];
    final response = await client.get(
      'https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/postesNivo.json',
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      final rest = data['features'] as List<dynamic>;

      for (final json in rest) {
        final st = json['properties'] as Map<String, dynamic>;
        if (st['ID'] != '') {
          stations.add(Station.fromJson(st));
        }
      }

      print('donwload station ok');
      return stations;
    } else {
      throw Exception('Failed to load station');
    }
  }
}
