import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:snow_weather_info/data/repository.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/ui/station_card.dart';

class ListStationWidget extends StatefulWidget {
  final Repository _repository;
  const ListStationWidget(this._repository);

  @override
  _ListStationWidgetState createState() => _ListStationWidgetState();
}

class _ListStationWidgetState extends State<ListStationWidget> {
  TextEditingController _editingController = TextEditingController();
  List<AbstractStation> _listStation = List<AbstractStation>();
  List<AbstractStation> _listFavoriteStation = List<AbstractStation>();
  Repository get _repository => widget._repository;

  @override
  void initState() {
    _listStation.addAll(_repository.nivoses);
    _listStation.addAll(_repository.stations);
    _listFavoriteStation.addAll(_repository.favoritesStations);
    _listStation.sort((a, b) => a.name.compareTo(b.name));
    super.initState();
  }

  void _filterSearchResults(String query) {
    var dummySearchStationList = _repository.stations;
    var dummySearchNivoseList = _repository.nivoses;
    var dummySearchFavoriteList = _repository.favoritesStations;
    _listStation.clear();
    _listFavoriteStation.clear();
    if (query.isNotEmpty) {
      List<AbstractStation> dummyListData = List<AbstractStation>();
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
    return AlphabetListScrollView(
      strList: _listStation.map((d) => d.name).toList(),
      highlightTextStyle: TextStyle(
        color: Theme.of(context).primaryColor,
      ),
      showPreview: true,
      itemBuilder: (context, index) {
        return StationCard(_listStation[index]);
      },
      indexedHeight: (i) {
        return 106;
      },
      headerWidgetList: <AlphabetScrollListHeader>[
        AlphabetScrollListHeader(
          icon: Icon(Icons.search),
          indexedHeaderHeight: (index) => 86,
          widgetList: [
            Padding(
              padding: EdgeInsets.only(
                  left: 8.0, bottom: 8.0, top: 16.0, right: 64.0),
              child: TextField(
                onChanged: (value) {
                  _filterSearchResults(value);
                },
                controller: _editingController,
                decoration: InputDecoration(
                  labelText: "Recherche",
                  hintText: "Recherche",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        AlphabetScrollListHeader(
            widgetList: _listStation
                .where((s) => _repository.isFavorite(s))
                .map((s) => StationCard(s))
                .toList(),
            icon: Icon(Icons.star),
            indexedHeaderHeight: (index) {
              return 106;
            }),
      ],
    );
  }
}
