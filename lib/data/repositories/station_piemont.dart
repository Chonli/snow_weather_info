import 'dart:developer' show log;

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/api/station_piemont_api.dart';
import 'package:snow_weather_info/data/sources/data/station_piemont_local_data.dart';
import 'package:snow_weather_info/model/station.dart';

part 'station_piemont.g.dart';

@Riverpod(keepAlive: true)
StationPiemontRepository stationPiemontRepository(Ref ref) {
  final api = ref.watch(stationPiemontApiProvider);
  final localData = ref.watch(stationPiemontLocalDataProvider);

  return StationPiemontRepository(api, localData);
}

class StationPiemontRepository {
  const StationPiemontRepository(
    this.stationPiemontApi,
    this.localData,
  );

  final StationPiemontApi stationPiemontApi;
  final StationPiemontLocalDataContainer localData;

  static const maxDaysBeforeUpdate = 15;

  FutureOr<List<StationPiemont>> getStations({DateTime? currentDate}) async {
    final cachedDataStations = localData.allStations.read();
    final lastUpdate = localData.lastUpdate.read();
    final now = currentDate ?? DateTime.now();

    if (cachedDataStations.isEmpty ||
        lastUpdate.isBefore(
          now.subtract(Duration(days: maxDaysBeforeUpdate)),
        )) {
      log('Update station if cache empty or too old (15 days)');
      final remoteDataStations = await stationPiemontApi.getStations();
      await localData.allStations.save(remoteDataStations);
      await localData.lastUpdate.save(now);

      return remoteDataStations;
    }

    return cachedDataStations;
  }
}
