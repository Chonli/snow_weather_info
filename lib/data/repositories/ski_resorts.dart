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

  FutureOr<List<SkiResort>> getSkiResorts() async {
    final cacheSkiResorts = localData.skiResorts.read();

    if (cacheSkiResorts.isNotEmpty) {
      // TODO(apa): add search update on web
      return cacheSkiResorts;
    }

    return skiResortApi.getSkiResortsFromAsset();
  }
}
