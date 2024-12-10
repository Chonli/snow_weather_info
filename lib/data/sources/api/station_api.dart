import 'dart:convert';
import 'dart:developer' show log;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/api/api_client.dart';
import 'package:snow_weather_info/model/station.dart';

part 'station_api.g.dart';

@Riverpod(keepAlive: true)
StationApi stationApi(Ref ref) {
  final client = ref.watch(apiClientProvider);

  return StationApi(client);
}

class StationApi {
  const StationApi(this.client);

  final Client client;

  Future<List<Station>> getStation() async {
    final List<Station> stations = [];

    final response = await client.get(
      Uri.parse(
        'https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/postesNivo.json',
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      final rest = data['features'] as List<dynamic>;

      for (final json in rest) {
        if (json is Map<String, dynamic>) {
          final st = json['properties'] as Map<String, dynamic>?;
          if (st != null && st['ID'] != '') {
            stations.add(Station.fromJson(st));
          }
        }
      }

      log('donwload station ok');

      return stations;
    } else {
      throw Exception('Failed to load station');
    }
  }
}
