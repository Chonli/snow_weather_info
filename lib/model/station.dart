import 'package:latlong/latlong.dart';
import 'package:snow_weather_info/data/sources/database_helper.dart';

abstract class AbstractStation {
  AbstractStation(this._name, this._position, this._altitude);

  final String _name;
  final LatLng _position;
  final int _altitude;

  String get name => _name;
  LatLng get position => _position;
  int get altitude => _altitude;

  @override
  String toString() {
    return '$_name: $altitude m (${_position.toString()})';
  }
}

class Station extends AbstractStation {
  //"Latitude": "46.341167", "Longitude": "6.708167", "ID": "07454", "Altitude": "1535", "Nom": "Bernex"
  Station(this._id, String name, LatLng position, int altitude)
      : super(name, position, altitude);

  Station.fromJson(Map<String, dynamic> json)
      : super(
          json['Nom'] as String,
          LatLng(double.parse(json['Latitude'] as String),
              double.parse(json['Longitude'] as String)),
          int.parse(json['Altitude'] as String),
        ) {
    _id = int.parse(json['ID'] as String);
  }

  Station.fromMap(Map<String, dynamic> map)
      : super(
            map[columnName] as String,
            LatLng(
                map[columnLatitude] as double, map[columnLongitude] as double),
            map[columnAltitude] as int) {
    _id = map[columnId] as int;
  }

  int _id;
  bool hasData = false;
  double lastSnowHeight = 0;
  int get id => _id;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      columnId: _id,
      columnName: _name,
      columnLatitude: _position.latitude,
      columnLongitude: _position.longitude,
      columnAltitude: _altitude
    };
  }

  @override
  String toString() {
    return '$_id - $_name : $_altitude m, $_position';
  }
}

class Nivose extends AbstractStation {
  final String codeMF;
  final _urlBase =
      'https://rpcache-aa.meteofrance.com/internet2018client/2.0/files/mountain/observations/';
  String get urlWeek => '$_urlBase${codeMF}S.gif';
  String get urlSeason => '$_urlBase$codeMF.gif';

  Nivose(String name, LatLng position, int altitude, this.codeMF)
      : super(name, position, altitude);
}
