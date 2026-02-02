import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/api/station_api.dart';
import 'package:snow_weather_info/model/station.dart';

part 'station.g.dart';

@Riverpod(keepAlive: true)
StationRepository stationRepository(Ref ref) {
  final api = ref.watch(stationApiProvider);

  return StationRepository(api);
}

class StationRepository {
  const StationRepository(
    this.stationApi,
  );

  final StationApi stationApi;

  FutureOr<List<Station>> getStation({bool forceUpdate = false}) async {
    return stationApi.getStations();
  }
}
