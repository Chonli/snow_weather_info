// Specific parse file

import 'package:dart_mappable/dart_mappable.dart';
import 'package:snow_weather_info/extensions/string.dart';

part 'data_station.mapper.dart';

const kelvin = -273.15;

@MappableClass()
class DataStation with DataStationMappable {
  const new({
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

  /// Parse une ligne du csv de l'api tabular data.gouv (colonnes nommées).
  factory fromCsvRow(Map<String, String?> row) {
    final id = int.tryParse(row['geo_id_wmo'] ?? '');
    final dateString = row['validity_time'] ?? row['insert_time'];
    final date = dateString == null ? null : DateTime.tryParse(dateString);
    if (id == null || date == null) {
      throw FormatException('Données manquantes', row.toString());
    }

    return DataStation(
      id: id,
      date: date,
      temperature: row['t'].parseDouble(addValue: kelvin),
      temperatureMin24: row['tn24'].parseDouble(addValue: kelvin),
      temperatureMax24: row['tx24'].parseDouble(addValue: kelvin),
      temperatureSnow: row['t_neige'].parseDouble(addValue: kelvin),
      speedWind: row['ff'].parseDouble(),
      directionWind: row['dd'].parseDouble(),
      snowHeight: row['ht_neige'].parseDouble(),
      snowNewHeight: row['ssfrai'].parseDouble(),
    );
  }

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
