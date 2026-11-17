import 'package:riverpod_annotation/riverpod_annotation.dart';
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
  /// [refreshInterval], puis le fichier complet est re-téléchargé (le serveur
  /// ne supporte aucune revalidation conditionnelle). Seules les mesures
  /// nouvelles ou modifiées sont écrites en base.
  static const refreshInterval = Duration(hours: 3);

  Future<List<DataStation>> getDataStation({DateTime? currentDate}) async {
    final now = currentDate ?? DateTime.now();
    final metadata = cache.metadata;

    if (metadata.isStale(maxAge: refreshInterval, now: now)) {
      final result = await stationDataApi.getStationDatas(
        maxDaysFetch: maxDaysFetch,
        currentDate: now,
      );
      if (result != null) {
        await cache.merge(
          result,
          pruneBefore: now.subtract(const Duration(days: maxDaysFetch)),
        );
        await cache.saveMetadata(metadata.copyWith(lastSync: now));
      }
      // échec réseau : on garde le cache tel quel
    }

    return await cache.read(
      from: now.subtract(const Duration(days: maxDaysFetch)),
    );
  }
}
