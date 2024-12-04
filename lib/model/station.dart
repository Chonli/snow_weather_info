// ignore_for_file: public_member_api_docs

import 'package:dart_mappable/dart_mappable.dart';
import 'package:latlong2/latlong.dart';

part 'station.mapper.dart';

@MappableClass()
sealed class AbstractStation with AbstractStationMappable {
  const AbstractStation(
    this.name,
    this.position,
    this.altitude,
  );

  final String name;
  final LatLng position;
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

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        int.parse(json['ID'] as String),
        json['Nom'] as String,
        LatLng(
          double.parse(json['Latitude'] as String),
          double.parse(json['Longitude'] as String),
        ),
        int.parse(json['Altitude'] as String),
      );

  // Station.fromMap(Map<String, dynamic> map)
  //     : id = map[columnId] as int,
  //       super(
  //         map[columnName] as String,
  //         LatLng(map[columnLatitude] as double, map[columnLongitude] as double),
  //         map[columnAltitude] as int,
  //       );

  final int id;

  // @override
  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     columnId: id,
  //     columnName: name,
  //     columnLatitude: position.latitude,
  //     columnLongitude: position.longitude,
  //     columnAltitude: altitude,
  //   };
  // }

  @override
  String toString() {
    return '$id - $name : $altitude m, $position';
  }
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
}
