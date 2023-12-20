import 'package:latlong2/latlong.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:snow_weather_info/model/station.dart';

abstract class ConstantDatalist {
  ConstantDatalist._();

  static final listNivose = <Nivose>[
    //alpes nord
    Nivose(
      'Aiguilles rouges',
      const LatLng(45.986125, 6.895937),
      2330,
      'AIGRG',
    ),
    Nivose(
      'Bellecote',
      const LatLng(45.48881, 6.77163),
      3000,
      'BELLE',
    ),
    Nivose(
      'Le Chevril',
      const LatLng(45.50179, 6.95604),
      2560,
      'CHEVR',
    ),
    Nivose(
      'Bonneval',
      const LatLng(45.35175, 7.05132),
      2720,
      'BONNE',
    ),
    Nivose(
      'Les rochilles',
      const LatLng(45.08467, 6.47127),
      2450,
      'ROCHI',
    ),
    Nivose(
      'Allant',
      const LatLng(45.66345, 6.21195),
      1630,
      'ALLAN',
    ),
    Nivose(
      'Grande Parei',
      const LatLng(45.61463, 6.64750),
      2240,
      'PAREI',
    ),
    Nivose(
      'Col de Porte',
      const LatLng(45.2952742, 5.7651929),
      1325,
      'COLPO',
    ),
    Nivose(
      'St Hilaire',
      const LatLng(45.31449, 5.86462),
      1700,
      'STHIL',
    ),
    Nivose(
      'Aigleton',
      const LatLng(45.2311598, 6.0381140),
      2240,
      'AIGLE',
    ),
    Nivose(
      'Le Gua',
      const LatLng(45.01517, 5.58951),
      1600,
      'LEGUA',
    ),
    Nivose(
      'Les Ecrins',
      const LatLng(44.93681, 6.34602),
      2940,
      'ECRIN',
    ),
    Nivose(
      'La Meije',
      const LatLng(45.01255, 6.26485),
      3100,
      'MEIJE',
    ),
    Nivose(
      'Galibier',
      const LatLng(45.05733, 6.37739),
      2559,
      'GALIB',
    )
    //alpes sud
    ,
    Nivose(
      'Orcières',
      const LatLng(44.71857, 6.33378),
      2294,
      'ORCIE',
    ),
    Nivose(
      'Col Agnel',
      const LatLng(44.68873, 6.97625),
      2630,
      'AGNEL',
    ),
    Nivose(
      'Restefond',
      const LatLng(44.34205, 6.79871),
      2550,
      'RESTE',
    ),
    Nivose(
      'Millefonts',
      const LatLng(44.11819, 7.19226),
      2430,
      'MILLE',
    ),
    Nivose(
      'Parpaillon',
      const LatLng(44.49522, 6.63650),
      2545,
      'PARPA',
    )
    //corse
    ,
    Nivose(
      'Sponde',
      const LatLng(42.32448, 8.88478),
      1980,
      'SPOND',
    ),
    Nivose(
      'Maniccia',
      const LatLng(42.20837, 9.04888),
      2360,
      'MANIC',
    )
    //pyrennée
    ,
    Nivose(
      'Maupas',
      const LatLng(42.71428, 0.54995),
      2430,
      'MAUPA',
    ),
    Nivose(
      'Port d`Aula',
      const LatLng(42.76993, 1.11493),
      2140,
      'PAULA',
    ),
    Nivose(
      'Canigou',
      const LatLng(42.53322, 2.46096),
      2150,
      'CANIG',
    ),
    Nivose(
      'Hospitalet',
      const LatLng(42.57778, 1.81140),
      2293,
      'HOSPI',
    ),
    Nivose(
      'Puigmal',
      const LatLng(42.38318, 2.09143),
      2467,
      'PUIGN',
    ),
    Nivose(
      'Soum Couy',
      const LatLng(42.96157, -0.71995),
      2150,
      'SOUMC',
    ),
    Nivose(
      'Lac d’ardiden',
      const LatLng(42.84828, -0.06471),
      2445,
      'LARDI',
    ),
    Nivose(
      'Aiguillettes',
      const LatLng(42.74692, 0.18128),
      2120,
      'AIGTE',
    ),
  ];

  static final listAvalancheBulletin = <AvalancheBulletin>[
    const AvalancheBulletin(
      massifName: 'Chablais',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA01.xml',
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Aravis',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA02.xml',
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Mont-Blanc',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA03.xml',
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Bauges',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA04.xml',
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Beaufortain',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA05.xml',
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Haute-Tarentaise',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA06.xml',
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Chartreuse',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA07.xml',
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Belledonne',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA08.xml',
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Maurienne',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA09.xml',
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Vanoise',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA10.xml',
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Haute-Maurienne',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA11.xml',
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Grandes-Rousses',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA12.xml',
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Thabor',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA13.xml',
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Vercors',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA14.xml',
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Oisans',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA15.xml',
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletin(
      massifName: 'Pelvoux',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA16.xml',
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      massifName: 'Queyras',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA17.xml',
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      massifName: 'Devoluy',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA18.xml',
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      massifName: 'Champsaur',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA19.xml',
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      massifName: 'Embrunnais-Parpaillon',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA20.xml',
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      massifName: 'Ubaye',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA21.xml',
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      massifName: 'Haut-Var-Haut-Verdon',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA22.xml',
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      massifName: 'Mercantour',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA23.xml',
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletin(
      massifName: 'Cinto-Rotondo',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA40.xml',
      mountain: Mountain.corse,
    ),
    const AvalancheBulletin(
      massifName: 'Renoso',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA41.xml',
      mountain: Mountain.corse,
    ),
    const AvalancheBulletin(
      massifName: 'Pays-Basque',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA64.xml',
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletin(
      massifName: 'Aspe-Ossau',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA65.xml',
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletin(
      massifName: 'Haute-Bigorre',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA66.xml',
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletin(
      massifName: 'Aure-Louron',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA67.xml',
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletin(
      massifName: 'Luchonnais',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA68.xml',
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletin(
      massifName: 'Couserans',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA69.xml',
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletin(
      massifName: 'Haute-Ariege',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA70.xml',
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletin(
      massifName: 'Andorre',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA71.xml',
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletin(
      massifName: 'Orlu-St-Barthelemy',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA72.xml',
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletin(
      massifName: 'Capcir-Puymorens',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA73.xml',
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletin(
      massifName: 'Cerdagne-Canigou',
      url: 'http://api.meteofrance.com/files/mountain/bulletins/BRA74.xml',
      mountain: Mountain.pyrenees,
    ),
  ];
}
