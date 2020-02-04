import 'package:latlong/latlong.dart';
import 'package:snow_weather_info/data/database_helper.dart';

class Station {
  //"Latitude": "46.341167", "Longitude": "6.708167", "ID": "07454", "Altitude": "1535", "Nom": "Bernex"
  int _id;
  String _name;
  LatLng _position;
  int _altitude;
  bool _hasData = false;

  Station(this._id, this._name, this._position, this._altitude);

  int get id => _id;
  String get name => _name;
  LatLng get position => _position;
  int get altitude => _altitude;
  bool get hasData => _hasData;
  set hasData(bool value) => _hasData = value;

  Station.fromJson(Map<String, dynamic> json) {
    _id = int.parse(json['ID']);
    _name = json['Nom'];
    _position =
        LatLng(double.parse(json['Latitude']), double.parse(json['Longitude']));
    _altitude = int.parse(json['Altitude']);
  }

  Station.fromMap(Map<String, dynamic> map) {
    _id = map[columnId];
    _name = map[columnName];
    _position = LatLng(
        map[columnLatitude], map[columnLongitude]);
    _altitude = map[columnAltitude];
  }

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
