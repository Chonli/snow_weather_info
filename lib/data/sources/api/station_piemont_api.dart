import 'dart:convert';
import 'dart:developer' show log;

import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/api/api_client.dart';
import 'package:snow_weather_info/model/station.dart';

part 'station_piemont_api.g.dart';

@Riverpod(keepAlive: true)
StationPiemontApi stationPiemontApi(Ref ref) {
  final client = ref.watch(apiClientProvider);

  return StationPiemontApi(client);
}

class StationPiemontApi {
  const StationPiemontApi(this.client);

  final Client client;

  static const stationPiemontUrl =
      'https://utility.arpa.piemonte.it/api_realtime/pie_anag';

  Future<List<StationPiemont>> getStation() async {
    final List<StationPiemont> stations = [];
    final response = await client.get(Uri.parse(stationPiemontUrl));

    if (response.statusCode >= 300) {
      log('Erreur download station Piemont');
      return stations;
    }

    final jsonData = json.decode(response.body) as List<dynamic>;

    for (final station in jsonData) {
      if (station is Map<String, dynamic>) {
        final type = station['station_type'] as String;
        // Keep only Nivose station
        if (type.contains('N')) {
          log('type = $type');

          stations.add(StationPiemont.fromRemoteJson(station));
        }
      }
    }

    log('parse station ok');
    return stations;
  }
}
