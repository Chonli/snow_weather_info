import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/ui/station_card.dart';

class ListStationWidget extends StatefulWidget {
  const ListStationWidget({Key? key}) : super(key: key);

  @override
  _ListStationWidgetState createState() => _ListStationWidgetState();
}

class _ListStationWidgetState extends State<ListStationWidget> {
  final _editingController = TextEditingController();
  final _listStation = <AbstractStation>[];
  final _listFavoriteStation = <AbstractStation>[];

  @override
  void initState() {
    super.initState();
    final notifier = context.read<DataNotifier>();
    _listStation.addAll(notifier.nivoses);
    _listStation.addAll(notifier.stations);
    _listFavoriteStation.addAll(notifier.favoritesStations);
    _listStation.sort((a, b) => a.name.compareTo(b.name));
  }

  void _filterSearchResults(BuildContext context, String query) {
    final notifier = context.read<DataNotifier>();
    final dummySearchStationList = notifier.stations;
    final dummySearchNivoseList = notifier.nivoses;
    final dummySearchFavoriteList = notifier.favoritesStations;
    _listStation.clear();
    _listFavoriteStation.clear();
    if (query.isNotEmpty) {
      final dummyListData = <AbstractStation>[];
      dummySearchStationList.forEach((item) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      dummySearchNivoseList.forEach((item) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        _listStation.addAll(dummyListData);
        _listFavoriteStation.addAll(dummySearchFavoriteList.where(
            (item) => item.name.toLowerCase().contains(query.toLowerCase())));
        _listStation.sort((a, b) => a.name.compareTo(b.name));
      });
    } else {
      setState(() {
        _listStation.addAll(dummySearchStationList);
        _listStation.addAll(dummySearchNivoseList);
        _listFavoriteStation.addAll(dummySearchFavoriteList);
        _listStation.sort((a, b) => a.name.compareTo(b.name));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<DataNotifier>();
    return AlphabetListScrollView(
      strList: _listStation.map((d) => d.name).toList(),
      highlightTextStyle: TextStyle(
        color: Theme.of(context).primaryColor,
      ),
      showPreview: true,
      itemBuilder: (context, index) {
        return StationCard(station: _listStation[index]);
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
                  _filterSearchResults(context, value);
                },
                controller: _editingController,
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
          widgetList: _listStation
              .where((s) => notifier.isFavorite(s))
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
