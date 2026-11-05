import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/core/cached_list.dart';
import 'package:snow_weather_info/data/sources/api/station_piemont_api.dart';
import 'package:snow_weather_info/data/sources/data/station_piemont_local_data.dart';
import 'package:snow_weather_info/model/station.dart';

part 'station_piemont.g.dart';

@Riverpod(keepAlive: true)
StationPiemontRepository stationPiemontRepository(Ref ref) {
  final api = ref.watch(stationPiemontApiProvider);
  final localData = ref.watch(stationPiemontLocalDataProvider);

  return StationPiemontRepository(api, localData);
}

class StationPiemontRepository {
  new(this.stationPiemontApi, this.localData)
    : _cache = CachedList<StationPiemont>(
        localData: localData.allStations,
        maxAge: const Duration(days: 15),
      );

  final StationPiemontApi stationPiemontApi;
  final StationPiemontLocalDataContainer localData;
  final CachedList<StationPiemont> _cache;

  Future<List<StationPiemont>> getStations({DateTime? currentDate}) {
    return _cache.refresh(
      fetch: (etag) => stationPiemontApi.getStations(etag: etag),
      now: currentDate,
    );
  }
}
