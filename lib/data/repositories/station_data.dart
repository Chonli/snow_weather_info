import 'dart:developer' show log;
import 'dart:math' show min;

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/api/station_data_api.dart';
import 'package:snow_weather_info/data/sources/data/station_data_local_data.dart';
import 'package:snow_weather_info/model/data_station.dart';

part 'station_data.g.dart';

@Riverpod(keepAlive: true)
StationDataRepository stationDataRepository(Ref ref) {
  final api = ref.watch(stationDataApiProvider);
  final localData = ref.watch(stationDataLocalDataProvider);

  return StationDataRepository(api, localData);
}

class StationDataRepository {
  const StationDataRepository(
    this.stationDataApi,
    this.localData,
  );

  final StationDataApi stationDataApi;
  final StationDataLocalDataContainer localData;

  static const _maxCacheDays = 12;

  FutureOr<List<DataStation>> getDataStation() async {
    final cacheDataStations = localData.allDataStations.read();
    final lastUpdate = localData.lastUpdate.read();
    final diffDays = min(DateTime.now().difference(lastUpdate).inDays, 7);

    log('Fetching new data from API for last $diffDays days');
    final remoteDataStations =
        await stationDataApi.getStationDatas(maxDaysFetch: diffDays);

    final allDataStations = await compute(
      StationDataRepository._mergeStations,
      (
        cacheDataStations: cacheDataStations,
        remoteDataStations: remoteDataStations,
      ),
    );

    await localData.allDataStations.save(allDataStations);
    await localData.lastUpdate.save(allDataStations.lastDataUpdate);

    return allDataStations;
  }

  static List<DataStation> _mergeStations(
    ({
      List<DataStation> cacheDataStations,
      List<DataStation> remoteDataStations,
    }) param,
  ) {
    if (param.remoteDataStations.isEmpty) {
      return param.cacheDataStations;
    }

    // to keep only last x days data
    final maxDateCache = DateTime.now().subtract(
      const Duration(days: _maxCacheDays),
    );

    final mergedStationsMap = {
      for (final data in param.remoteDataStations) (data.id, data.date): data,
    };

    for (final data in param.cacheDataStations) {
      if (mergedStationsMap[(data.id, data.date)] == null &&
          data.date.isAfter(maxDateCache)) {
        mergedStationsMap[(data.id, data.date)] = data;
      }
    }
    return mergedStationsMap.values.toList();
  }
}

extension _DataStationDataStationsExtension on List<DataStation> {
  DateTime get lastDataUpdate {
    if (isEmpty) {
      return DateTime(0);
    }

    return map((station) => station.date)
        .reduce((a, b) => a.isAfter(b) ? a : b);
  }
}
