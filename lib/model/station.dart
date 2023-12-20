// ignore_for_file: public_member_api_docs

import 'package:latlong2/latlong.dart';
import 'package:snow_weather_info/data/sources/database_helper.dart';

sealed class AbstractStation {
  AbstractStation(
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

class Station extends AbstractStation {
  //"Latitude": "46.341167", "Longitude": "6.708167", "ID": "07454",
  //"Altitude": "1535", "Nom": "Bernex"
  Station(
    this.id,
    super.name,
    super.position,
    super.altitude,
  );

  Station.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['ID'] as String),
        super(
          json['Nom'] as String,
          LatLng(
            double.parse(json['Latitude'] as String),
            double.parse(json['Longitude'] as String),
          ),
          int.parse(json['Altitude'] as String),
        );

  Station.fromMap(Map<String, dynamic> map)
      : id = map[columnId] as int,
        super(
          map[columnName] as String,
          LatLng(map[columnLatitude] as double, map[columnLongitude] as double),
          map[columnAltitude] as int,
        );

  final int id;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      columnId: id,
      columnName: name,
      columnLatitude: position.latitude,
      columnLongitude: position.longitude,
      columnAltitude: altitude,
    };
  }

  @override
  String toString() {
    return '$id - $name : $altitude m, $position';
  }
}

class Nivose extends AbstractStation {
  Nivose(super.name, super.position, super.altitude, this.codeMF);

  final String codeMF;

  static const _urlBase =
      'https://rpcache-aa.meteofrance.com/internet2018client/2.0/files/mountain/observations/';

  String get urlWeek => '$_urlBase${codeMF}S.gif';
  String get urlSeason => '$_urlBase$codeMF.gif';
}
