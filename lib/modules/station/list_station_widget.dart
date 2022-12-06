import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/core/notifier/preference.dart';
import 'package:snow_weather_info/core/widgets/app_sticky_header_view.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/modules/station/notifier.dart';
import 'package:snow_weather_info/modules/station/station_card.dart';

class ListStationWidget extends StatelessWidget {
  const ListStationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProxyProvider0<StationNotifier>(
          create: (_) => StationNotifier(),
          update: (context, old) => old!
            ..dataNotifier = context.watch<DataNotifier>()
            ..displayNoDataStation =
                context.watch<PreferenceNotifier>().viewNoDataStation
            ..init(),
        ),
      ],
      child: const _InnerWidget(),
    );
  }
}

class _InnerWidget extends StatelessWidget {
  const _InnerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<StationNotifier>();

    return CustomScrollView(
      slivers: [
        // recherche
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              onChanged: (value) {
                context.read<StationNotifier>().search(value);
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
        if (notifier.favoriteStations.isNotEmpty)
          SliverStickyHeader(
            header: AppStickyHeaderView(
              text: notifier.favoriteStations.length == 1
                  ? 'Favorite'
                  : 'Favorites',
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) =>
                    StationCard(station: notifier.favoriteStations[index]),
                childCount: notifier.favoriteStations.length,
              ),
            ),
          ),
        ...notifier.stations.entries.map(
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
