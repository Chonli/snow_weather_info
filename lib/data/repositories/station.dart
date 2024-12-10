import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/core/local_database.dart';
import 'package:snow_weather_info/data/sources/api/station_api.dart';
import 'package:snow_weather_info/data/sources/data/preferences.dart';
import 'package:snow_weather_info/data/sources/data/station_local_data.dart';
import 'package:snow_weather_info/model/station.dart';

part 'station.g.dart';

@Riverpod(keepAlive: true)
StationRepository stationRepository(Ref ref) {
  final api = ref.watch(stationApiProvider);
  final lastUpdate = ref.watch(lastStationSettingsProvider);
  final localData = ref.watch(stationLocalDataProvider);

  return StationRepository(api, localData, lastUpdate);
}

class StationRepository {
  const StationRepository(
    this.stationApi,
    this.localData,
    this.lastUpdate,
  );

  final StationApi stationApi;
  final DateTime lastUpdate;
  final LocalDataBase<Station> localData;

  Future<List<Station>> getStation({bool forceUpdate = false}) async {
    List<Station> stations = []; // localData.load();

    if (forceUpdate ||
        stations.isEmpty ||
        lastUpdate.difference(DateTime.now()) > const Duration(days: 15)) {
      stations = await stationApi.getStation();

      await Future.forEach(
        stations,
        (station) => localData.load(key: station.id.toString()).save(station),
      );

      //ref.read(lastStationSettingsProvider.notifier).updateDate(DateTime.now());
    }

    return stations;
  }
}
