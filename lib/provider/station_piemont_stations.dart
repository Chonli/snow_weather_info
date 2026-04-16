import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/repositories/station_piemont.dart';
import 'package:snow_weather_info/model/station.dart';

part 'station_piemont_stations.g.dart';

@Riverpod(keepAlive: true)
class StationPiemontStations extends _$StationPiemontStations {
  @override
  Future<List<StationPiemont>> build() async {
    final repo = ref.watch(stationDataRepositoryProvider);
    return await repo.getStation();
  }
}
