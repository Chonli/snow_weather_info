import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/repository.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/ui/data_station_chart.dart';
import 'package:snow_weather_info/ui/data_station_widget.dart';

class DetailStationPage extends StatefulWidget {
  final Station _station;

  DetailStationPage(this._station);

  @override
  _DetailStationPageState createState() => _DetailStationPageState();
}

class _DetailStationPageState extends State<DetailStationPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Repository repository = Provider.of<Repository>(context);
    var data = repository.getDataOfStation(widget._station.id);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget._station.name +
                " (" +
                widget._station.altitude.toString() +
                "m)",
          ),
        ),
        body: data == null
            ? Center(child: Text('Pas de donnée pour cette station météo'))
            : _pageBody(data));
  }

  Widget _pageBody(List<DataStation> data) {
    bool isMoreOne = data.length > 1;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              isMoreOne
                  ? IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        if (selectedIndex < data.length - 1) {
                          setState(() {
                            selectedIndex++;
                          });
                        }
                      },
                    )
                  : Container(),
              Text(DateFormat('dd-MM-yyyy à kk:mm')
                  .format(data[selectedIndex].date)),
              isMoreOne
                  ? IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () {
                        if (selectedIndex > 0) {
                          setState(() {
                            selectedIndex--;
                          });
                        }
                      },
                    )
                  : Container(),
            ],
          ),
          DataStationWidget(data[selectedIndex]),
          Expanded(child: DataStationChart(data)),
          Text("Informations créées à partir de données de Météo-France"),
        ]);
  }
}
