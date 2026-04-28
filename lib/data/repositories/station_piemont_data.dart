import 'dart:developer' show log;

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/repositories/station_piemont.dart';
import 'package:snow_weather_info/data/sources/api/station_piemont_data_api.dart';
import 'package:snow_weather_info/data/sources/data/station_data_local_data.dart';
import 'package:snow_weather_info/model/data_station.dart';

part 'station_piemont_data.g.dart';

@Riverpod(keepAlive: true)
StationPiemontDataRepository stationPiemontDataRepository(Ref ref) {
  final api = ref.watch(stationPiemontDataApiProvider);
  final stationRepo = ref.watch(stationPiemontRepositoryProvider);
  final localData = ref.watch(stationDataLocalDataProvider);
  return StationPiemontDataRepository(api, stationRepo, localData);
}

class StationPiemontDataRepository {
  const StationPiemontDataRepository(
    this.stationPiemontDataApi,
    this.stationPiemontRepo,
    this.localData,
  );

  final StationPiemontDataApi stationPiemontDataApi;
  final StationPiemontRepository stationPiemontRepo;
  final StationDataLocalDataContainer localData;

  static const maxDaysFetch = 10;

  FutureOr<List<DataStation>> getDataStation({DateTime? currentDate}) async {
    log('Fetching Piemonte data (repository)');
    final now = currentDate ?? DateTime.now();

    // Try fetch per station using the station repository list
    final stations = await stationPiemontRepo.getStations(
      currentDate: currentDate,
    );
    final stationCodes = stations.map((s) => s.id).toList();

    final results = <DataStation>[];

    // Iterate sequentially to avoid overloading remote api. Could be parallelized in batches.
    for (final code in stationCodes) {
      final datas = await stationPiemontDataApi.getStationDatas(
        currentDate: currentDate,
        stationCodes: [code],
        maxDaysFetch: maxDaysFetch,
      );
      results.addAll(datas);
    }

    if (results.isNotEmpty) {
      // save to local cache and update last update time
      await localData.allDataStations.save(results);
      await localData.lastUpdate.save(now);

      return results;
    }

    // fallback to cache
    final cachedDataStations = localData.allDataStations.read();
    final minDate = now.subtract(Duration(days: maxDaysFetch));
    cachedDataStations.removeWhere((data) => data.date.isBefore(minDate));
    await localData.allDataStations.save(cachedDataStations);

    return cachedDataStations;
  }
}
