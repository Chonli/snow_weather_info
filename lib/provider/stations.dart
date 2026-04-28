import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/repositories/station.dart';
import 'package:snow_weather_info/model/station.dart';

part 'stations.g.dart';

@riverpod
class Stations extends _$Stations {
  @override
  FutureOr<List<Station>> build() {
    final stationRepo = ref.watch(stationRepositoryProvider);
    return stationRepo.getStations();
  }
}
