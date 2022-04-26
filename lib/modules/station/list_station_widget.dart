import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/core/notifier/preference.dart';
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
        )
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
            header: _HeaderView(
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
            header: _HeaderView(text: e.key),
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
    //   strList: notifier.stations.map((d) => d.name).toList(),
    //   highlightTextStyle: TextStyle(
    //     color: Theme.of(context).primaryColor,
    //   ),
    //   showPreview: true,
    //   itemBuilder: (context, index) {
    //     return StationCard(station: notifier.stations[index]);
    //   },
    //   indexedHeight: (i) {
    //     return 100;
    //   },
    //   headerWidgetList: <AlphabetScrollListHeader>[
    //     AlphabetScrollListHeader(
    //       icon: const Icon(Icons.search),
    //       indexedHeaderHeight: (index) => 86,
    //       widgetList: [
    //         Padding(
    //           padding: const EdgeInsets.only(
    //             left: 8,
    //             bottom: 8,
    //             top: 16,
    //             right: 64,
    //           ),
    //           child: TextField(
    //             onChanged: (value) {
    //               context.read<StationNotifier>().search(value);
    //             },
    //             decoration: const InputDecoration(
    //               labelText: 'Recherche',
    //               hintText: 'Recherche',
    //               prefixIcon: Icon(Icons.search),
    //               border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.all(
    //                   Radius.circular(20),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //     AlphabetScrollListHeader(
    //       widgetList: notifier.favoriteStations
    //           .map((s) => StationCard(station: s))
    //           .toList(),
    //       icon: const Icon(Icons.star),
    //       indexedHeaderHeight: (index) {
    //         return 100;
    //       },
    //     ),
    //   ],
    // );
  }
}

class _HeaderView extends StatelessWidget {
  const _HeaderView({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      alignment: Alignment.centerLeft,
      color: Theme.of(context).primaryColor,
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).textTheme.headline6?.color,
          fontSize: 25,
        ),
      ),
    );
  }
}
