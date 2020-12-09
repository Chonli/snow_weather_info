import 'package:latlong/latlong.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:snow_weather_info/model/station.dart';

class ConstantDatalist {
  static final List<Nivose> listNivose = [
    //alpes nord
    Nivose(
      "Aiguilles rouges",
      LatLng(45.986125, 6.895937),
      2330,
      'AIGRG',
    ),
    Nivose(
      "Bellecote",
      LatLng(45.48881, 6.77163),
      3000,
      'BELLE',
    ),
    Nivose(
      "Le Chevril",
      LatLng(45.50179, 6.95604),
      2560,
      'CHEVR',
    ),
    Nivose(
      "Bonneval",
      LatLng(45.35175, 7.05132),
      2720,
      'BONNE',
    ),
    Nivose(
      "Les rochilles",
      LatLng(45.08467, 6.47127),
      2450,
      'ROCHI',
    ),
    Nivose(
      "Allant",
      LatLng(45.66345, 6.21195),
      1630,
      'ALLAN',
    ),
    Nivose(
      "Grande Parei",
      LatLng(45.61463, 6.64750),
      2240,
      'PAREI',
    ),
    Nivose(
      "Col de Porte",
      LatLng(45.2952742, 5.7651929),
      1325,
      'COLPO',
    ),
    Nivose(
      "St Hilaire",
      LatLng(45.31449, 5.86462),
      1700,
      'STHIL',
    ),
    Nivose(
      "Aigleton",
      LatLng(45.2311598, 6.0381140),
      2240,
      'AIGLE',
    ),
    Nivose(
      "Le Gua",
      LatLng(45.01517, 5.58951),
      1600,
      'LEGUA',
    ),
    Nivose(
      "Les Ecrins",
      LatLng(44.93681, 6.34602),
      2940,
      'ECRIN',
    ),
    Nivose(
      "La Meije",
      LatLng(45.01255, 6.26485),
      3100,
      'MEIJE',
    ),
    Nivose(
      "Galibier",
      LatLng(45.05733, 6.37739),
      2559,
      'GALIB',
    )
    //alpes sud
    ,
    Nivose(
      "Orcières",
      LatLng(44.71857, 6.33378),
      2294,
      'ORCIE',
    ),
    Nivose(
      "Col Agnel",
      LatLng(44.68873, 6.97625),
      2630,
      'AGNEL',
    ),
    Nivose(
      "Restefond",
      LatLng(44.34205, 6.79871),
      2550,
      'RESTE',
    ),
    Nivose(
      "Millefonts",
      LatLng(44.11819, 7.19226),
      2430,
      'MILLE',
    ),
    Nivose(
      "Parpaillon",
      LatLng(44.49522, 6.63650),
      2545,
      'PARPA',
    )
    //corse
    ,
    Nivose(
      "Sponde",
      LatLng(42.32448, 8.88478),
      1980,
      'SPOND',
    ),
    Nivose(
      "Maniccia",
      LatLng(42.20837, 9.04888),
      2360,
      'MANIC',
    )
    //pyrennée
    ,
    Nivose(
      "Maupas",
      LatLng(42.71428, 0.54995),
      2430,
      'MAUPA',
    ),
    Nivose(
      "Port d`'Aula",
      LatLng(42.76993, 1.11493),
      2140,
      'PAULA',
    ),
    Nivose(
      "Canigou",
      LatLng(42.53322, 2.46096),
      2150,
      'CANIG',
    ),
    Nivose(
      "Hospitalet",
      LatLng(42.57778, 1.81140),
      2293,
      'HOSPI',
    ),
    Nivose(
      "Puigmal",
      LatLng(42.38318, 2.09143),
      2467,
      'PUIGN',
    ),
    Nivose(
      "Soum Couy",
      LatLng(42.96157, -0.71995),
      2150,
      'SOUMC',
    ),
    Nivose(
      "Lac d'ardiden",
      LatLng(42.84828, -0.06471),
      2445,
      'LARDI',
    ),
    Nivose(
      "Aiguillettes",
      LatLng(42.74692, 0.18128),
      2120,
      'AIGTE',
    )
  ];

  static final listAvalancheBulletin = [
    AvalancheBulletin(
      "Chablais",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP01.pdf",
      Mountain.alpes_nord,
    ),
    AvalancheBulletin(
      "Aravis",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP02.pdf",
      Mountain.alpes_nord,
    ),
    AvalancheBulletin(
      "Mont-Blanc",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP03.pdf",
      Mountain.alpes_nord,
    ),
    AvalancheBulletin(
      "Bauges",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP04.pdf",
      Mountain.alpes_nord,
    ),
    AvalancheBulletin(
      "Beaufortain",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP05.pdf",
      Mountain.alpes_nord,
    ),
    AvalancheBulletin(
      "Haute-Tarentaise",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP06.pdf",
      Mountain.alpes_nord,
    ),
    AvalancheBulletin(
      "Chartreuse",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP07.pdf",
      Mountain.alpes_nord,
    ),
    AvalancheBulletin(
      "Belledonne",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP08.pdf",
      Mountain.alpes_nord,
    ),
    AvalancheBulletin(
      "Maurienne",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP09.pdf",
      Mountain.alpes_nord,
    ),
    AvalancheBulletin(
      "Vanoise",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP10.pdf",
      Mountain.alpes_nord,
    ),
    AvalancheBulletin(
      "Haute-Maurienne",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP11.pdf",
      Mountain.alpes_nord,
    ),
    AvalancheBulletin(
      "Grandes-Rousses",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP12.pdf",
      Mountain.alpes_nord,
    ),
    AvalancheBulletin(
      "Thabor",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP13.pdf",
      Mountain.alpes_nord,
    ),
    AvalancheBulletin(
      "Vercors",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP14.pdf",
      Mountain.alpes_nord,
    ),
    AvalancheBulletin(
      "Oisans",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP15.pdf",
      Mountain.alpes_nord,
    ),
    AvalancheBulletin(
      "Pelvoux",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP16.pdf",
      Mountain.alpes_sud,
    ),
    AvalancheBulletin(
      "Queyras",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP17.pdf",
      Mountain.alpes_sud,
    ),
    AvalancheBulletin(
      "Devoluy",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP18.pdf",
      Mountain.alpes_sud,
    ),
    AvalancheBulletin(
      "Champsaur",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP19.pdf",
      Mountain.alpes_sud,
    ),
    AvalancheBulletin(
      "Embrunnais-Parpaillon",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP20.pdf",
      Mountain.alpes_sud,
    ),
    AvalancheBulletin(
      "Ubaye",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP21.pdf",
      Mountain.alpes_sud,
    ),
    AvalancheBulletin(
      "Haut-Var-Haut-Verdon",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP22.pdf",
      Mountain.alpes_sud,
    ),
    AvalancheBulletin(
      "Mercantour",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP23.pdf",
      Mountain.alpes_sud,
    ),
    AvalancheBulletin(
      "Cinto-Rotondo",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP40.pdf",
      Mountain.corse,
    ),
    AvalancheBulletin(
      "Renoso",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP41.pdf",
      Mountain.corse,
    ),
    AvalancheBulletin(
      "Pays-Basque",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP64.pdf",
      Mountain.pyrennee,
    ),
    AvalancheBulletin(
      "Aspe-Ossau",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP65.pdf",
      Mountain.pyrennee,
    ),
    AvalancheBulletin(
      "Haute-Bigorre",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP66.pdf",
      Mountain.pyrennee,
    ),
    AvalancheBulletin(
      "Aure-Louron",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP67.pdf",
      Mountain.pyrennee,
    ),
    AvalancheBulletin(
      "Luchonnais",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP68.pdf",
      Mountain.pyrennee,
    ),
    AvalancheBulletin(
      "Couserans",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP69.pdf",
      Mountain.pyrennee,
    ),
    AvalancheBulletin(
      "Haute-Ariege",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP70.pdf",
      Mountain.pyrennee,
    ),
    AvalancheBulletin(
      "Andorre",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP71.pdf",
      Mountain.pyrennee,
    ),
    AvalancheBulletin(
      "Orlu-St-Barthelemy",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP72.pdf",
      Mountain.pyrennee,
    ),
    AvalancheBulletin(
      "Capcir-Puymorens",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP73.pdf",
      Mountain.pyrennee,
    ),
    AvalancheBulletin(
      "Cerdagne-Canigou",
      "http://www.meteofrance.com/integration/sim-portail/generated/integration/img/produits/pdf/bulletins_bra/OPP74.pdf",
      Mountain.pyrennee,
    ),
  ];
}
