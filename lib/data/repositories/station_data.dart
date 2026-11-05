import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/core/cached_list.dart';
import 'package:snow_weather_info/data/repositories/data_station_cache.dart';
import 'package:snow_weather_info/data/sources/api/station_data_api.dart';
import 'package:snow_weather_info/data/sources/data/data_station_cache.dart';
import 'package:snow_weather_info/model/data_station.dart';

part 'station_data.g.dart';

@Riverpod(keepAlive: true)
StationDataRepository stationDataRepository(Ref ref) {
  final api = ref.watch(stationDataApiProvider);
  final cache = ref.watch(franceDataStationCacheProvider);

  return StationDataRepository(api, cache);
}

class StationDataRepository {
  const new(this.stationDataApi, this.cache);

  final StationDataApi stationDataApi;
  final DataStationCache cache;

  static const maxDaysFetch = 10;

  /// Le CSV source n'est pas filtrable : le cache est considéré frais pendant
  /// [refreshInterval] (et tant que l'ETag du serveur est inchangé, via une
  /// requête conditionnelle sans transfert de corps). Seules les mesures
  /// nouvelles ou modifiées sont écrites en base.
  static const refreshInterval = Duration(hours: 3);

  Future<List<DataStation>> getDataStation({DateTime? currentDate}) async {
    final now = currentDate ?? DateTime.now();
    final metadata = cache.metadata;

    if (metadata.isStale(maxAge: refreshInterval, now: now)) {
      final result = await stationDataApi.getStationDatas(
        maxDaysFetch: maxDaysFetch,
        currentDate: now,
        etag: metadata.etag,
      );
      switch (result) {
        case final RemoteResult<List<DataStation>> remote
            when remote.notModified:
          await cache.saveMetadata(metadata.copyWith(lastSync: now));
        case final RemoteResult<List<DataStation>> remote:
          await cache.merge(
            remote.items ?? const [],
            pruneBefore: now.subtract(const Duration(days: maxDaysFetch)),
          );
          await cache.saveMetadata(
            metadata.copyWith(lastSync: now, etag: remote.etag),
          );
        case null:
          break;
      }
    }

    return await cache.read(
      from: now.subtract(const Duration(days: maxDaysFetch)),
    );
  }
}
