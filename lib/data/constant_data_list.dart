import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:snow_weather_info/model/coordinate.dart';
import 'package:snow_weather_info/model/mountain.dart';
import 'package:snow_weather_info/model/station.dart';

abstract class ConstantDatalist {
  ConstantDatalist._();

  static final listNivose = <Nivose>[
    //alpes nord
    const Nivose(
      'Aiguilles rouges',
      Coordinate(latitude: 45.986125, longitude: 6.895937),
      2330,
      'AIGRG',
    ),
    const Nivose(
      'Bellecote',
      Coordinate(latitude: 45.48881, longitude: 6.77163),
      3000,
      'BELLE',
    ),
    const Nivose(
      'Le Chevril',
      Coordinate(latitude: 45.50179, longitude: 6.95604),
      2560,
      'CHEVR',
    ),
    const Nivose(
      'Bonneval',
      Coordinate(latitude: 45.35175, longitude: 7.05132),
      2720,
      'BONNE',
    ),
    const Nivose(
      'Les rochilles',
      Coordinate(latitude: 45.08467, longitude: 6.47127),
      2450,
      'ROCHI',
    ),
    const Nivose(
      'Allant',
      Coordinate(latitude: 45.66345, longitude: 6.21195),
      1630,
      'ALLAN',
    ),
    const Nivose(
      'Grande Parei',
      Coordinate(latitude: 45.61463, longitude: 6.64750),
      2240,
      'PAREI',
    ),
    const Nivose(
      'Col de Porte',
      Coordinate(latitude: 45.2952742, longitude: 5.7651929),
      1325,
      'COLPO',
    ),
    const Nivose(
      'St Hilaire',
      Coordinate(latitude: 45.31449, longitude: 5.86462),
      1700,
      'STHIL',
    ),
    const Nivose(
      'Aigleton',
      Coordinate(latitude: 45.2311598, longitude: 6.0381140),
      2240,
      'AIGLE',
    ),
    const Nivose(
      'Le Gua',
      Coordinate(latitude: 45.01517, longitude: 5.58951),
      1600,
      'LEGUA',
    ),
    const Nivose(
      'Les Ecrins',
      Coordinate(latitude: 44.93681, longitude: 6.34602),
      2940,
      'ECRIN',
    ),
    const Nivose(
      'La Meije',
      Coordinate(latitude: 45.01255, longitude: 6.26485),
      3100,
      'MEIJE',
    ),
    const Nivose(
      'Galibier',
      Coordinate(latitude: 45.05733, longitude: 6.37739),
      2559,
      'GALIB',
    )
    //alpes sud
    ,
    const Nivose(
      'Orcières',
      Coordinate(latitude: 44.71857, longitude: 6.33378),
      2294,
      'ORCIE',
    ),
    const Nivose(
      'Col Agnel',
      Coordinate(latitude: 44.68873, longitude: 6.97625),
      2630,
      'AGNEL',
    ),
    const Nivose(
      'Restefond',
      Coordinate(latitude: 44.34205, longitude: 6.79871),
      2550,
      'RESTE',
    ),
    const Nivose(
      'Millefonts',
      Coordinate(latitude: 44.11819, longitude: 7.19226),
      2430,
      'MILLE',
    ),
    const Nivose(
      'Parpaillon',
      Coordinate(latitude: 44.49522, longitude: 6.63650),
      2545,
      'PARPA',
    )
    //corse
    ,
    const Nivose(
      'Sponde',
      Coordinate(latitude: 42.32448, longitude: 8.88478),
      1980,
      'SPOND',
    ),
    const Nivose(
      'Maniccia',
      Coordinate(latitude: 42.20837, longitude: 9.04888),
      2360,
      'MANIC',
    )
    //pyrennée
    ,
    const Nivose(
      'Maupas',
      Coordinate(latitude: 42.71428, longitude: 0.54995),
      2430,
      'MAUPA',
    ),
    const Nivose(
      'Port d`Aula',
      Coordinate(latitude: 42.76993, longitude: 1.11493),
      2140,
      'PAULA',
    ),
    const Nivose(
      'Canigou',
      Coordinate(latitude: 42.53322, longitude: 2.46096),
      2150,
      'CANIG',
    ),
    const Nivose(
      'Hospitalet',
      Coordinate(latitude: 42.57778, longitude: 1.81140),
      2293,
      'HOSPI',
    ),
    const Nivose(
      'Puigmal',
      Coordinate(latitude: 42.38318, longitude: 2.09143),
      2467,
      'PUIGN',
    ),
    const Nivose(
      'Soum Couy',
      Coordinate(latitude: 42.96157, longitude: -0.71995),
      2150,
      'SOUMC',
    ),
    const Nivose(
      'Lac d’ardiden',
      Coordinate(latitude: 42.84828, longitude: -0.06471),
      2445,
      'LARDI',
    ),
    const Nivose(
      'Aiguillettes',
      Coordinate(latitude: 42.74692, longitude: 0.18128),
      2120,
      'AIGTE',
    ),
  ];

  static final listAvalancheBulletin = <AvalancheBulletin>[
    const AvalancheBulletin(
      massifName: 'Chablais',
      beraNumber: 1,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Aravis',
      beraNumber: 2,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Mont-Blanc',
      beraNumber: 3,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Bauges',
      beraNumber: 4,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Beaufortain',
      beraNumber: 5,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Haute-Tarentaise',
      beraNumber: 6,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Chartreuse',
      beraNumber: 7,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Belledonne',
      beraNumber: 8,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Maurienne',
      beraNumber: 9,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Vanoise',
      beraNumber: 10,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Haute-Maurienne',
      beraNumber: 11,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Grandes-Rousses',
      beraNumber: 12,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Thabor',
      beraNumber: 13,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Vercors',
      beraNumber: 14,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Oisans',
      beraNumber: 15,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Pelvoux',
      beraNumber: 16,
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      massifName: 'Queyras',
      beraNumber: 17,
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      massifName: 'Devoluy',
      beraNumber: 18,
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      massifName: 'Champsaur',
      beraNumber: 19,
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      massifName: 'Embrunnais-Parpaillon',
      beraNumber: 20,
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      massifName: 'Ubaye',
      beraNumber: 21,
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      massifName: 'Haut-Var-Haut-Verdon',
      beraNumber: 22,
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      massifName: 'Mercantour',
      beraNumber: 23,
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      massifName: 'Cinto-Rotondo',
      beraNumber: 40,
      mountain: Mountain.corse,
    ),
    const AvalancheBulletin(
      massifName: 'Renoso',
      beraNumber: 41,
      mountain: Mountain.corse,
    ),
    const AvalancheBulletin(
      massifName: 'Pays-Basque',
      beraNumber: 64,
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletin(
      massifName: 'Aspe-Ossau',
      beraNumber: 65,
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletin(
      massifName: 'Haute-Bigorre',
      beraNumber: 66,
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletin(
      massifName: 'Aure-Louron',
      beraNumber: 67,
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletin(
      massifName: 'Luchonnais',
      beraNumber: 68,
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletin(
      massifName: 'Couserans',
      beraNumber: 69,
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletin(
      massifName: 'Haute-Ariege',
      beraNumber: 70,
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletin(
      massifName: 'Andorre',
      beraNumber: 71,
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletin(
      massifName: 'Orlu-St-Barthelemy',
      beraNumber: 72,
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletin(
      massifName: 'Capcir-Puymorens',
      beraNumber: 73,
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletin(
      massifName: 'Cerdagne-Canigou',
      beraNumber: 74,
      mountain: Mountain.pyrenees,
    ),
  ];
}
