import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snow_weather_info/model/data_station.dart';

class DataStationWidget extends StatelessWidget {
  const DataStationWidget({
    Key key,
    @required this.data,
  }) : super(key: key);

  final DataStation data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            DateFormat('dd-MM-yyyy à kk:mm').format(data.date),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          if (data.hasTemperature)
            _LineCard(
              'Température :',
              ' ${data.temperature.toStringAsFixed(1)}°C',
            ),
          if (data.hasTemperatureMin24)
            _LineCard(
              'Température Min 24h :',
              ' ${data.temperatureMin24.toStringAsFixed(1)}°C',
            ),
          if (data.hasTemperatureMax24)
            _LineCard(
              'Température Max 24h :',
              ' ${data.temperatureMax24.toStringAsFixed(1)}°C',
            ),
          if (data.hasTemperatureSnow)
            _LineCard(
              'Température du sol:',
              ' ${data.temperatureSnow.toStringAsFixed(1)}°C',
            ),
          if (data.hasSnowHeight)
            _LineCard(
              'Hauteur de neige :',
              ' ${(data.snowHeight * 100).toStringAsFixed(1)}cm',
            ),
          if (data.hasSnowNewHeight)
            _LineCard(
              'Hauteur de neige fraiches :',
              ' ${(data.snowNewHeight * 100).toStringAsFixed(1)}cm',
            ),
          if (data.hasDirectionWind)
            _LineCard(
              'Direction vent moyen :',
              ' ${data.directionWind}°',
            ),
          if (data.hasSpeedWind)
            _LineCard(
              'Vent moyen :',
              ' ${data.speedWind}m/s',
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
