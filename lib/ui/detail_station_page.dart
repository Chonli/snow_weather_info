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
          title:
              Text(_station.name + " (" + _station.altitude.toString() + "m)"),
        ),
        body: data == null
            ? Center(child: Text('Pas de donnée pour cette station météo'))
            : _pageBody(data));
  }

  Widget _pageBody(DataStation data) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Date des donnée: " + data.date.toString()),
          Center(
            child: Column(
              children: <Widget>[
                Text("Temperature : ${data.temperature.toStringAsFixed(1)}°C"),
                Text(
                    "Temperature Min 24h : ${data.temperatureMin24.toStringAsFixed(1)}°C"),
                Text(
                    "Temperature Max 24h : ${data.temperatureMax24.toStringAsFixed(1)}°C"),
                Text("Hauteur de neige : ${data.snowHeight}m"),
                Text("Hauteur de neige fraiches : ${data.snowNewHeight}m"),
                Text(
                    "Température de surface de la neige: ${data.temperatureSnow.toStringAsFixed(1)}°C"),
                Text("Direction vent moyen : ${data.directionWind}°"),
                Text("Vent moyen : ${data.speedWind}m/s"),
              ],
            ),
          ),
          Text("Informations créées à partir de données de Météo-France"),
        ]);
  }
}
