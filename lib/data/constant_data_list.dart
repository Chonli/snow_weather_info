import 'package:latlong2/latlong.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:snow_weather_info/model/mountain.dart';
import 'package:snow_weather_info/model/ski_resort.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/model/webcam.dart';

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

  static final webcamsByResort = [
    SkiResort(
      name: 'Abondance',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'TC Essert',
          url: 'https://srv02.trinum.com/ibox/ftpcam/ot-peva_tc-essert.jpg',
        ),
      ],
    ),
    SkiResort(
      name: 'Aillons Margeriaz',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Sommet Des Biolles',
          url: 'https://app.webcam-hd.com/aillons-margeriaz/les-biolles',
        ),
        WebCam(
          name: "Tapis P'TIOU",
          url: 'https://www.skaping.com/les-aillons/margeriaz',
        ),
        WebCam(
          name: "Centre d'accueil",
          url: 'https://www.skaping.com/aillons-margeriaz/1000',
        ),
        WebCam(
          name: 'Les crêtes',
          url: 'https://www.skaping.com/aillons-margeriaz/roc-de-margeriaz',
        ),
      ],
    ),
    SkiResort(
      name: 'Chamrousse',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'La Croix de Chamrousse',
          url: 'https://www.skaping.com/chamrousse/la-croix',
        ),
        WebCam(
          name: 'Les Crêtes',
          url: 'https://www.skaping.com/chamrousse/les-cretes',
        ),
        WebCam(
          name: 'Sommet Casserousse',
          url: 'https://www.skaping.com/chamrousse/panorama-casserousse',
        ),
        WebCam(
          name: 'Roche Béranger',
          url: 'https://www.skaping.com/chamrousse/roche-beranger',
        ),
        WebCam(
          name: 'Chamrousse 1800',
          url:
              'http://static.meteo-chamrousse.com/webcam/webcam-chamrousse.jpg',
        ),
        WebCam(
          name: 'Le Recoin',
          url: 'https://www.skaping.com/chamrousse/recoin/video',
        ),
        WebCam(
          name: "L'Arselle",
          url: 'https://www.chamrousse.com/webcams/Plateau_Arselle_000.jpg',
        ),
      ],
    ),
  ];
}
