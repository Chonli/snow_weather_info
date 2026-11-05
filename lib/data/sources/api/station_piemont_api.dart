import 'dart:convert';
import 'dart:developer' show log;

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/core/cached_list.dart';
import 'package:snow_weather_info/data/sources/api/api_client.dart';
import 'package:snow_weather_info/model/station.dart';

part 'station_piemont_api.g.dart';

@Riverpod(keepAlive: true)
StationPiemontApi stationPiemontApi(Ref ref) {
  final client = ref.watch(apiClientProvider);

  return StationPiemontApi(client);
}

class StationPiemontApi {
  const new(this.apiClient);

  final ApiClient apiClient;

  static const stationPiemontUrl =
      'https://utility.arpa.piemonte.it/api_realtime/pie_anag';

  Future<RemoteResult<List<StationPiemont>>?> getStations({
    String? etag,
  }) async {
    try {
      return await apiClient.getConditional<List<StationPiemont>>(
        Uri.parse(stationPiemontUrl),
        etag: etag,
        decode: (response) {
          final stations = <StationPiemont>[];
          final jsonData = json.decode(response.body) as List<dynamic>;

          for (final station in jsonData) {
            if (station is Map<String, dynamic>) {
              final type = station['station_type'] as String;
              // Keep only Nivose station
              if (type.contains('N')) {
                stations.add(StationPiemont.fromRemoteJson(station));
              }
            }
          }

          return stations;
        },
      );
    } on Exception catch (error) {
      log('Erreur download station Piemont: $error');
      return null;
    }
  }
}
