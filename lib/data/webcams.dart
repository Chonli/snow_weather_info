import 'package:snow_weather_info/model/mountain.dart';
import 'package:snow_weather_info/model/ski_resort.dart';
import 'package:snow_weather_info/model/webcam.dart';

abstract class ConstSkiResorts {
  static final webcamsByResort = [
    // Alpes du nord
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
      name: 'Albiez',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Haut Echaux',
          url: 'https://m.webcam-hd.com/albiez/haut-echaux',
        ),
      ],
    ),
    SkiResort(
      name: "Alpe d'huez",
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Pic Blanc',
          url: 'https://www.skaping.com/alpedhuez/pic-blanc',
        ),
        WebCam(
          name: 'Le Signal',
          url: 'https://www.skaping.com/alpedhuez/lesignal',
        ),
        WebCam(
          name: '2100m',
          url: 'https://www.skaping.com/alpedhuez/2100m',
        ),
        WebCam(
          name: 'Marmottes 3 (3060m)',
          url: 'https://www.skaping.com/alpedhuez/3060m',
        ),
        WebCam(
          name: "Signal de l'homme",
          url: 'https://www.skaping.com/alpedhuez/auris',
        ),
        WebCam(
          name: '2700m',
          url: 'https://www.skaping.com/alpedhuez/2700m',
        ),
        WebCam(
          name: 'Auris Station',
          url: 'https://www.skaping.com/alpedhuez/auris-station',
        ),
        WebCam(
          name: "L'Herpie",
          url: 'https://youtu.be/7SheNmPKU9E',
        ),
        WebCam(
          name: 'Alpette',
          url: 'https://app.webcam-hd.com/vaujany/alpette',
        ),
        WebCam(
          name: 'Montfrais',
          url: 'https://app.webcam-hd.com/vaujany/front-de-neige',
        ),
        WebCam(
          name: 'Petites Rousses (2800m)',
          url: 'https://app.webcam-hd.com/vaujany/sommet-2800',
        ),
      ],
    ),
    SkiResort(
      name: 'Alpe du Grand Serre',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'La Blanche',
          url: 'https://app.webcam-hd.com/alpe-du-grand-serre/la-blache',
        ),
        WebCam(
          name: 'Les Cochettes',
          url: 'https://app.webcam-hd.com/alpe-du-grand-serre/les-cochettes',
        ),
        WebCam(
          name: 'Serriou',
          url: 'https://app.webcam-hd.com/alpe-du-grand-serre/serriou',
        ),
        WebCam(
          name: 'Les Bergeries',
          url: 'https://app.webcam-hd.com/alpe-du-grand-serre/la-flambee',
        ),
      ],
    ),
    SkiResort(
      name: 'Areches Beaufort',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Curvy',
          url: 'https://app.webcam-hd.com/areches-beaufort/cuvy',
        ),
        WebCam(
          name: 'Bonnets Rouges',
          url: 'https://app.webcam-hd.com/areches-beaufort/bonnets-rouges',
        ),
        WebCam(
          name: 'Planay',
          url: 'https://app.webcam-hd.com/areches-beaufort/planay',
        ),
        WebCam(
          name: 'Arolles',
          url: 'https://app.webcam-hd.com/areches-beaufort/arolles',
        ),
      ],
    ),
    SkiResort(
      name: 'Aussois',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Front Neige',
          url:
              'https://vision.quanteec.com/contents/encodings/live/4e4fed78-ef45-43a7-746c-7561-6665-64-94fc-975529b56614d/poster.jpg',
        ),
        WebCam(
          name: 'Domaine Nordique',
          url: 'https://app.webcam-hd.com/aussois/domaine-nordique-monolithe',
        ),
        WebCam(
          name: 'Grand Jeu',
          url: 'https://app.webcam-hd.com/aussois/grand-jeu',
        ),
        WebCam(
          name: 'Armoise',
          url: 'https://app.webcam-hd.com/aussois/sommet-armoise',
        ),
      ],
    ),
    SkiResort(
      name: 'Autrans Méaudre',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Tremplin',
          url: 'https://app.webcam-hd.com/autrans-meaudre/autrans_tremplin',
        ),
        WebCam(
          name: 'Sommet Domaine',
          url: 'https://www.trinum.com/ibox/ftpcam/Autrans_tsf-la-quoi.jpg',
        ),
        WebCam(
          name: 'Méaudre Front Neige',
          url: 'https://www.trinum.com/ibox/ftpcam/meaudre_front.jpg',
        ),
        WebCam(
          name: 'Méaudre Foyer Ski de Fond',
          url:
              'https://app.webcam-hd.com/autrans-meaudre/centre-nordique-meaudre',
        ),
        WebCam(
          name: 'Gève',
          url: 'https://www.trinum.com/ibox/ftpcam/geve.jpg',
        ),
        WebCam(
          name: 'Zipline (1300m)',
          url:
              'https://www.trinum.com/ibox/ftpcam/autrans-meaudre_depart-zipline-vercors-meaudre-alt.1300m.jpg',
        ),
        WebCam(
          name: 'Autrans Foyer Ski de Fond',
          url: 'https://www.trinum.com/ibox/ftpcam/autran-village.jpg',
        ),
        WebCam(
          name: 'La Sure',
          url:
              'https://www.trinum.com/ibox/ftpcam/autrans-meaudre_auberge-poya.jpg',
        ),
      ],
    ),
    SkiResort(
      name: 'Portes du Soleil',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Avoriaz - Station',
          url: 'https://www.skaping.com/avoriaz/station',
        ),
        WebCam(
          name: 'Avoriaz - Pistes',
          url: 'https://www.skaping.com/avoriaz/pistes',
        ),
        WebCam(
          name: 'Avoriaz - Amara',
          url: 'https://www.skaping.com/avoriaz/amara',
        ),
        WebCam(
          name: 'Avoriaz - Arare',
          url: 'https://www.skaping.com/portes-du-soleil/avoriaz/arare',
        ),
        WebCam(
          name: 'Avoriaz - Zore',
          url: 'https://app.webcam-hd.com/avoriaz/zore',
        ),
        WebCam(
          name: 'Avoriaz - Fornet',
          url: 'https://m.webcam-hd.com/avoriaz/fornet',
        ),
        WebCam(
          name: 'Montriond - Les Lindarets',
          url: 'https://www.skaping.com/montriond/ardent',
        ),
        WebCam(
          name: 'Morzine - Chamossière',
          url: 'https://m.webcam-hd.com/morzine/chamossiere',
        ),
        WebCam(
          name: 'Morzine - Raverettes',
          url: 'https://www.skaping.com/portes-du-soleil/morzine',
        ),
        WebCam(
          name: 'Morzine - Sommet du Pleney',
          url: 'https://app.webcam-hd.com/morzine/sommet-du-pleney',
        ),
        WebCam(
          name: 'Les Gets - Ranfoilly',
          url: 'https://www.skaping.com/portes-du-soleil/les-gets',
        ),
        WebCam(
          name: 'Les Gets - Plateau des Chavannes',
          url: 'https://app.webcam-hd.com/lesgets/plateau-des-chavannes',
        ),
        WebCam(
          name: 'Morgins - La Foilleuse',
          url: 'https://pds-ch.roundshot.com/morgins/#/',
        ),
        WebCam(
          name: 'Morgins (1442m)',
          url: 'https://morgins.roundshot.com/#/',
        ),
        WebCam(
          name: 'Les Crosets',
          url: 'https://pds-ch.roundshot.com/lescrosets/#/',
        ),
        WebCam(
          name: 'Champery',
          url: 'https://champery.roundshot.com/#/',
        ),
        WebCam(
          name: "Saint Jean d'Aulps - Plateau",
          url:
              'https://app.webcam-hd.com/vallee-d-aulps/plateau-st-jean-d-aulps',
        ),
        WebCam(
          name: "Saint Jean d'Aulps - Les Têtes",
          url: 'https://www.skaping.com/rocdenfer',
        ),
        WebCam(
          name: 'Châtel - Morclan',
          url: 'https://m.webcam-hd.com/chatel/morclan',
        ),
        WebCam(
          name: 'Châtel - Rochassons',
          url: 'https://www.skaping.com/chatel/rochassons',
        ),
        WebCam(
          name: 'Châtel - Echo Alpin',
          url: 'https://m.webcam-hd.com/chatel/ts-echo-alpin',
        ),
        WebCam(
          name: 'Abondance',
          url: 'https://m.webcam-hd.com/ot-peva/tc-essert',
        ),
        WebCam(
          name: "Chapelle d'Abondance",
          url: 'https://m.webcam-hd.com/la-chapelle/braitaz',
        ),
        WebCam(
          name: 'Torgon',
          url: 'https://m.webcam-hd.com/chatel/torgon',
        ),
      ],
    ),
    SkiResort(
      name: 'Bernex',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Départ Télésiège',
          url: 'https://app.webcam-hd.com/bernex/front-de-neige',
        ),
        WebCam(
          name: 'Pré-Richard',
          url: 'https://app.webcam-hd.com/ot-peva/bernex-pr',
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
    // Alpes du sud
    SkiResort(
      name: 'Ancelle',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Station',
          url: 'https://app.webcam-hd.com/ancelle/station',
        ),
        WebCam(
          name: 'Domaine Nordique',
          url: 'https://app.webcam-hd.com/ancelle/nordique',
        ),
        WebCam(
          name: 'Sommet Zenith',
          url: 'https://app.webcam-hd.com/champsaur-valgaudemar/ancelle-zenith',
        ),
      ],
    ),
    SkiResort(
      name: 'Auron',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Cime de Chevalet',
          url:
              'https://www.trinum.com/ibox/ftpcam/mega_auron_cime-de-chevalet.jpg',
        ),
        WebCam(
          name: 'Berchia',
          url: 'https://www.trinum.com/ibox/ftpcam/mega_auron_berchia.jpg',
        ),
        WebCam(
          name: 'Chastellares',
          url:
              'https://www.trinum.com/ibox/ftpcam/mega_auron_depart-las-donnas.jpg',
        ),
        WebCam(
          name: 'Blairon',
          url: 'https://www.trinum.com/ibox/ftpcam/mega_auron_blainon.jpg',
        ),
        WebCam(
          name: 'Village',
          url: 'https://www.trinum.com/ibox/ftpcam/mega_auron_village.jpg',
        ),
      ],
    ),
    SkiResort(
      name: 'Isola 2000',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Centre Station',
          url:
              'https://www.trinum.com/ibox/ftpcam/mega_isola-2000_centre-station.jpg',
        ),
        WebCam(
          name: 'Pélevos',
          url:
              'https://www.trinum.com/ibox/ftpcam/mega_isola-2000_snowpark.jpg',
        ),
        WebCam(
          name: 'Chastillon',
          url: 'https://www.trinum.com/ibox/ftpcam/mega_isola-2000_station.jpg',
        ),
        WebCam(
          name: 'Tête Cabane',
          url:
              'https://www.trinum.com/ibox/ftpcam/mega_isola-2000_tete-cabane.jpg',
        ),
        WebCam(
          name: 'Front de Neige',
          url:
              'https://www.trinum.com/ibox/ftpcam/mega_isola-2000_front-de-neige.jpg',
        ),
        WebCam(
          name: 'Sistron',
          url: 'https://www.trinum.com/ibox/ftpcam/mega_isola-2000_sistron.jpg',
        ),
      ],
    ),
    SkiResort(
      name: 'Saint Dalmas le Selvage',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Village',
          url:
              'https://www.trinum.com/ibox/ftpcam/mega_st-dalmas-le-selvage_mairie.jpg',
        ),
      ],
    ),
    // Pyrenees
    SkiResort(
      name: 'Astún',
      mountain: Mountain.pyrenees,
      webcams: [
        WebCam(
          name: 'Canal Roya',
          url: 'https://astuncandanchu.com/camara/canalroya.jpg',
        ),
        WebCam(
          name: 'Cima Raca',
          url: 'https://astuncandanchu.com/camara/cimaraca.jpg',
        ),
        WebCam(
          name: 'Prado Blanco',
          url: 'https://astuncandanchu.com/camara/pradoblanco.jpg',
        ),
        WebCam(
          name: 'Sarrios - Águila',
          url: 'https://astuncandanchu.com/camara/sarrios-aguila.jpg',
        ),
        WebCam(
          name: 'Truchas',
          url: 'https://astuncandanchu.com/camara/truchas.jpg',
        ),
        WebCam(
          name: 'Ts Águila',
          url: 'https://astuncandanchu.com/camara/aguila.jpg',
        ),
      ],
    ),
    SkiResort(
      name: 'Ax 3 Domaines',
      mountain: Mountain.pyrenees,
      webcams: [
        WebCam(
          name: 'Saquet - 2300m',
          url: 'https://pv.viewsurf.com/1128/Ax-3-Domaines-Tute',
        ),
        WebCam(
          name: 'Saquet - 2000m',
          url: 'https://pv.viewsurf.com/1154/Ax-3-Domaines-Saquet-2000',
        ),
        WebCam(
          name: 'Prat Ferrou - 1550m',
          url: 'https://pv.viewsurf.com/2078/Ax-3-Domaines-Prat',
        ),
        WebCam(
          name: 'Bonascre - 1400m',
          url: 'https://pv.viewsurf.com/1124/Ax-3-Domaines-Bonascre',
        ),
      ],
    ),
    SkiResort(
      name: 'Baqueira - Beret',
      mountain: Mountain.pyrenees,
      webcams: [
        WebCam(
          name: 'Blanhiblar',
          url: 'https://baqueira.roundshot.com/blanhiblar/',
        ),
        WebCam(
          name: 'Bosque',
          url: 'https://baqueira.roundshot.com/bosque/',
        ),
        WebCam(
          name: 'Teso',
          url: 'https://baqueira.roundshot.com/teso/',
        ),
      ],
    ),
  ];
}
