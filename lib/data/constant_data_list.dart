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
    ),
    //alpes sud
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
    ),
    //corse
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
    ),
    //pyrennée
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
    const Nivose(
      'Chamonix',
      Coordinate(latitude: 45.929444, longitude: 6.877500),
      1042,
      'CHAMO',
    ),
    const Nivose(
      'Marktein',
      Coordinate(latitude: 47.923056, longitude: 7.031667),
      1184,
      'MARKS',
    ),
    const Nivose(
      'Villard de Lans',
      Coordinate(latitude: 45.078611, longitude: 5.561111),
      1027,
      'VILLA',
    ),
    const Nivose(
      'Le Pleney',
      Coordinate(latitude: 46.168333, longitude: 6.692778),
      1515,
      'PLENE',
    ),
    const Nivose(
      'Targasonne',
      Coordinate(latitude: 42.503889, longitude: 1.973333),
      1600,
      'TARGA',
    ),
    const Nivose(
      'Aston',
      Coordinate(latitude: 42.724167, longitude: 1.691111),
      1587,
      'LOUDE',
    ),
    const Nivose(
      'Loudervielle',
      Coordinate(latitude: 42.796389, longitude: 0.439722),
      1042,
      'CHAMO',
    ),
    const Nivose(
      'Chamrousse',
      Coordinate(latitude: 45.128056, longitude: 5.878333),
      1730,
      'CHAMR',
    ),
    const Nivose(
      'Chamonix',
      Coordinate(latitude: 45.929444, longitude: 6.877500),
      1042,
      'CHAMO',
    ),
    const Nivose(
      "Alpe d'huez",
      Coordinate(latitude: 45.087778, longitude: 6.085556),
      1860,
      'DHUEZ',
    ),
    const Nivose(
      'Le Tour',
      Coordinate(latitude: 46.003889, longitude: 6.948611),
      1500,
      'LTOUR',
    ),
    const Nivose(
      'Grand Bornand',
      Coordinate(latitude: 45.973333, longitude: 6.471944),
      1430,
      'GDBOR',
    ),
    const Nivose(
      'Col des Saisies',
      Coordinate(latitude: 45.755000, longitude: 6.535278),
      1614,
      'SAISI',
    ),
    const Nivose(
      'Saint Antheme',
      Coordinate(latitude: 45.575833, longitude: 3.886111),
      1263,
      'ANTHE',
    ),
    const Nivose(
      'Super Besse',
      Coordinate(latitude: 45.501667, longitude: 2.865833),
      1287,
      'BESSE',
    ),
    const Nivose(
      'Prat de bouc',
      Coordinate(latitude: 45.052233, longitude: 2.791521),
      1405,
      'PBOUC',
    ),
    const Nivose(
      'La pesse',
      Coordinate(latitude: 46.302778, longitude: 5.843056),
      1133,
      'PESSE',
    ),
    const Nivose(
      'Rochejean',
      Coordinate(latitude: 46.728889, longitude: 6.322778),
      1222,
      'ROCHE',
    ),
  ];

  static final listAvalancheBulletin = <AbstractBulletin>[
    const AvalancheBulletinFr(
      massifName: 'Chablais',
      beraNumber: 1,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletinFr(
      massifName: 'Aravis',
      beraNumber: 2,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletinFr(
      massifName: 'Mont-Blanc',
      beraNumber: 3,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletinFr(
      massifName: 'Bauges',
      beraNumber: 4,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletinFr(
      massifName: 'Beaufortain',
      beraNumber: 5,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletinFr(
      massifName: 'Haute-Tarentaise',
      beraNumber: 6,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletinFr(
      massifName: 'Chartreuse',
      beraNumber: 7,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletinFr(
      massifName: 'Belledonne',
      beraNumber: 8,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletinFr(
      massifName: 'Maurienne',
      beraNumber: 9,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletinFr(
      massifName: 'Vanoise',
      beraNumber: 10,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletinFr(
      massifName: 'Haute-Maurienne',
      beraNumber: 11,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletinFr(
      massifName: 'Grandes-Rousses',
      beraNumber: 12,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletinFr(
      massifName: 'Thabor',
      beraNumber: 13,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletinFr(
      massifName: 'Vercors',
      beraNumber: 14,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletinFr(
      massifName: 'Oisans',
      beraNumber: 15,
      mountain: Mountain.alpesNord,
    ),
    const AvalancheBulletinFr(
      massifName: 'Pelvoux',
      beraNumber: 16,
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletinFr(
      massifName: 'Queyras',
      beraNumber: 17,
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletinFr(
      massifName: 'Devoluy',
      beraNumber: 18,
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletinFr(
      massifName: 'Champsaur',
      beraNumber: 19,
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletinFr(
      massifName: 'Embrunnais-Parpaillon',
      beraNumber: 20,
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletinFr(
      massifName: 'Ubaye',
      beraNumber: 21,
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletinFr(
      massifName: 'Haut-Var-Haut-Verdon',
      beraNumber: 22,
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletinFr(
      massifName: 'Mercantour',
      beraNumber: 23,
      mountain: Mountain.alpesSud,
    ),
    const AvalancheBulletinFr(
      massifName: 'Cinto-Rotondo',
      beraNumber: 40,
      mountain: Mountain.corse,
    ),
    const AvalancheBulletinFr(
      massifName: 'Renoso',
      beraNumber: 41,
      mountain: Mountain.corse,
    ),
    const AvalancheBulletinFr(
      massifName: 'Pays-Basque',
      beraNumber: 64,
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletinFr(
      massifName: 'Aspe-Ossau',
      beraNumber: 65,
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletinFr(
      massifName: 'Haute-Bigorre',
      beraNumber: 66,
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletinFr(
      massifName: 'Aure-Louron',
      beraNumber: 67,
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletinFr(
      massifName: 'Luchonnais',
      beraNumber: 68,
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletinFr(
      massifName: 'Couserans',
      beraNumber: 69,
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletinFr(
      massifName: 'Haute-Ariege',
      beraNumber: 70,
      mountain: Mountain.pyrenees,
    ),
    // const AvalancheBulletinFr(
    //   massifName: 'Andorre',
    //   beraNumber: 71,
    //   mountain: Mountain.pyrenees,
    // ),
    const AvalancheBulletinFr(
      massifName: 'Orlu-St-Barthelemy',
      beraNumber: 72,
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletinFr(
      massifName: 'Capcir-Puymorens',
      beraNumber: 73,
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletinFr(
      massifName: 'Cerdagne-Canigou',
      beraNumber: 74,
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletinAndorre(
      massifName: 'Andorre',
      url: 'https://www.meteo.ad/fr/etatneige',
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletinPdf(
      massifName: 'Pirineo Catalán',
      pdfPath:
          'https://www.aemet.es/documentos/es/eltiempo/prediccion/montana/boletin_peligro_aludes/BPA_Pirineo_Cat.pdf',
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletinPdf(
      massifName: 'Pirineo Navarro y Aragonés',
      pdfPath:
          'https://www.aemet.es/documentos/es/eltiempo/prediccion/montana/boletin_peligro_aludes/BPA_Pirineo_Nav_Ara.pdf',
      mountain: Mountain.pyrenees,
    ),
    const AvalancheBulletinPdf(
      massifName: 'Sierras del Cordel y Peña Labra',
      pdfPath:
          'https://www.aemet.es/documentos/es/eltiempo/prediccion/montana/boletin_peligro_aludes/BPA_sierra_Cordel_PLabra.pdf',
      mountain: Mountain.espagne,
    ),
    const AvalancheBulletinPdf(
      massifName: 'Picos de Europa',
      pdfPath:
          'https://www.aemet.es/documentos/es/eltiempo/prediccion/montana/boletin_peligro_aludes/BPA_PN_Picos_Europa.pdf',
      mountain: Mountain.espagne,
    ),
    const AvalancheBulletinPdf(
      massifName: 'Guadarrama',
      pdfPath:
          'https://www.aemet.es/documentos/es/eltiempo/prediccion/montana/boletin_peligro_aludes/BPA_PN_Guadarrama.pdf',
      mountain: Mountain.espagne,
    ),
    const AvalancheBulletinPdf(
      massifName: 'Suisse',
      pdfPath: 'https://aws.slf.ch/api/bulletin/document/full/fr',
      mountain: Mountain.suisse,
    ),
    const AvalancheBulletinPdf(
      massifName: 'Piemont',
      pdfPath:
          'https://bollettini.aineva.it/albina_files/<date>/<date>_IT-21_it.pdf',
      mountain: Mountain.italie,
    ),
    const AvalancheBulletinPdf(
      massifName: 'Lombardie',
      pdfPath:
          'https://bollettini.aineva.it/albina_files/<date>/<date>_IT-25_it.pdf',
      mountain: Mountain.italie,
    ),
    const AvalancheBulletinPdf(
      massifName: 'Aoste',
      pdfPath:
          'https://bollettini.aineva.it/albina_files/<date>/<date>_IT-23_it.pdf',
      mountain: Mountain.italie,
    ),
    const AvalancheBulletinPdf(
      massifName: 'Venetie',
      pdfPath:
          'https://bollettini.aineva.it/albina_files/<date>/<date>_IT-34_it.pdf',
      mountain: Mountain.italie,
    ),
    const AvalancheBulletinPdf(
      massifName: 'Frioul',
      pdfPath:
          'https://bollettini.aineva.it/albina_files/<date>/<date>_IT-36_it.pdf',
      mountain: Mountain.italie,
    ),
    const AvalancheBulletinPdf(
      massifName: 'Haut Adige',
      pdfPath:
          'https://bollettini.aineva.it/albina_files/<date>/<date>_IT-32-BZ_it.pdf',
      mountain: Mountain.italie,
    ),
    const AvalancheBulletinPdf(
      massifName: 'Trentin',
      pdfPath:
          'https://bollettini.aineva.it/albina_files/<date>/<date>_IT-32-TN_it.pdf',
      mountain: Mountain.italie,
    ),
    const AvalancheBulletinPdf(
      massifName: 'Marche',
      pdfPath:
          'https://bollettini.aineva.it/albina_files/<date>/<date>_IT-57_it.pdf',
      mountain: Mountain.italie,
    ),
  ];
}
