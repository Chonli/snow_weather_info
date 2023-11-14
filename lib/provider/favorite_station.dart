import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/constant_data_list.dart';
import 'package:snow_weather_info/data/sources/preferences.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/provider/stations.dart';

part 'favorite_station.g.dart';

@Riverpod(keepAlive: true)
class FavoriteStation extends _$FavoriteStation {
  @override
  List<AbstractStation> build() {
    final favorites = ref.watch(favoritesStationSettingsProvider);
    final stations = ref.watch(stationsProvider).asData?.value ?? [];
    final tmpDatas = <AbstractStation>[];

    for (final s in stations) {
      if (favorites.contains(s.id.toString())) {
        tmpDatas.add(s);
      }
    }

    for (final s in ConstantDatalist.listNivose) {
      if (favorites.contains(s.codeMF)) {
        tmpDatas.add(s);
      }
    }

    return tmpDatas;
  }

  void addOrRemoveFavoriteStation(AbstractStation station) {
    final tmpDatas = [...state];

    if (tmpDatas.contains(station)) {
      tmpDatas.remove(station);
    } else {
      tmpDatas.add(station);
    }
    tmpDatas.sort((a, b) => a.name.compareTo(b.name));

    _persitFavoriteStation(tmpDatas);
    state = tmpDatas;
  }

  void _persitFavoriteStation(List<AbstractStation> value) {
    ref.read(favoritesStationSettingsProvider.notifier).update(
          value.map<String>(
            (s) {
              if (s is Station) {
                return s.id.toString();
              } else if (s is Nivose) {
                return s.codeMF;
              }

              return '';
            },
          ).toList(),
        );
  }
}
