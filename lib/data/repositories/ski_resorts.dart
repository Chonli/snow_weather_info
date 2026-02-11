import 'dart:developer' show log;

import 'package:riverpod_annotation/riverpod_annotation.dart';
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
  const SkiResortsRepository(this.skiResortApi, this.localData);

  final SkiResortApi skiResortApi;
  final SkiResortLocalDataContainer localData;

  FutureOr<List<SkiResort>> getSkiResorts({
    DateTime? currentDate,
  }) async {
    final lastUpdate = localData.lastUpdate.read();
    final now = currentDate ?? DateTime.now();

    // if last update more 1 day ago
    if (now.difference(lastUpdate) >= const Duration(seconds: 1)) {
      final onlineSkiResorts = await skiResortApi.getSkiResorts();

      if (onlineSkiResorts.isNotEmpty) {
        log('donwload webcam from gist');
        await localData.skiResorts.save(onlineSkiResorts);
        await localData.lastUpdate.save(now);
        return onlineSkiResorts;
      }
    }

    // try to use cache
    final cacheSkiResorts = localData.skiResorts.read();
    if (cacheSkiResorts.isNotEmpty) {
      return cacheSkiResorts;
    }

    // use asset in fallback
    return skiResortApi.getSkiResortsFromAsset();
  }
}
