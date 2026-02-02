import 'dart:developer' show log;

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

  static const maxDaysFetch = 10;

  FutureOr<List<DataStation>> getDataStation() async {
    log('Fetching new data from API for last 10 days');
    final remoteDataStations = await stationDataApi.getStationDatas(
      maxDaysFetch: maxDaysFetch,
    );

    if (remoteDataStations.isEmpty) {
      final cachedDataStations = localData.allDataStations.read();
      final minDate = DateTime.now().subtract(Duration(days: maxDaysFetch));
      cachedDataStations.removeWhere((data) => data.date.isBefore(minDate));
      await localData.allDataStations.save(cachedDataStations);

      return cachedDataStations;
    } else {
      await localData.allDataStations.save(remoteDataStations);
      await localData.lastUpdate.save(DateTime.now());

      return remoteDataStations;
    }
  }
}
