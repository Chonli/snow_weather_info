import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/data/preferences.dart';
import 'package:snow_weather_info/model/ski_resort.dart';
import 'package:snow_weather_info/modules/webcam/notifier.dart';

part 'favorite_notifier.g.dart';

@riverpod
class FavoriteSkiResort extends _$FavoriteSkiResort {
  @override
  FutureOr<List<SkiResort>> build() async {
    final favoriteSkiResorts = ref.read(favoritesSkiResortSettingsProvider);
    final tmpDatas = <SkiResort>[];
    final allSkiResorts = await ref.watch(skiResortsProvider.future);

    for (final skiresort in allSkiResorts) {
      if (favoriteSkiResorts.contains(skiresort.id)) {
        tmpDatas.add(skiresort);
      }
    }
    return tmpDatas..sort((r1, r2) => r1.name.compareTo(r2.name));
  }

  void addOrRemoveFavorite(SkiResort bera) {
    final currentData = state.valueOrNull ?? [];
    final tmpDatas = [...currentData];

    if (tmpDatas.contains(bera)) {
      tmpDatas.remove(bera);
    } else {
      tmpDatas.add(bera);
    }
    tmpDatas.sort((a, b) => a.name.compareTo(b.name));

    _persitFavoriteBERA(tmpDatas);
    state = AsyncData(tmpDatas);
  }

  void _persitFavoriteBERA(List<SkiResort> value) {
    ref
        .read(favoritesSkiResortSettingsProvider.notifier)
        .update(value.map<int>((skiResort) => skiResort.id).toList());
  }
}
