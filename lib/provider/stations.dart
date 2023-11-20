import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/station_api.dart';
import 'package:snow_weather_info/model/station.dart';

part 'stations.g.dart';

@riverpod
class Stations extends _$Stations {
  @override
  FutureOr<List<Station>> build() {
    return ref.watch(apiStationProvider).asData?.value ?? [];
  }

  // Future<List<Station>> _getStations({bool forceUpdate = false}) async {
  //   final stationUpdateDate = ref.read(lastStationSettingsProvider);
  //   List<Station> stations =
  //        ref.watch(databaseHelperProvider).getAllStation();
  //   if (forceUpdate ||
  //       stations.isEmpty ||
  //       stationUpdateDate.difference(DateTime.now()) >
  //           const Duration(days: 15)) {
  //     stations = ref.watch(apiStationProvider).asData?.value ?? [];

  //     await Future.forEach(
  //       stations,
  //       (s) => ref.watch(databaseHelperProvider).insertStation(s),
  //     );

  //     ref.read(lastStationSettingsProvider.notifier).updateDate(DateTime.now());
  //   }

  //   return stations;
  // }
}
