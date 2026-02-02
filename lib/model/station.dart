import 'package:dart_mappable/dart_mappable.dart';
import 'package:snow_weather_info/extensions/string.dart';
import 'package:snow_weather_info/model/coordinate.dart';

part 'station.mapper.dart';

@MappableClass()
sealed class AbstractStation with AbstractStationMappable {
  const AbstractStation(
    this.name,
    this.position,
    this.altitude,
  );

  final String name;
  final Coordinate position;
  final int altitude;

  @override
  String toString() {
    return '$name: $altitude m ($position)';
  }
}

@MappableClass()
class Station extends AbstractStation with StationMappable {
  //"Latitude": "46.341167", "Longitude": "6.708167", "ID": "07454",
  //"Altitude": "1535", "Nom": "Bernex"
  const Station(
    this.id,
    super.name,
    super.position,
    super.altitude,
  );

  factory Station.fromRemoteJson(Map<String, dynamic> json) => Station(
    int.parse(json['ID'] as String),
    (json['Nom'] as String).capitalizeAllWords,
    Coordinate(
      latitude: json['Latitude'] as double,
      longitude: json['Longitude'] as double,
    ),
    json['Altitude'] as int,
  );

  final int id;

  @override
  String toString() {
    return '$id - $name : $altitude m, $position';
  }

  static const fromMap = StationMapper.fromMap;
  static const fromJson = StationMapper.fromJson;
}

@MappableClass()
class Nivose extends AbstractStation with NivoseMappable {
  const Nivose(
    super.name,
    super.position,
    super.altitude,
    this.codeMF,
  );

  final String codeMF;

  static const _urlBase =
      'https://rpcache-aa.meteofrance.com/internet2018client/2.0/files/mountain/observations/';

  String get urlWeek => '$_urlBase${codeMF}S.gif';
  String get urlSeason => '$_urlBase$codeMF.gif';

  static const fromMap = NivoseMapper.fromMap;
  static const fromJson = NivoseMapper.fromJson;
}
