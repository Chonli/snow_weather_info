import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snow_weather_info/model/data_station.dart';

class DataStationWidget extends StatelessWidget {
  const DataStationWidget(this._data);

  final DataStation _data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            DateFormat('dd-MM-yyyy à kk:mm').format(_data.date),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          if (_data.hasTemperature)
            _LineCard(
              'Température :',
              ' ${_data.temperature.toStringAsFixed(1)}°C',
            ),
          if (_data.hasTemperatureMin24)
            _LineCard(
              'Température Min 24h :',
              ' ${_data.temperatureMin24.toStringAsFixed(1)}°C',
            ),
          if (_data.hasTemperatureMax24)
            _LineCard(
              'Température Max 24h :',
              ' ${_data.temperatureMax24.toStringAsFixed(1)}°C',
            ),
          if (_data.hasTemperatureSnow)
            _LineCard(
              'Température du sol:',
              ' ${_data.temperatureSnow.toStringAsFixed(1)}°C',
            ),
          if (_data.hasSnowHeight)
            _LineCard(
              'Hauteur de neige :',
              ' ${(_data.snowHeight * 100).toStringAsFixed(1)}cm',
            ),
          if (_data.hasSnowNewHeight)
            _LineCard(
              'Hauteur de neige fraiches :',
              ' ${(_data.snowNewHeight * 100).toStringAsFixed(1)}cm',
            ),
          if (_data.hasDirectionWind)
            _LineCard(
              'Direction vent moyen :',
              ' ${_data.directionWind}°',
            ),
          if (_data.hasSpeedWind)
            _LineCard(
              'Vent moyen :',
              ' ${_data.speedWind}m/s',
            ),
        ],
      ),
    );
  }
}

class _LineCard extends StatelessWidget {
  const _LineCard(this.text1, this.text2, {Key key}) : super(key: key);

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
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
