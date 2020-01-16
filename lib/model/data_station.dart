class DataStation {
  String _id;
  DateTime _date;
  double _speedWind;
  double _snowHeight;

  DataStation(this._id, this._date, this._speedWind, this._snowHeight);

  String get id => _id;
  DateTime get date => _date;
  double get speedWind => _speedWind;
  double get snowHeight => _snowHeight;

  DataStation.fromList(List<dynamic> data) {
    _id = data[0];
    _speedWind = double.parse(data[4]);
    _snowHeight = data[22] != 'mq' ? double.parse(data[22]) : 0.0;
  }

  @override
  String toString() {
    return '$_id : $_speedWind m/s, $_snowHeight m';
  }
}
/*0 = "numer_sta"
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
