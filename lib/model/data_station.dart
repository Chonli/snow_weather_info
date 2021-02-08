import 'package:snow_weather_info/data/sources/database_helper.dart';

const double kelvin = 273.15;

class DataStation {
  DataStation();

  DataStation.fromList(List<dynamic> data) {
    _id = int.parse(data[0] as String);
    _date = DateTime.parse(
      '${(data[1]).substring(0, 8)}T${(data[1]).substring(8)}',
    );
    _hasTemperature = _hasDoubleValue(data[5] as String);
    if (_hasTemperature) {
      _temperature = _getDoubleValue(data[5] as String) - kelvin;
    }
    _hasTemperatureMin24 = _hasDoubleValue(data[19] as String);
    if (_hasTemperatureMin24) {
      _temperatureMin24 = _getDoubleValue(data[19] as String) - kelvin;
    }
    _hasTemperatureMax24 = _hasDoubleValue(data[21] as String);
    if (_hasTemperatureMax24) {
      _temperatureMax24 = _getDoubleValue(data[21] as String) - kelvin;
    }
    _hasTemperatureSnow = _hasDoubleValue(data[28] as String);
    if (_hasTemperatureSnow) {
      _temperatureSnow = _getDoubleValue(data[28] as String) - kelvin;
    }
    _hasSpeedWind = _hasDoubleValue(data[4] as String);
    if (_hasSpeedWind) {
      _speedWind = _getDoubleValue(data[4] as String);
    }
    _hasDirectionWind = _hasDoubleValue(data[3] as String);
    if (_hasDirectionWind) {
      _directionWind = _getDoubleValue(data[3] as String);
    }
    _hasSnowHeight = _hasDoubleValue(data[22] as String);
    if (_hasSnowHeight) {
      _snowHeight = _getDoubleValue(data[22] as String);
    }
    _hasSnowNewHeight = _hasDoubleValue(data[23] as String);
    if (_hasSnowNewHeight) {
      _snowNewHeight = _getDoubleValue(data[23] as String);
    }
  }

  DataStation.fromMap(Map<String, dynamic> map) {
    _id = map[columnIdStation] as int;
    _date = DateTime.parse(map[columnDate] as String);
    _temperature = map[columnTemperature] as double;
    _hasTemperature = _temperature != null;
    _temperatureMin24 = map[columnTemperatureMin24] as double;
    _hasTemperatureMin24 = _temperatureMin24 != null;
    _temperatureMax24 = map[columnTemperatureMax24] as double;
    _hasTemperatureMax24 = _temperatureMax24 != null;
    _temperatureSnow = map[columnTemperatureSnow] as double;
    _hasTemperatureSnow = _temperatureSnow != null;
    _snowHeight = map[columnSnowHeight] as double;
    _hasSnowHeight = _snowHeight != null;
    _snowNewHeight = map[columnSnowNewHeight] as double;
    _hasSnowNewHeight = _snowNewHeight != null;
    _speedWind = map[columnSpeedWind] as double;
    _hasSpeedWind = _speedWind != null;
    _directionWind = map[columnDirectionWind] as double;
    _hasDirectionWind = _directionWind != null;
  }

  int _id;
  DateTime _date;
  double _temperature;
  double _temperatureMin24;
  double _temperatureMax24;
  double _temperatureSnow;
  double _speedWind;
  double _directionWind;
  double _snowHeight;
  double _snowNewHeight;

  bool _hasTemperature;
  bool _hasTemperatureMin24;
  bool _hasTemperatureMax24;
  bool _hasTemperatureSnow;
  bool _hasSpeedWind;
  bool _hasDirectionWind;
  bool _hasSnowHeight;
  bool _hasSnowNewHeight;

  int get id => _id;
  DateTime get date => _date;
  double get temperature => _temperature;
  double get temperatureMin24 => _temperatureMin24;
  double get temperatureMax24 => _temperatureMax24;
  double get temperatureSnow => _temperatureSnow;
  double get speedWind => _speedWind;
  double get directionWind => _directionWind;
  double get snowHeight => _snowHeight;
  double get snowNewHeight => _snowNewHeight;
  bool get hasTemperature => _hasTemperature;
  bool get hasTemperatureMin24 => _hasTemperatureMin24;
  bool get hasTemperatureMax24 => _hasTemperatureMax24;
  bool get hasTemperatureSnow => _hasTemperatureSnow;
  bool get hasSpeedWind => _hasSpeedWind;
  bool get hasDirectionWind => _hasDirectionWind;
  bool get hasSnowHeight => _hasSnowHeight;
  bool get hasSnowNewHeight => _hasSnowNewHeight;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      columnIdStation: _id,
      columnDate: _date.toIso8601String(),
      columnTemperature: _hasTemperature ? _temperature : null,
      columnTemperatureMin24: _hasTemperatureMin24 ? _temperatureMin24 : null,
      columnTemperatureMax24: _hasTemperatureMax24 ? _temperatureMax24 : null,
      columnTemperatureSnow: _hasTemperatureSnow ? _temperatureSnow : null,
      columnSpeedWind: _hasSpeedWind ? _speedWind : null,
      columnDirectionWind: _hasDirectionWind ? _directionWind : null,
      columnSnowHeight: _hasSnowHeight ? _snowHeight : null,
      columnSnowNewHeight: _hasSnowNewHeight ? _snowNewHeight : null
    };
  }

  double _getDoubleValue(String data) {
    return double.parse(data);
  }

  bool _hasDoubleValue(String data) {
    return data != 'mq' ? double.tryParse(data) != null : false;
  }

  @override
  String toString() {
    return '$_id : $_temperature °C $_speedWind m/s, $_snowHeight m';
  }
}
/*
0 = "numer_sta"
1 = "date"
2 = "haut_sta"
3 = "dd"
4 = "ff"
5 = "t"
6 = "td"
7 = "u"
8 = "ww"
9 = "w1"
10 = "w2"
11 = "n"
12 = "nbas"
13 = "hbas"
14 = "cl"
15 = "cm"
16 = "ch"
17 = "rr24"
18 = "tn12"
19 = "tn24"
20 = "tx12"
21 = "tx24"
22 = "ht_neige"
23 = "ssfrai"
24 = "perssfrai"
25 = "phenspe1"
26 = "phenspe2"
27 = "nnuage1"
28 = "t_neige"
29 = "etat_neige"
30 = "prof_sonde"
31 = "nuage_val"
32 = "chasse_neige"
33 = "aval_descr"
34 = "aval_genre"
35 = "aval_depart"
36 = "aval_expo"
37 = "aval_risque"
38 = "dd_alti"
39 = "ff_alti"
40 = "ht_neige_alti"
41 = "neige_fraiche"
42 = "teneur_eau"
43 = "grain_predom"
44 = "grain_nombre"
45 = "grain_diametr"
46 = "homogeneite"
47 = "m_vol_neige"*/
