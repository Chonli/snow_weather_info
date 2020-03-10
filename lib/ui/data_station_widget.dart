import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snow_weather_info/model/data_station.dart';

class DataStationWidget extends StatelessWidget {
  final DataStation _data;
  const DataStationWidget(this._data);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            DateFormat('dd-MM-yyyy à kk:mm').format(_data.date),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          _data.hasTemperature
              ? _lineCard(
                  "Temperature :", " ${_data.temperature.toStringAsFixed(1)}°C")
              : Container(),
          _data.hasTemperatureMin24
              ? _lineCard("Temperature Min 24h :",
                  " ${_data.temperatureMin24.toStringAsFixed(1)}°C")
              : Container(),
          _data.hasTemperatureMax24
              ? _lineCard("Temperature Max 24h :",
                  " ${_data.temperatureMax24.toStringAsFixed(1)}°C")
              : Container(),
          _data.hasTemperatureSnow
              ? _lineCard("Température du sol:",
                  " ${_data.temperatureSnow.toStringAsFixed(1)}°C")
              : Container(),
          _data.hasSnowHeight
              ? _lineCard("Hauteur de neige :",
                  " ${(_data.snowHeight * 100).toStringAsFixed(1)}cm")
              : Container(),
          _data.hasSnowNewHeight
              ? _lineCard("Hauteur de neige fraiches :",
                  " ${(_data.snowNewHeight * 100).toStringAsFixed(1)}cm")
              : Container(),
          _data.hasDirectionWind
              ? _lineCard("Direction vent moyen :", " ${_data.directionWind}°")
              : Container(),
          _data.hasSpeedWind
              ? _lineCard("Vent moyen :", " ${_data.speedWind}m/s")
              : Container(),
        ],
      ),
    );
  }

  Widget _lineCard(String text1, String text2) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(text1),
          Text(text2),
        ],
      ),
    );
  }
}
