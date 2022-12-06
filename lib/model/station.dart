import 'package:latlong2/latlong.dart';
import 'package:snow_weather_info/data/sources/database_helper.dart';

abstract class AbstractStation {
  AbstractStation(
    this.name,
    this.position,
    this.altitude, {
    required this.hasData,
  });

  final String name;
  final LatLng position;
  final int altitude;
  bool hasData = false;

  @override
  String toString() {
    return '$name: $altitude m (${position.toString()})';
  }
}

class Station extends AbstractStation {
  //"Latitude": "46.341167", "Longitude": "6.708167", "ID": "07454", "Altitude": "1535", "Nom": "Bernex"
  Station(
    this.id,
    String name,
    LatLng position,
    int altitude, {
    bool hasData = false,
  }) : super(name, position, altitude, hasData: hasData);

  Station.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['ID'] as String),
        super(
          json['Nom'] as String,
          LatLng(
            double.parse(json['Latitude'] as String),
            double.parse(json['Longitude'] as String),
          ),
          int.parse(json['Altitude'] as String),
          hasData: false,
        );

  Station.fromMap(Map<String, dynamic> map)
      : id = map[columnId] as int,
        super(
          map[columnName] as String,
          LatLng(map[columnLatitude] as double, map[columnLongitude] as double),
          map[columnAltitude] as int,
          hasData: false,
        );

  final int id;
  double lastSnowHeight = 0;

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

const _urlBase =
    'https://rpcache-aa.meteofrance.com/internet2018client/2.0/files/mountain/observations/';

class Nivose extends AbstractStation {
  Nivose(super.name, super.position, super.altitude, this.codeMF)
      : super(hasData: false);

  final String codeMF;

  String get urlWeek => '$_urlBase${codeMF}S.gif';
  String get urlSeason => '$_urlBase$codeMF.gif';
}
