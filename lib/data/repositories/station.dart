import 'dart:developer' show log;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/api/station_api.dart';
import 'package:snow_weather_info/data/sources/data/station_local_data.dart';
import 'package:snow_weather_info/model/station.dart';

part 'station.g.dart';

@Riverpod(keepAlive: true)
StationRepository stationRepository(Ref ref) {
  final api = ref.watch(stationApiProvider);
  final localData = ref.watch(stationLocalDataProvider);

  return StationRepository(api, localData);
}

class StationRepository {
  const StationRepository(
    this.stationApi,
    this.localData,
  );

  final StationApi stationApi;
  final StationLocalDataContainer localData;

  FutureOr<List<Station>> getStation({bool forceUpdate = false}) async {
    List<Station> stations = localData.allStations.read();
    final now = DateTime.now();
    final lastUpdate = localData.lastUpdate.read();

    if (forceUpdate ||
        stations.isEmpty ||
        lastUpdate.difference(now) > const Duration(days: 15)) {
      log('Fetching new data from API');
      stations = await stationApi.getStations();

      await localData.allStations.save(stations);
      await localData.lastUpdate.save(now);
    }

    return stations;
  }
}
