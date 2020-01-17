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
        body: data == null
            ? Center(child: Text('Pas de donnée pour cette station météo'))
            : _pageBody(data));
  }

  Widget _pageBody(DataStation data) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Temperature : ${data.temperature}°C"),
        Text("Temperature Min 24h : ${data.temperatureMin24}°C"),
        Text("Temperature Max 24h : ${data.temperatureMax24}°C"),
        Text("Hauteur de neige : ${data.snowHeight}m"),
        Text("Hauteur de neige fraiches : ${data.snowNewHeight}m"),
        Text("Vent moyen : ${data.speedWind}m/s")
      ],
    ));
  }
}
