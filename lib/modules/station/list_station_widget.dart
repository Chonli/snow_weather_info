import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/core/notifier/preference.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/modules/station/notifier.dart';
import 'package:snow_weather_info/ui/station_card.dart';

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
    return AlphabetListScrollView(
      strList: notifier.stations.map((d) => d.name).toList(),
      highlightTextStyle: TextStyle(
        color: Theme.of(context).primaryColor,
      ),
      showPreview: true,
      itemBuilder: (context, index) {
        return StationCard(station: notifier.stations[index]);
      },
      indexedHeight: (i) {
        return 106;
      },
      headerWidgetList: <AlphabetScrollListHeader>[
        AlphabetScrollListHeader(
          icon: const Icon(Icons.search),
          indexedHeaderHeight: (index) => 86,
          widgetList: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                bottom: 8,
                top: 16,
                right: 64,
              ),
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
            )
          ],
        ),
        AlphabetScrollListHeader(
          widgetList: notifier.favoriteStations
              .map((s) => StationCard(station: s))
              .toList(),
          icon: const Icon(Icons.star),
          indexedHeaderHeight: (index) {
            return 106;
          },
        ),
      ],
    );
  }
}
