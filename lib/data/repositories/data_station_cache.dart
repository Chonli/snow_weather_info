import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/data/data_station_cache.dart';
import 'package:snow_weather_info/data/sources/data/station_data_local_data.dart';

part 'data_station_cache.g.dart';

@Riverpod(keepAlive: true)
DataStationCache franceDataStationCache(Ref ref) {
  return DataStationCache(
    ref.watch(stationDataLocalDataProvider).allDataStations,
    source: 'france',
  );
}

@Riverpod(keepAlive: true)
DataStationCache piemontDataStationCache(Ref ref) {
  return DataStationCache(
    ref.watch(stationDataLocalDataProvider).allDataPiemontStations,
    source: 'piemont',
  );
}
