// Specific parse file
// ignore_for_file: avoid_dynamic_calls

import 'package:dart_mappable/dart_mappable.dart';
import 'package:snow_weather_info/extensions/string.dart';

part 'data_station.mapper.dart';

const kelvin = -273.15;

@MappableClass()
class DataStation with DataStationMappable {
  const DataStation({
    required this.date,
    this.id = 0,
    this.temperature,
    this.temperatureMin24,
    this.temperatureMax24,
    this.temperatureSnow,
    this.speedWind,
    this.directionWind,
    this.snowHeight,
    this.snowNewHeight,
  });

  factory DataStation.fromList(List<dynamic> data) => DataStation(
    id: int.parse(data[2] as String),
    date: DateTime.parse(data[8] as String),
    temperature: (data[11] as String?).parseDouble(addValue: kelvin),
    temperatureMin24: (data[25] as String?).parseDouble(addValue: kelvin),
    temperatureMax24: (data[27] as String?).parseDouble(addValue: kelvin),
    temperatureSnow: (data[34] as String?).parseDouble(addValue: kelvin),
    speedWind: (data[10] as String?).parseDouble(),
    directionWind: (data[9] as String?).parseDouble(),
    snowHeight: (data[28] as String?).parseDouble(),
    snowNewHeight: (data[29] as String?).parseDouble(),
  );

  final DateTime date;
  final int id;
  final double? temperature;
  final double? temperatureMin24;
  final double? temperatureMax24;
  final double? temperatureSnow;
  final double? speedWind;
  final double? directionWind;
  final double? snowHeight;
  final double? snowNewHeight;

  static const fromMap = DataStationMapper.fromMap;
  static const fromJson = DataStationMapper.fromJson;

  @override
  String toString() {
    return '$id : $temperature °C $speedWind m/s, $snowHeight m';
  }
}
