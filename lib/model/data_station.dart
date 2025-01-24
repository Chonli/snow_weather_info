// Specific parse file
// ignore_for_file: avoid_dynamic_calls

import 'package:dart_mappable/dart_mappable.dart';
import 'package:snow_weather_info/extensions/string.dart';

part 'data_station.mapper.dart';

const kelvin = -273.15;

@MappableClass()
class DataStation with DataStationMappable {
  const DataStation({
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

  factory DataStation.fromList(List<dynamic> data) => DataStation(
        id: int.parse(data[0] as String),
        date: DateTime.parse(
          '${data[1].substring(0, 8)}T${data[1].substring(8)}',
        ),
        temperature: (data[5] as String?).parseDouble(addValue: kelvin),
        temperatureMin24: (data[19] as String?).parseDouble(addValue: kelvin),
        temperatureMax24: (data[21] as String?).parseDouble(addValue: kelvin),
        temperatureSnow: (data[28] as String?).parseDouble(addValue: kelvin),
        speedWind: (data[4] as String?).parseDouble(),
        directionWind: (data[3] as String?).parseDouble(),
        snowHeight: (data[22] as String?).parseDouble(),
        snowNewHeight: (data[23] as String?).parseDouble(),
      );

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
