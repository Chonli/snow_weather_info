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
  Repository get _repository => widget._repository;

  @override
  void initState() {
    _listStation.addAll(_repository.nivoses);
    _listStation.addAll(_repository.stations);
    _listStation.sort((a, b) => a.name.compareTo(b.name));
    super.initState();
  }

  void _filterSearchResults(String query) {
    var dummySearchStationList = _repository.stations;
    var dummySearchNivoseList = _repository.nivoses;
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
        _listStation.clear();
        _listStation.addAll(dummyListData);
        _listStation.sort((a, b) => a.name.compareTo(b.name));
      });
    } else {
      setState(() {
        _listStation.clear();
        _listStation.addAll(dummySearchStationList);
        _listStation.addAll(dummySearchNivoseList);
        _listStation.sort((a, b) => a.name.compareTo(b.name));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
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
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
        ),
        Expanded(
          child: ListView.builder(
            key: PageStorageKey("station_list_key"),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: _listStation.length,
            itemBuilder: (context, index) => StationCard(_listStation[index]),
          ),
        ),
      ],
    );
  }
}
