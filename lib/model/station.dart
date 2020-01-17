import 'package:latlong/latlong.dart';

class Station {
  //"Latitude": "46.341167", "Longitude": "6.708167", "ID": "07454", "Altitude": "1535", "Nom": "Bernex"
  String _id;
  String _name;
  LatLng _position;
  int _altitude;
  bool _hasData = false;

  Station(this._id, this._name, this._position, this._altitude);

  String get id => _id;
  String get name => _name;
  LatLng get position => _position;
  int get altitude => _altitude;
  bool get hasData => _hasData;
  set hasData(bool value) => _hasData = value;

  Station.fromJson(Map<String, dynamic> json) {
    _id = json['ID'];
    _name = json['Nom'];
    _position =
        LatLng(double.parse(json['Latitude']), double.parse(json['Longitude']));
    _altitude = int.parse(json['Altitude']);
  }

  @override
  String toString() {
    return '$_id - $_name : $_altitude m, $_position';
  }
}
