import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/core/cached_list.dart';
import 'package:snow_weather_info/data/sources/api/ski_resort.dart';
import 'package:snow_weather_info/data/sources/data/ski_resort_local_data.dart';
import 'package:snow_weather_info/model/ski_resort.dart';

part 'ski_resorts.g.dart';

@Riverpod(keepAlive: true)
SkiResortsRepository skiResortsRepository(Ref ref) {
  final api = ref.watch(skiResortApiProvider);
  final localData = ref.watch(skiResortLocalDataProvider);

  return SkiResortsRepository(api, localData);
}

class SkiResortsRepository {
  new(this.skiResortApi, this.localData)
    : _cache = CachedList<SkiResort>(
        localData: localData.skiResorts,
        maxAge: const Duration(days: 1),
        onError: skiResortApi.getSkiResortsFromAsset,
      );

  final SkiResortApi skiResortApi;
  final SkiResortLocalDataContainer localData;
  final CachedList<SkiResort> _cache;

  Future<List<SkiResort>> getSkiResorts({DateTime? currentDate}) {
    return _cache.refresh(
      fetch: (etag) async {
        final result = await skiResortApi.getSkiResorts(etag: etag);
        if (result == null) return null;
        // un payload vide n'est jamais accepté : il écraserait le cache
        if (!result.notModified && (result.items?.isEmpty ?? true)) return null;

        return result;
      },
      now: currentDate,
    );
  }
}
