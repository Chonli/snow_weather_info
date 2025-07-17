import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:snow_weather_info/core/widgets/app_sticky_header_view.dart';
import 'package:snow_weather_info/data/sources/data/preferences.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/modules/station/station_card.dart';
import 'package:snow_weather_info/provider/all_station.dart';
import 'package:snow_weather_info/provider/favorite_station.dart';
import 'package:snow_weather_info/provider/station_data.dart';

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
class _FilteredStations extends _$FilteredStations {
  @override
  Map<String, List<AbstractStation>> build() {
    final search = ref.watch(_searchProvider);
    final showNoDataStation = ref.watch(showNoDataStationSettingsProvider);
    final allStations = ref.watch(allStationsProvider).valueOrNull ?? [];

    final stations =
        allStations
            .where(
              (station) =>
                  showNoDataStation ||
                  station is Nivose ||
                  (station is Station &&
                      ref
                          .watch(stationDataProvider.notifier)
                          .hasData(station.id)),
            )
            .where(
              (station) =>
                  search.isEmpty ||
                  station.name.toLowerCase().contains(
                    search.toLowerCase(),
                  ),
            )
            .toList()
          ..sort(
            (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
          );

    final tmpGroupList = <String, List<AbstractStation>>{};
    for (final s in stations) {
      if (tmpGroupList[s.name[0]] == null) {
        tmpGroupList[s.name[0]] = <AbstractStation>[];
      }

      tmpGroupList[s.name[0]]?.add(s);
    }

    //sort keys
    return Map.fromEntries(
      tmpGroupList.entries.toList()..sort((a, b) => a.key.compareTo(b.key)),
    );
  }
}

class ListStationWidget extends ConsumerWidget {
  const ListStationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        const _FavoriteStationsWidget(),
        const _FilteredStationsWidget(),
      ],
    );
  }
}

class _FavoriteStationsWidget extends ConsumerWidget {
  const _FavoriteStationsWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteStation = ref.watch(favoriteStationProvider);

    return favoriteStation.when(
      data: (data) {
        if (data.isEmpty) {
          return const SliverToBoxAdapter();
        }

        return SliverStickyHeader(
          header: AppStickyHeaderView(
            text: data.length == 1 ? 'Favori' : 'Favoris',
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => StationCard(
                station: data[index],
              ),
              childCount: data.length,
            ),
          ),
        );
      },
      error: (_, _) => const SliverToBoxAdapter(),
      loading: () => const SliverToBoxAdapter(),
    );
  }
}

class _FilteredStationsWidget extends ConsumerWidget {
  const _FilteredStationsWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredStations = ref.watch(_filteredStationsProvider);

    if (filteredStations.isEmpty) {
      return const SliverToBoxAdapter();
    }

    return MultiSliver(
      children: filteredStations.entries
          .map(
            (e) => SliverStickyHeader(
              header: AppStickyHeaderView(text: e.key),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => StationCard(station: e.value[index]),
                  childCount: e.value.length,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
