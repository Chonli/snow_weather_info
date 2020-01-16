import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/repository.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/model/station.dart';

class DetailStationPage extends StatelessWidget {
  final Station _station;

  DetailStationPage(this._station);

  @override
  Widget build(BuildContext context) {
    Repository repository = Provider.of<Repository>(context);
    DataStation data = repository.getDataOfStation(_station.id);
    return Scaffold(
        appBar: AppBar(
          title: Text(_station.name),
        ),
        body: Center(child: data == null ?
        Text('Pas de donnée pour cette station météo') :
        Column(
          children: <Widget>[
            Text("Hauteur de neige : ${data.snowHeight}m"),
            Text("Vent moyen : ${data.speedWind}m/s")
          ],
        )));
  }
}
