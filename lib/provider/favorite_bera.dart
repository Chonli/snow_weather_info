import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/constant_data_list.dart';
import 'package:snow_weather_info/data/sources/preferences.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';

part 'favorite_bera.g.dart';

@Riverpod(keepAlive: true)
class FavoriteBera extends _$FavoriteBera {
  @override
  List<AvalancheBulletin> build() {
    final listBERA = ref.read(favoritesBERASettingsProvider);
    final tmpDatas = <AvalancheBulletin>[];
    for (final bera in ConstantDatalist.listAvalancheBulletin) {
      if (listBERA.contains(bera.massifName)) {
        tmpDatas.add(bera);
      }
    }
    return tmpDatas;
  }

  void addOrRemoveFavoriteBERA(AvalancheBulletin bera) {
    final tmpDatas = [...state];

    if (tmpDatas.contains(bera)) {
      tmpDatas.remove(bera);
    } else {
      tmpDatas.add(bera);
    }
    tmpDatas.sort((a, b) => a.massifName.compareTo(b.massifName));

    _persitFavoriteBERA(tmpDatas);
    state = tmpDatas;
  }

  void _persitFavoriteBERA(List<AvalancheBulletin> value) {
    ref.read(favoritesBERASettingsProvider.notifier).update(
          value
              .map<String>(
                (bera) => bera.massifName,
              )
              .toList(),
        );
  }
}
