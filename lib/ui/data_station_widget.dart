import 'package:flutter/material.dart';
import 'package:snow_weather_info/model/data_station.dart';

class DataStationWidget extends StatelessWidget {
  final DataStation _data;
  const DataStationWidget(this._data);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          _data.hasTemperature
              ? Text("Temperature : ${_data.temperature.toStringAsFixed(1)}°C")
              : Container(),
          _data.hasTemperatureMin24
              ? Text(
                  "Temperature Min 24h : ${_data.temperatureMin24.toStringAsFixed(1)}°C")
              : Container(),
          _data.hasTemperatureMax24
              ? Text(
                  "Temperature Max 24h : ${_data.temperatureMax24.toStringAsFixed(1)}°C")
              : Container(),
          _data.hasSnowHeight
              ? Text(
                  "Hauteur de neige : ${(_data.snowHeight * 100).toStringAsFixed(1)}cm")
              : Container(),
          _data.hasSnowNewHeight
              ? Text(
                  "Hauteur de neige fraiches : ${(_data.snowNewHeight * 100).toStringAsFixed(1)}cm")
              : Container(),
          _data.hasTemperatureSnow
              ? Text(
                  "Température de surface de la neige: ${_data.temperatureSnow.toStringAsFixed(1)}°C")
              : Container(),
          _data.hasDirectionWind
              ? Text("Direction vent moyen : ${_data.directionWind}°")
              : Container(),
          _data.hasSpeedWind
              ? Text("Vent moyen : ${_data.speedWind}m/s")
              : Container(),
        ],
      ),
    );
  }
}
