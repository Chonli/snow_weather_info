import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/core/widgets/app_sticky_header_view.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/modules/station/station_card.dart';
import 'package:snow_weather_info/provider/all_station.dart';
import 'package:snow_weather_info/provider/favorite_station.dart';

part 'list_station_widget.g.dart';

@riverpod
class _Search extends _$Search {
  @override
  String build() {
    return '';
  }

  void search(String value) {
    state = value;
  }
}

@riverpod
class _FilteredSations extends _$FilteredSations {
  @override
  Map<String, List<AbstractStation>> build() {
    final allStations = ref.watch(allStationsProvider);
    final search = ref.watch(_searchProvider);

    final stations = allStations
        .where(
          (station) => search.isEmpty || station.name.contains(search),
        )
        .toList();

    final Map<String, List<AbstractStation>> tmpGroupList = {};
    for (var s in stations) {
      if (tmpGroupList[s.name[0]] == null) {
        tmpGroupList[s.name[0]] = <AbstractStation>[];
      }

      tmpGroupList[s.name[0]]?.add(s);
    }

    return tmpGroupList;
  }
}

class ListStationWidget extends ConsumerWidget {
  const ListStationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredSations = ref.watch(_filteredSationsProvider);
    final favoriteStation = ref.watch(favoriteStationProvider);

    return CustomScrollView(
      slivers: [
        // recherche
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              onChanged: (value) {
                ref.read(_searchProvider.notifier).search(value);
              },
              decoration: const InputDecoration(
                labelText: 'Recherche',
                hintText: 'Recherche',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        ),
        // favorite
        if (favoriteStation.isNotEmpty)
          SliverStickyHeader(
            header: AppStickyHeaderView(
              text: favoriteStation.length == 1 ? 'Favorite' : 'Favorites',
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => StationCard(
                  station: favoriteStation[index],
                ),
                childCount: favoriteStation.length,
              ),
            ),
          ),
        ...filteredSations.entries.map(
          (e) => SliverStickyHeader(
            header: AppStickyHeaderView(text: e.key),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => StationCard(station: e.value[index]),
                childCount: e.value.length,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
