import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/preferences.dart';
import 'package:snow_weather_info/data/webcams.dart';
import 'package:snow_weather_info/model/ski_resort.dart';

part 'favorite_notifier.g.dart';

@riverpod
class FavoriteSkiResort extends _$FavoriteSkiResort {
  @override
  List<SkiResort> build() {
    final listSkiResort = ref.read(favoritesSkiResortSettingsProvider);
    final tmpDatas = <SkiResort>[];
    for (final skiresort in ConstSkiResorts.webcamsByResort) {
      if (listSkiResort.contains(skiresort.id)) {
        tmpDatas.add(skiresort);
      }
    }
    return tmpDatas..sort((r1, r2) => r1.name.compareTo(r2.name));
  }

  void addOrRemoveFavorite(SkiResort bera) {
    final tmpDatas = [...state];

    if (tmpDatas.contains(bera)) {
      tmpDatas.remove(bera);
    } else {
      tmpDatas.add(bera);
    }
    tmpDatas.sort((a, b) => a.name.compareTo(b.name));

    _persitFavoriteBERA(tmpDatas);
    state = tmpDatas;
  }

  void _persitFavoriteBERA(List<SkiResort> value) {
    ref.read(favoritesSkiResortSettingsProvider.notifier).update(
          value
              .map<int>(
                (skiResort) => skiResort.id,
              )
              .toList(),
        );
  }
}
