import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/database_helper.dart';
import 'package:snow_weather_info/data/sources/preferences.dart';
import 'package:snow_weather_info/data/sources/station_api.dart';
import 'package:snow_weather_info/model/station.dart';

part 'stations.g.dart';

@Riverpod(keepAlive: true)
class Stations extends _$Stations {
  @override
  FutureOr<List<Station>> build() {
    return _getStations(forceUpdate: true);
  }

  Future<List<Station>> _getStations({bool forceUpdate = false}) async {
    final stationUpdateDate = ref.read(lastStationSettingsProvider);
    List<Station> stations =
        await ref.watch(databaseHelperProvider).getAllStation();
    if (forceUpdate ||
        stations.isEmpty ||
        stationUpdateDate.difference(DateTime.now()) >
            const Duration(days: 15)) {
      stations = await ref.watch(stationAPIProvider).getStation();

      await Future.forEach(
        stations,
        (s) => ref.watch(databaseHelperProvider).insertStation(s),
      );

      ref.read(lastStationSettingsProvider.notifier).updateDate(DateTime.now());
    }

    return stations;
  }
}
