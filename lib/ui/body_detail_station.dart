import 'package:flutter/material.dart';
import 'package:snow_weather_info/model/data_station.dart';

class BodyDetailStation extends StatelessWidget {
  final DataStation _data;
  const BodyDetailStation(this._data);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text("Temperature : ${_data.temperature.toStringAsFixed(1)}°C"),
          Text(
              "Temperature Min 24h : ${_data.temperatureMin24.toStringAsFixed(1)}°C"),
          Text(
              "Temperature Max 24h : ${_data.temperatureMax24.toStringAsFixed(1)}°C"),
          Text("Hauteur de neige : ${_data.snowHeight}m"),
          Text("Hauteur de neige fraiches : ${_data.snowNewHeight}m"),
          Text(
              "Température de surface de la neige: ${_data.temperatureSnow.toStringAsFixed(1)}°C"),
          Text("Direction vent moyen : ${_data.directionWind}°"),
          Text("Vent moyen : ${_data.speedWind}m/s"),
        ],
      ),
    );
  }
}
