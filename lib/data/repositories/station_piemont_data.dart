import 'dart:developer' show log;

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/repositories/station_piemont.dart';
import 'package:snow_weather_info/data/sources/api/station_piemont_data_api.dart';
import 'package:snow_weather_info/data/sources/data/station_data_local_data.dart';
import 'package:snow_weather_info/extensions/stations_data.dart';
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
  const new(
    this.stationPiemontDataApi,
    this.stationPiemontRepo,
    this.localData,
  );

  final StationPiemontDataApi stationPiemontDataApi;
  final StationPiemontRepository stationPiemontRepo;
  final StationDataLocalDataContainer localData;

  static const maxDaysFetch = 10;

  /// Piemonte data is published hourly; we only keep one measurement every
  /// [dataIntervalHours] hours to reduce stored/displayed data.
  static const dataIntervalHours = 6;

  FutureOr<List<DataStation>> getDataStation({DateTime? currentDate}) async {
    log('Fetching Piemonte data (repository)');
    final now = currentDate ?? DateTime.now();

    // Try fetch per station using the station repository list
    final stations = await stationPiemontRepo.getStations(currentDate: now);
    final stationCodes = stations.map((s) => s.id).toList();

    // Compute days to fetch based on lastUpdatePiemont in local data.
    final last = localData.lastUpdatePiemont.read();
    final daysSinceLast =
        last.isBefore(now.subtract(const Duration(days: maxDaysFetch)))
        ? maxDaysFetch
        : now.difference(last).inDays;

    final effectiveFetchDays = daysSinceLast <= 0
        ? 1
        : (daysSinceLast > maxDaysFetch ? maxDaysFetch : daysSinceLast);

    final fetched = await stationPiemontDataApi.getStationDatas(
      currentDate: now,
      stationCodes: stationCodes,
      maxDaysFetch: effectiveFetchDays,
    );

    // Keep only one measurement per station every [dataIntervalHours] hours.
    final results = fetched.onePerSlot(intervalHours: dataIntervalHours);

    // Merge results with cached local data (dedupe by id+date)
    final cachedDataStations = localData.allDataPiemontStations.read();
    if (cachedDataStations.isEmpty) {
      // no cache, save results directly
      await localData.allDataPiemontStations.save(results);
      await localData.lastUpdatePiemont.save(now);
      return results;
    }

    if (results.isNotEmpty) {
      final Map<String, DataStation> mergedMap = {};

      String keyOf(DataStation d) => '${d.id}::${d.date.toIso8601String()}';

      for (final c in cachedDataStations) {
        mergedMap[keyOf(c)] = c;
      }
      for (final r in results) {
        // prefer fetched value (overwrite cached)
        mergedMap[keyOf(r)] = r;
      }

      final merged = mergedMap.values.toList().onePerSlot(
        intervalHours: dataIntervalHours,
      );

      // prune very old entries beyond the global maxDaysFetch window to avoid unbounded growth
      final minDate = now.subtract(const Duration(days: maxDaysFetch));
      merged.removeWhere((d) => d.date.isBefore(minDate));

      await localData.allDataPiemontStations.save(merged);
      await localData.lastUpdatePiemont.save(now);

      return merged;
    }

    // fallback to cache (if no fresh results)
    final minDate = now.subtract(const Duration(days: maxDaysFetch));
    final cached = cachedDataStations
        .onePerSlot(intervalHours: dataIntervalHours)
        .where((data) => !data.date.isBefore(minDate))
        .toList();
    await localData.allDataPiemontStations.save(cached);

    return cached;
  }
}
