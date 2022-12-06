import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snow_weather_info/extensions/double.dart';
import 'package:snow_weather_info/model/data_station.dart';

class DataStationWidget extends StatelessWidget {
  const DataStationWidget({
    super.key,
    required this.data,
  });

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
          if (data.temperature != null)
            _LineCard(
              'Température :',
              ' ${data.temperature!.toStringTemperature()}',
            ),
          if (data.temperatureMin24 != null)
            _LineCard(
              'Température Min 24h :',
              ' ${data.temperatureMin24!.toStringTemperature()}',
            ),
          if (data.temperatureMax24 != null)
            _LineCard(
              'Température Max 24h :',
              ' ${data.temperatureMax24!.toStringTemperature()}',
            ),
          if (data.temperatureSnow != null)
            _LineCard(
              'Température du sol:',
              ' ${data.temperatureSnow!.toStringTemperature()}',
            ),
          if (data.snowHeight != null)
            _LineCard(
              'Hauteur de neige :',
              ' ${data.snowHeight!.toStringSnowHeigth()}',
            ),
          if (data.snowNewHeight != null)
            _LineCard(
              'Hauteur de neige fraiches :',
              ' ${data.snowNewHeight!.toStringSnowHeigth()}',
            ),
          if (data.directionWind != null)
            _LineCard(
              'Direction vent moyen :',
              ' ${data.directionWind}°',
            ),
          if (data.speedWind != null)
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
  const _LineCard(this.text1, this.text2, {super.key});

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
