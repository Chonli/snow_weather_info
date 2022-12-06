import 'package:snow_weather_info/data/sources/database_helper.dart';
import 'package:snow_weather_info/extensions/string.dart';

const double kelvin = -273.15;

class DataStation {
  DataStation();

  DataStation.fromList(List<dynamic> data) {
    _id = int.parse(data[0] as String);
    _date = DateTime.parse(
      '${(data[1]).substring(0, 8)}T${(data[1]).substring(8)}',
    );
    _temperature = (data[5] as String?).parseDouble(addValue: kelvin);
    _temperatureMin24 = (data[19] as String?).parseDouble(addValue: kelvin);
    _temperatureMax24 = (data[21] as String?).parseDouble(addValue: kelvin);
    _temperatureSnow = (data[28] as String?).parseDouble(addValue: kelvin);
    _speedWind = (data[4] as String?).parseDouble();
    _directionWind = (data[3] as String?).parseDouble();
    _snowHeight = (data[22] as String?).parseDouble();
    _snowNewHeight = (data[23] as String?).parseDouble();
  }

  DataStation.fromMap(Map<String, dynamic> map) {
    _id = map[columnIdStation] as int;
    _date = DateTime.parse(map[columnDate] as String);
    _temperature = map[columnTemperature] as double?;
    _temperatureMin24 = map[columnTemperatureMin24] as double?;
    _temperatureMax24 = map[columnTemperatureMax24] as double?;
    _temperatureSnow = map[columnTemperatureSnow] as double?;
    _snowHeight = map[columnSnowHeight] as double?;
    _snowNewHeight = map[columnSnowNewHeight] as double?;
    _speedWind = map[columnSpeedWind] as double?;
    _directionWind = map[columnDirectionWind] as double?;
  }

  int _id = 0;
  DateTime _date = DateTime.fromMillisecondsSinceEpoch(0);
  double? _temperature;
  double? _temperatureMin24;
  double? _temperatureMax24;
  double? _temperatureSnow;
  double? _speedWind;
  double? _directionWind;
  double? _snowHeight;
  double? _snowNewHeight;

  int get id => _id;
  DateTime get date => _date;
  double? get temperature => _temperature;
  double? get temperatureMin24 => _temperatureMin24;
  double? get temperatureMax24 => _temperatureMax24;
  double? get temperatureSnow => _temperatureSnow;
  double? get speedWind => _speedWind;
  double? get directionWind => _directionWind;
  double? get snowHeight => _snowHeight;
  double? get snowNewHeight => _snowNewHeight;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      columnIdStation: _id,
      columnDate: _date.toIso8601String(),
      columnTemperature: _temperature,
      columnTemperatureMin24: _temperatureMin24,
      columnTemperatureMax24: _temperatureMax24,
      columnTemperatureSnow: _temperatureSnow,
      columnSpeedWind: _speedWind,
      columnDirectionWind: _directionWind,
      columnSnowHeight: _snowHeight,
      columnSnowNewHeight: _snowNewHeight,
    };
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
