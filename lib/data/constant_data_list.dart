import 'package:latlong2/latlong.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:snow_weather_info/model/station.dart';

abstract class ConstantDatalist {
  ConstantDatalist._();

  static final listNivose = <Nivose>[
    //alpes nord
    Nivose(
      'Aiguilles rouges',
      LatLng(45.986125, 6.895937),
      2330,
      'AIGRG',
    ),
    Nivose(
      'Bellecote',
      LatLng(45.48881, 6.77163),
      3000,
      'BELLE',
    ),
    Nivose(
      'Le Chevril',
      LatLng(45.50179, 6.95604),
      2560,
      'CHEVR',
    ),
    Nivose(
      'Bonneval',
      LatLng(45.35175, 7.05132),
      2720,
      'BONNE',
    ),
    Nivose(
      'Les rochilles',
      LatLng(45.08467, 6.47127),
      2450,
      'ROCHI',
    ),
    Nivose(
      'Allant',
      LatLng(45.66345, 6.21195),
      1630,
      'ALLAN',
    ),
    Nivose(
      'Grande Parei',
      LatLng(45.61463, 6.64750),
      2240,
      'PAREI',
    ),
    Nivose(
      'Col de Porte',
      LatLng(45.2952742, 5.7651929),
      1325,
      'COLPO',
    ),
    Nivose(
      'St Hilaire',
      LatLng(45.31449, 5.86462),
      1700,
      'STHIL',
    ),
    Nivose(
      'Aigleton',
      LatLng(45.2311598, 6.0381140),
      2240,
      'AIGLE',
    ),
    Nivose(
      'Le Gua',
      LatLng(45.01517, 5.58951),
      1600,
      'LEGUA',
    ),
    Nivose(
      'Les Ecrins',
      LatLng(44.93681, 6.34602),
      2940,
      'ECRIN',
    ),
    Nivose(
      'La Meije',
      LatLng(45.01255, 6.26485),
      3100,
      'MEIJE',
    ),
    Nivose(
      'Galibier',
      LatLng(45.05733, 6.37739),
      2559,
      'GALIB',
    )
    //alpes sud
    ,
    Nivose(
      'Orcières',
      LatLng(44.71857, 6.33378),
      2294,
      'ORCIE',
    ),
    Nivose(
      'Col Agnel',
      LatLng(44.68873, 6.97625),
      2630,
      'AGNEL',
    ),
    Nivose(
      'Restefond',
      LatLng(44.34205, 6.79871),
      2550,
      'RESTE',
    ),
    Nivose(
      'Millefonts',
      LatLng(44.11819, 7.19226),
      2430,
      'MILLE',
    ),
    Nivose(
      'Parpaillon',
      LatLng(44.49522, 6.63650),
      2545,
      'PARPA',
    )
    //corse
    ,
    Nivose(
      'Sponde',
      LatLng(42.32448, 8.88478),
      1980,
      'SPOND',
    ),
    Nivose(
      'Maniccia',
      LatLng(42.20837, 9.04888),
      2360,
      'MANIC',
    )
    //pyrennée
    ,
    Nivose(
      'Maupas',
      LatLng(42.71428, 0.54995),
      2430,
      'MAUPA',
    ),
    Nivose(
      'Port d`Aula',
      LatLng(42.76993, 1.11493),
      2140,
      'PAULA',
    ),
    Nivose(
      'Canigou',
      LatLng(42.53322, 2.46096),
      2150,
      'CANIG',
    ),
    Nivose(
      'Hospitalet',
      LatLng(42.57778, 1.81140),
      2293,
      'HOSPI',
    ),
    Nivose(
      'Puigmal',
      LatLng(42.38318, 2.09143),
      2467,
      'PUIGN',
    ),
    Nivose(
      'Soum Couy',
      LatLng(42.96157, -0.71995),
      2150,
      'SOUMC',
    ),
    Nivose(
      'Lac d’ardiden',
      LatLng(42.84828, -0.06471),
      2445,
      'LARDI',
    ),
    Nivose(
      'Aiguillettes',
      LatLng(42.74692, 0.18128),
      2120,
      'AIGTE',
    )
  ];

  static final listAvalancheBulletin = <AvalancheBulletin>[
    const AvalancheBulletin(
      'Chablais',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA01.xml',
      Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      'Aravis',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA02.xml',
      Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      'Mont-Blanc',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA03.xml',
      Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      'Bauges',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA04.xml',
      Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      'Beaufortain',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA05.xml',
      Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      'Haute-Tarentaise',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA06.xml',
      Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      'Chartreuse',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA07.xml',
      Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      'Belledonne',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA08.xml',
      Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      'Maurienne',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA09.xml',
      Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      'Vanoise',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA10.xml',
      Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      'Haute-Maurienne',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA11.xml',
      Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      'Grandes-Rousses',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA12.xml',
      Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      'Thabor',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA13.xml',
      Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      'Vercors',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA14.xml',
      Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      'Oisans',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA15.xml',
      Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      'Pelvoux',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA16.xml',
      Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      'Queyras',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA17.xml',
      Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      'Devoluy',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA18.xml',
      Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      'Champsaur',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA19.xml',
      Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      'Embrunnais-Parpaillon',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA20.xml',
      Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      'Ubaye',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA21.xml',
      Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      'Haut-Var-Haut-Verdon',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA22.xml',
      Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      'Mercantour',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA23.xml',
      Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      'Cinto-Rotondo',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA40.xml',
      Mountain.corse,
    ),
    const AvalancheBulletin(
      'Renoso',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA41.xml',
      Mountain.corse,
    ),
    const AvalancheBulletin(
      'Pays-Basque',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA64.xml',
      Mountain.pyrennee,
    ),
    const AvalancheBulletin(
      'Aspe-Ossau',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA65.xml',
      Mountain.pyrennee,
    ),
    const AvalancheBulletin(
      'Haute-Bigorre',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA66.xml',
      Mountain.pyrennee,
    ),
    const AvalancheBulletin(
      'Aure-Louron',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA67.xml',
      Mountain.pyrennee,
    ),
    const AvalancheBulletin(
      'Luchonnais',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA68.xml',
      Mountain.pyrennee,
    ),
    const AvalancheBulletin(
      'Couserans',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA69.xml',
      Mountain.pyrennee,
    ),
    const AvalancheBulletin(
      'Haute-Ariege',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA70.xml',
      Mountain.pyrennee,
    ),
    const AvalancheBulletin(
      'Andorre',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA71.xml',
      Mountain.pyrennee,
    ),
    const AvalancheBulletin(
      'Orlu-St-Barthelemy',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA72.xml',
      Mountain.pyrennee,
    ),
    const AvalancheBulletin(
      'Capcir-Puymorens',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA73.xml',
      Mountain.pyrennee,
    ),
    const AvalancheBulletin(
      'Cerdagne-Canigou',
      'http://api.meteofrance.com/files/mountain/bulletins/BRA74.xml',
      Mountain.pyrennee,
    ),
  ];
}
