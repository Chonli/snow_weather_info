import 'package:snow_weather_info/model/mountain.dart';
import 'package:snow_weather_info/model/ski_resort.dart';
import 'package:snow_weather_info/model/webcam.dart';

//last id: 101

abstract class ConstSkiResorts {
  static const webcamsByResort = [
    ...webcamsNord,
    ...webcamsSud,
    ...webcamsPyrenees,
    ...webcamsCorse,
    ...webcamsCentral,
    ...webcamsJura,
    ...webcamsVosges,
  ];

  static const webcamsNord = [
// Alpes du nord
    SkiResort(
      id: 0,
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
      id: 1,
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
      id: 2,
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
      id: 3,
      name: "Alpe d'huez",
      description:
          "Alpe d'huez, Auris en Oisans, La Garde, Le Freney d'Oisans, Oz en Oisans, Vaujany et Villard-Reculas",
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
          url: 'https://www.youtube.com/embed/7SheNmPKU9E?autoplay=1&mute=1',
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
      id: 4,
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
      id: 5,
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
      id: 6,
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
      id: 7,
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
      id: 8,
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
      id: 9,
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
      id: 10,
      name: 'Bessans',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Le Carreley',
          url: 'https://m.webcam-hd.com/bessans/carreley',
        ),
        WebCam(
          name: 'Saignière',
          url: 'https://m.webcam-hd.com/bessans/relais',
        ),
        WebCam(
          name: 'La Bessannaise',
          url: 'https://m.webcam-hd.com/bessans/bessannaise',
        ),
      ],
    ),
    SkiResort(
      id: 12,
      name: 'Bonneval sur Arc',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Le Vallonnet',
          url:
              'https://broadcast.viewsurf.com/7c939fabfe29bbdb9f2762b3b3392e2e/capture/13304/playEmbed',
        ),
        WebCam(
          name: 'Andagne',
          url:
              'https://broadcast.viewsurf.com/c15529eba71115c84591e2d981d58762/capture/10720/playEmbed',
        ),
      ],
    ),
    SkiResort(
      id: 13,
      name: 'Vallée de Chamonix',
      description: 'Argentière, Chamonix, Le Tour, Les Houches, Vallorcine',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Chamonix Village',
          url: 'https://www.skaping.com/chamonix-mont-blanc',
        ),
        WebCam(
          name: 'Aiguille du midi',
          url: 'https://www.skaping.com/chamonix/aiguille-du-midi',
        ),
        WebCam(
          name: 'Flégère 1900m',
          url: 'https://www.skaping.com/chamonix-flegere-G1',
        ),
        WebCam(
          name: 'Flégère 2396m',
          url: 'https://www.skaping.com/chamonix/flegere',
        ),
        WebCam(
          name: 'Plateau de Lognan',
          url: 'https://www.skaping.com/chamonix/plateau-de-lognan',
        ),
        WebCam(
          name: 'Montenvers',
          url: 'https://www.compagniedumontblanc.fr/webcam/CMM1VUEHOTELHD.jpg',
        ),
        WebCam(
          name: 'Mer de Glace',
          url: 'https://www.compagniedumontblanc.fr/webcam/cmm1vuegrotteHD.jpg',
        ),
        WebCam(
          name: 'Grands Montets',
          url:
              'https://www.compagniedumontblanc.fr/webcam/AGM-Sommet-retour-pendant.jpg',
        ),
        WebCam(
          name: 'Grands Montets - Espace débutant',
          url:
              'https://www.compagniedumontblanc.fr/webcam/AGM1_Espace_Debutant.jpg',
        ),
        WebCam(
          name: 'Grands Montets - Bochard',
          url:
              'https://www.compagniedumontblanc.fr/webcam/AGM-VueBochardHD.jpg',
        ),
        WebCam(
          name: 'Tour - Vallorcine - Autanes',
          url: 'https://www.compagniedumontblanc.fr/webcam/autannes2HD.jpg',
        ),
        WebCam(
          name: 'Tour - Vallorcine - Gare Amont',
          url: 'https://www.compagniedumontblanc.fr/webcam/g2vallorcine.jpg',
        ),
        WebCam(
          name: 'Tour - Vallorcine - Domaine',
          url:
              'https://www.compagniedumontblanc.fr/webcam/blm1vuedomaineHD.jpg',
        ),
        WebCam(
          name: 'Tour - Vallorcine - Vue Vallée',
          url: 'https://www.compagniedumontblanc.fr/webcam/blm1vuevalleeHD.jpg',
        ),
        WebCam(
          name: 'Les Houches - Prarion 1850m',
          url: 'https://chamonix.panomax.com/houches',
        ),
        WebCam(
          name: 'Les Houches - Village 1000m',
          url: 'https://www.skaping.com/chamonix/les-houches',
        ),
      ],
    ),
    SkiResort(
      id: 14,
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
    SkiResort(
      id: 15,
      name: 'Combloux/Megève',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Sommet Combloux',
          url: 'https://www.skaping.com/combloux/sommet',
        ),
        WebCam(
          name: 'La Giettaz',
          url: 'https://www.skaping.com/la-giettaz/sommet',
        ),
        WebCam(
          name: 'Le Jaillet',
          url: 'https://www.skaping.com/jaillet/sommet',
        ),
        WebCam(
          name: 'Lac d’Arbois',
          url: 'https://m.webcam-hd.com/evasion/lac-arbois',
        ),
        WebCam(
          name: 'Fontaine',
          url: 'https://m.webcam-hd.com/evasion/fontaine',
        ),
        WebCam(
          name: 'Mont d’Arbois',
          url: 'https://m.webcam-hd.com:443/evasion/mont-arbois',
        ),
        WebCam(
          name: 'Rochebrune',
          url: 'https://m.webcam-hd.com:443/evasion/rochebrune',
        ),
        WebCam(
          name: 'La Livraz',
          url: 'https://app.webcam-hd.com/megeve/la-livraz',
        ),
        WebCam(
          name: 'Altiport',
          url: 'https://app.webcam-hd.com/megeve/altiport',
        ),
      ],
    ),
    SkiResort(
      id: 16,
      name: 'Col de Porte',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Chamechaude',
          url: 'https://www.skaping.com/grenoble/col-de-porte',
        ),
        WebCam(
          name: 'La Prairie',
          url: 'https://www.skaping.com/col-de-porte/ski-alpin',
        ),
        WebCam(
          name: 'Stade de Biathlon',
          url: 'https://www.skaping.com/col-de-porte/biathlon',
        ),
        WebCam(
          name: 'Le Sappey-en Chartreuse',
          url: 'https://www.skaping.com/sappey-en-chartreuse',
        ),
      ],
    ),
    SkiResort(
      id: 17,
      name: '7 Laux',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Secteur Débutant du Plan',
          url: 'https://www.skaping.com/les7laux/prapoutel/sommetdesbouquetins',
        ),
        WebCam(
          name: 'Sommet de l’Oursiere',
          url: 'https://www.skaping.com/les7laux/pleynet/oursiere',
        ),
        WebCam(
          name: 'Lac Crozet',
          url:
              'https://images-webcams.windy.com/43/1655994043/current/full/1655994043.jpg',
        ),
      ],
    ),
    SkiResort(
      id: 18,
      name: 'Corrençon/Villard de Lans',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Altitude 2000',
          url: 'https://live.neos360.com/villard_de_lans/webcam/Altitude-2000',
        ),
        WebCam(
          name: 'Refuge des Crêtes',
          url: 'https://live.neos360.com/villard_de_lans/webcam/Refuge.jpg',
        ),
        WebCam(
          name: 'Colline des Bains',
          url: 'https://app.webcam-hd.com/villard-de-lans/colline-des-bains',
        ),
        WebCam(
          name: 'Lac Pré des Preys',
          url:
              'https://live.neos360.com/villard_de_lans/webcam/Pre_des_preys.jpg',
        ),
        WebCam(
          name: 'Bois Barbu',
          url: 'https://app.webcam-hd.com/villard-de-lans/Bois_barbu',
        ),
        WebCam(
          name: 'Village Villard',
          url: 'https://app.webcam-hd.com/villard-de-lans/village',
        ),
        WebCam(
          name: 'Les hauts plateaux',
          url: 'https://app.webcam-hd.com/correncon-en-vercors/plateau',
        ),
        WebCam(
          name: 'Pas de tir',
          url: 'https://app.webcam-hd.com/correncon-en-vercors/stand-de-tir',
        ),
        WebCam(
          name: 'Hameau des Rambins',
          url: 'https://app.webcam-hd.com/correncon-en-vercors/rambins',
        ),
      ],
    ),
    SkiResort(
      id: 19,
      name: '3 Vallées',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Courchevel - La Saulire',
          url: 'https://www.skaping.com/courchevel/saulire',
        ),
        WebCam(
          name: 'Courchevel - Le Signal',
          url: 'https://courchevel.roundshot.com/signal/',
        ),
        WebCam(
          name: 'Courchevel - Les Chenus',
          url: 'https://www.skaping.com/courchevel/chenus',
        ),
        WebCam(
          name: 'Courchevel - Bouc Blanc',
          url: 'https://www.skaping.com/courchevel/bouc-blanc',
        ),
        WebCam(
          name: 'Courchevel - La Croisette',
          url: 'https://www.skaping.com/courchevel/la-croisette',
        ),
        WebCam(
          name: 'Col de la Loze',
          url:
              'https://app.webcam-hd.com/courchevel-meribel/courchevel-meribel_col-de-la-loze',
        ),
        WebCam(
          name: 'Méribel - Tougnète',
          url: 'https://app.webcam-hd.com/meribel/meribel_tougnete',
        ),
        WebCam(
          name: 'Méribel - Mont Vallon',
          url: 'https://www.skaping.com/meribel/mont-vallon',
        ),
        WebCam(
          name: 'Méribel - Bouquetin',
          url: 'https://app.webcam-hd.com/meribel/bouquetin',
        ),
        WebCam(
          name: 'Méribel - Versant Saulire',
          url: 'https://app.webcam-hd.com/meribel/meribel_versant-saulire',
        ),
        WebCam(
          name: 'Méribel - Mottaret Centre',
          url:
              'https://app.webcam-hd.com/meribel/meribel-mottaret_front-de-neige',
        ),
        WebCam(
          name: 'Méribel - Chaudanne',
          url: 'https://app.webcam-hd.com/meribel/meribel_chaudanne',
        ),
        WebCam(
          name: 'Les Menuires - La Masse',
          url: 'https://www.skaping.com/les-menuires/la-masse',
        ),
        WebCam(
          name: 'Les Menuires - Le Roc des 3 Marches',
          url: 'https://lesmenuires.roundshot.com/',
        ),
        WebCam(
          name: 'Les Menuires - Les Enverses',
          url: 'https://www.skaping.com/les-menuires/les-enverses',
        ),
        WebCam(
          name: 'Les Menuires - Lac du Lou',
          url: 'https://www.skaping.com/les-menuires/lac-du-lou',
        ),
        WebCam(
          name: 'Les Menuires - La Croisette',
          url: 'https://www.skaping.com/lesmenuires/croisette',
        ),
        WebCam(
          name: 'Les Menuires - Le Clocher',
          url: 'https://www.skaping.com/les-menuires/clocher',
        ),
        WebCam(
          name: 'Saint-Martin-de-Belleville',
          url: 'https://www.skaping.com/saintmartindebelleville/village',
        ),
        WebCam(
          name: 'Val Thorens - Funitel de Thorens',
          url: 'https://www.skaping.com/valthorens/funitelthorens',
        ),
        WebCam(
          name: 'Val Thorens - Funitel 3 Vallées',
          url: 'https://www.skaping.com/valthorens/3vallees',
        ),
        WebCam(
          name: 'Val Thorens - Boismint',
          url: 'https://www.skaping.com/valthorens/boismint',
        ),
        WebCam(
          name: 'Val Thorens - Lac Blanc',
          url: 'https://www.skaping.com/valthorens/stade',
        ),
        WebCam(
          name: 'Val Thorens - Station',
          url: 'https://www.skaping.com/valthorens/station',
        ),
        WebCam(
          name: 'Val Thorens - La Maison',
          url: 'https://www.skaping.com/valthorens/lamaison',
        ),
        WebCam(
          name: 'La Cime Caron',
          url: 'https://app.webcam-hd.com/val-thorens/cime-caron',
        ),
        WebCam(
          name: 'Orelle - Plan Bouchet',
          url: 'https://app.webcam-hd.com/orelle/sommet-orelle',
        ),
      ],
    ),
    SkiResort(
      id: 20,
      name: 'Flaine',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Desert Blanc',
          url: 'https://www.skaping.com/flaine/desert-blanc',
        ),
        WebCam(
          name: 'Veret',
          url: 'https://www.skaping.com/flaine/veret',
        ),
        WebCam(
          name: 'Platieres',
          url:
              'https://app.webcam-hd.com/grand-massif/grand-massif_flaine-grandes-platieres',
        ),
        WebCam(
          name: 'Aup de Veran',
          url: 'https://app.webcam-hd.com/grand-massif/aup-de-veran',
        ),
        WebCam(
          name: 'Flaine 1600',
          url:
              'https://app.webcam-hd.com/grand-massif/grand-massif_flaine-1600',
        ),
      ],
    ),
    SkiResort(
      id: 21,
      name: 'La Clusaz',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'La Bergerie',
          url: 'https://app.webcam-hd.com/la-clusaz/la-bergerie',
        ),
        WebCam(
          name: 'Col de Balme',
          url: 'https://app.webcam-hd.com/la-clusaz/col-de-balme',
        ),
        WebCam(
          name: 'Snow Park',
          url: 'https://app.webcam-hd.com/la-clusaz/snow-park',
        ),
        WebCam(
          name: "L'Etale",
          url: 'https://app.webcam-hd.com/la-clusaz/massif-etale',
        ),
        WebCam(
          name: 'Départ du Télécabine',
          url: 'https://app.webcam-hd.com/la-clusaz/balme',
        ),
        WebCam(
          name: 'Beauregard',
          url: 'https://app.webcam-hd.com/la-clusaz/beauregard',
        ),
        WebCam(
          name: 'Bossonnet',
          url: 'https://app.webcam-hd.com/la-clusaz/bossonnet',
        ),
        WebCam(
          name: 'Transval des Juments',
          url: 'https://app.webcam-hd.com/la-clusaz/etale',
        ),
        WebCam(
          name: 'Place du Village',
          url: 'https://app.webcam-hd.com/la-clusaz/place-du-village',
        ),
        WebCam(
          name: 'Espace Nordique des Confins',
          url: 'https://www.skaping.com/la-clusaz/espace-nordique',
        ),
      ],
    ),
    SkiResort(
      id: 22,
      name: 'La Norma',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Front de Neige',
          url: 'https://pv.viewsurf.com/522/La-Norma',
        ),
        WebCam(
          name: 'Secteur Repose',
          url: 'https://pv.viewsurf.com/664/La-Norma',
        ),
        WebCam(
          name: 'Le Mélezet',
          url:
              'https://broadcast.viewsurf.com/fd636352c71a4b86c626e1ffef30a84e/capture/18606/playEmbed',
        ),
        WebCam(
          name: 'Télésiège du Carrelet',
          url: 'https://www.skaping.com/la-norma/carrelet',
        ),
      ],
    ),
    SkiResort(
      id: 23,
      name: 'La Plagne',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Roche de Mio',
          url:
              'https://app.webcam-hd.com/webcam-station-la-plagne/roche-de-mio',
        ),
        WebCam(
          name: 'Live 3000',
          url: 'https://app.webcam-hd.com/webcam-station-la-plagne/live-3000',
        ),
        WebCam(
          name: 'Montchavin',
          url: 'https://app.webcam-hd.com/webcam-station-la-plagne/montchavin',
        ),
        WebCam(
          name: 'Bellecote',
          url: 'https://app.webcam-hd.com/webcam-station-la-plagne/Bellecote',
        ),
        WebCam(
          name: 'Bergerie',
          url: 'https://app.webcam-hd.com/webcam-station-la-plagne/bergerie',
        ),
        WebCam(
          name: 'Colorado',
          url: 'https://app.webcam-hd.com/webcam-station-la-plagne/colorado',
        ),
        WebCam(
          name: 'Grande Rochette',
          url:
              'https://app.webcam-hd.com/webcam-station-la-plagne/grande-rochette',
        ),
        WebCam(
          name: 'Becoin',
          url: 'https://app.webcam-hd.com/webcam-station-la-plagne/becoin',
        ),
        WebCam(
          name: 'Aime 2000',
          url: 'https://app.webcam-hd.com/webcam-station-la-plagne/Aime-2000',
        ),
        WebCam(
          name: 'Fornelet',
          url:
              'https://app.webcam-hd.com/webcam-station-la-plagne/webcam-montalbert-fornelet',
        ),
        WebCam(
          name: 'Montalbert',
          url: 'https://laplagne.roundshot.com/montalbert/#/',
        ),
        WebCam(
          name: 'Montalbert: Front de Neige',
          url: 'https://app.webcam-hd.com/webcam-station-la-plagne/montalbert',
        ),
        WebCam(
          name: 'Montchavin Télébuffette',
          url:
              'https://app.webcam-hd.com/webcam-station-la-plagne/montchavin-telebuffette',
        ),
        WebCam(
          name: 'Sommet Bijolin',
          url:
              'https://app.webcam-hd.com/webcam-station-la-plagne/montchavin-bijolin',
        ),
        WebCam(
          name: 'La Rossa',
          url:
              'https://app.webcam-hd.com/webcam-station-la-plagne/champagny-la-rossa',
        ),
        WebCam(
          name: 'Champagny Site Nordique',
          url:
              'https://app.webcam-hd.com/webcam-station-champagny/champagny-le-haut',
        ),
        WebCam(
          name: 'Champagny Village',
          url:
              'https://app.webcam-hd.com/webcam-station-champagny/webcam-champagny-village',
        ),
      ],
    ),
    SkiResort(
      id: 24,
      name: 'La Rosière',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: "Plan de l'Arc",
          url: 'https://app.webcam-hd.com/la-rosiere/plan-de-l-arc',
        ),
        WebCam(
          name: 'Golf',
          url: 'https://app.webcam-hd.com/la-rosiere/golf',
        ),
        WebCam(
          name: 'Mont Valaisan',
          url: 'https://app.webcam-hd.com/la-rosiere/mont-valaisan',
        ),
        WebCam(
          name: 'Le Fort',
          url: 'https://app.webcam-hd.com/la-rosiere/traversette',
        ),
        WebCam(
          name: 'Chalet le Montana',
          url:
              'https://app.webcam-hd.com/rosiere-montana/chalets-les-clarines-le-montana',
        ),
        WebCam(
          name: 'Front de Neige',
          url: 'https://app.webcam-hd.com/la-rosiere/maison-du-ski',
        ),
        WebCam(
          name: 'Plan du Repos',
          url: 'https://app.webcam-hd.com/la-rosiere/plan-du-repos',
        ),
        WebCam(
          name: 'Les Suches',
          url: 'https://www.lovevda.it/Media/Cache/Webcam/big_lathuile.jpg',
        ),
        WebCam(
          name: "Jardin d'enfants",
          url: 'https://www.larosiere.net/webcam/chalet-planica/',
        ),
      ],
    ),
    SkiResort(
      id: 25,
      name: 'Les 2 Alpes',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Glacier à 3400m',
          url: 'https://www.skaping.com/les2alpes/3400m',
        ),
        WebCam(
          name: 'Glacier à 3200m',
          url: 'https://www.skaping.com/les2alpes/3200m',
        ),
        WebCam(
          name: 'Toura à 2600m',
          url: 'https://www.skaping.com/les2alpes/2600m',
        ),
        WebCam(
          name: 'Bellecombe à 2700m',
          url: 'https://www.skaping.com/les2alpes/bellecombe',
        ),
        WebCam(
          name: 'Super Diable à 2900m',
          url: 'https://www.skaping.com/les2alpes/super-diable',
        ),
        WebCam(
          name: 'Les Crêtes à 2100m',
          url: 'https://www.skaping.com/les2alpes/grande-aiguille',
        ),
        WebCam(
          name: 'Vallée Blanche à 2100m',
          url: 'https://www.skaping.com/les2alpes/vallee-blanche',
        ),
      ],
    ),
    SkiResort(
      id: 26,
      name: 'Les Arcs',
      description: 'Les Arcs, Peisey, Vallandry',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Arcabulle',
          url: 'https://m.webcam-hd.com/lesarcs/arcabulle',
        ),
        WebCam(
          name: 'Arpette',
          url: 'https://app.webcam-hd.com/lesarcs/arpette',
        ),
        WebCam(
          name: 'Aiguille Rouge',
          url: 'https://m.webcam-hd.com/lesarcs/aiguille-rouge',
        ),
        WebCam(
          name: 'Mont Blanc',
          url: 'https://m.webcam-hd.com/lesarcs/mont-blanc',
        ),
        WebCam(
          name: 'Snowpark',
          url: 'https://m.webcam-hd.com/lesarcs/snowpark',
        ),
        WebCam(
          name: 'Arc 1800',
          url: 'https://m.webcam-hd.com/lesarcs/mille8',
        ),
        WebCam(
          name: 'Grizzly',
          url: 'https://m.webcam-hd.com/lesarcs/grizzly',
        ),
        WebCam(
          name: 'Vanoise Express',
          url: 'https://m.webcam-hd.com/lesarcs/vanoise-express',
        ),
        WebCam(
          name: 'Varet',
          url: 'https://app.webcam-hd.com/lesarcs/varet',
        ),
        WebCam(
          name: 'Arc 1950',
          url: 'https://app.webcam-hd.com/arc-1950-le-village/arc-1950-village',
        ),
      ],
    ),
    SkiResort(
      id: 27,
      name: 'Les Carroz',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Télécabine de la Kédeuze – 1754m',
          url: 'https://m.webcam-hd.com/lescarroz/arrivee-telecabine',
        ),
        WebCam(
          name: 'Front de neige – 1160m',
          url: 'https://app.webcam-hd.com/lescarroz/front-de-neige',
        ),
        WebCam(
          name: 'Tête des Saix – 2100m',
          url: 'https://m.webcam-hd.com/lescarroz/carroz-2100',
        ),
        WebCam(
          name: 'Les Molliets – 1500m',
          url: 'https://app.webcam-hd.com/lescarroz/les-molliets-1500',
        ),
        WebCam(
          name: 'Village – 1140m',
          url: 'https://app.webcam-hd.com/lescarroz/vue-village',
        ),
        WebCam(
          name: "Cool Zone de l'Oasis",
          url: 'https://m.webcam-hd.com/lescarroz/oasis',
        ),
      ],
    ),
    SkiResort(
      id: 28,
      name: 'Saint Gervais',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: "L'épaule - 2100m",
          url: 'https://app.webcam-hd.com/st-gervais/epaule',
        ),
        WebCam(
          name: "Le Mont d'Arbois - 1840 m",
          url: 'https://app.webcam-hd.com/st-gervais/freddy',
        ),
        WebCam(
          name: 'Le Bettex - 1400 m',
          url: 'https://app.webcam-hd.com/st-gervais/bettex',
        ),
        WebCam(
          name: 'Le Plateau de la Croix - 1450m',
          url: 'http://app.webcam-hd.com/st-gervais/plateau-de-la-croix',
        ),
        WebCam(
          name: 'Saint Nicolas de Véroce - 1200m',
          url: 'https://app.webcam-hd.com/st-gervais/st-nicolas-de-veroce',
        ),
        WebCam(
          name: 'Saint-Gervais - 850m',
          url: 'https://app.webcam-hd.com/st-gervais/maison-st-gervais',
        ),
      ],
    ),
    SkiResort(
      id: 29,
      name: 'Les Contamines Montjoie',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Signal 1800m',
          url: 'https://www.lescontamines.net/panorama/signalhd.html',
        ),
        WebCam(
          name: 'Ruelle 1650m',
          url: 'https://www.lescontamines.net/camera/ruellehd.jpg',
        ),
        WebCam(
          name: 'Téléski du Nivorin',
          url: 'https://www.lescontamines.net/camera/nivorin.jpg',
        ),
        WebCam(
          name: 'TC Gorge Parking',
          url: 'https://www.lescontamines.net/camera/gorgeparking.jpg',
        ),
        WebCam(
          name: 'Téléski des Loyers',
          url: 'https://www.lescontamines.net/camera/loyers.jpg',
        ),
        WebCam(
          name: 'Secteur Montjoie',
          url: 'https://www.lescontamines.net/camera/etape.jpg',
        ),
        WebCam(
          name: 'Vorachère',
          url: 'https://www.lescontamines.net/camera/vorachere.jpg',
        ),
        WebCam(
          name: "Lac de l'Etape",
          url: 'https://www.lescontamines.net/camera/etape-lac.jpg',
        ),
        WebCam(
          name: 'File TSD Bûche Croisée',
          url: 'https://www.lescontamines.net/camera/filebuche.jpg',
        ),
        WebCam(
          name: 'TSD Bûche Croisée',
          url: 'https://www.lescontamines.net/camera/cambuche.jpg',
        ),
        WebCam(
          name: 'Départ TSD Bûche Croisée',
          url: 'https://www.lescontamines.net/camera/departbuche.jpg',
        ),
        WebCam(
          name: 'Signal Panorama',
          url: 'https://www.lescontamines.net/camera/pano2.jpg',
        ),
        WebCam(
          name: 'Aiguille de Roselette',
          url: 'https://www.lescontamines.net/camera/aigroselette.jpg',
        ),
        WebCam(
          name: 'Aiguille Croche',
          url: 'https://www.lescontamines.net/camera/aiguillecroche.jpg',
        ),
        WebCam(
          name: 'Rebans Supérieurs',
          url: 'https://www.lescontamines.net/camera/arrtkveleray.jpg',
        ),
        WebCam(
          name: 'Bleue des Coins',
          url: 'https://www.lescontamines.net/camera/arrtsdnantrouge.jpg',
        ),
        WebCam(
          name: 'TSD Tierces',
          url: 'https://www.lescontamines.net/camera/arrtsdtierces.jpg',
        ),
        WebCam(
          name: 'TC Ruelle',
          url: 'https://www.lescontamines.net/camera/belleville.jpg',
        ),
        WebCam(
          name: 'Bleue de la Croix',
          url: 'https://www.lescontamines.net/camera/bleuedelacroix.jpg',
        ),
        WebCam(
          name: '',
          url: 'https://www.lescontamines.net/camera/boulevard.jpg',
        ),
        WebCam(
          name: 'TSF Aiguille Croche',
          url: 'https://www.lescontamines.net/camera/camaiguille.jpg',
        ),
        WebCam(
          name: 'TK Véleray',
          url: 'https://www.lescontamines.net/camera/deptkveleray.jpg',
        ),
        WebCam(
          name: 'TSD Nant Rouge',
          url: 'https://www.lescontamines.net/camera/deptsdnantrouge.jpg',
        ),
        WebCam(
          name: 'Rouge des Tierces',
          url: 'https://www.lescontamines.net/camera/deptsdtierces.jpg',
        ),
        WebCam(
          name: 'Jonction',
          url: 'https://www.lescontamines.net/camera/jonction.jpg',
        ),
        WebCam(
          name: 'Panoramique du Col du Joly',
          url: 'https://www.lescontamines.net/camera/panocol.jpg',
        ),
        WebCam(
          name: 'Décollage Parapente',
          url: 'https://www.lescontamines.net/camera/parapente.jpg',
        ),
        WebCam(
          name: 'Rouge des Plans',
          url: 'https://www.lescontamines.net/camera/rougedesplans.jpg',
        ),
        WebCam(
          name: 'Rouge du Choton',
          url: 'https://www.lescontamines.net/camera/rougeduchoton.jpg',
        ),
        WebCam(
          name: 'Rouge de Nant Rouge',
          url: 'https://www.lescontamines.net/camera/rougenantrouge.jpg',
        ),
        WebCam(
          name: 'Ruelle',
          url: 'https://www.lescontamines.net/camera/ruelle.jpg',
        ),
        WebCam(
          name: 'Télécorde des Feux',
          url: 'https://www.lescontamines.net/camera/telecorde.jpg',
        ),
        WebCam(
          name: 'Secteur des Tierces',
          url: 'https://www.lescontamines.net/camera/tierces.jpg',
        ),
        WebCam(
          name: 'TK Choton',
          url: 'https://www.lescontamines.net/camera/tkchoton.jpg',
        ),
        WebCam(
          name: 'TK des Pierres Blanches',
          url: 'https://www.lescontamines.net/camera/tkpierresblanches.jpg',
        ),
        WebCam(
          name: 'TK Roselette',
          url: 'https://www.lescontamines.net/camera/tkroselette.jpg',
        ),
        WebCam(
          name: 'TK Signal',
          url: 'https://www.lescontamines.net/camera/tksignal.jpg',
        ),
        WebCam(
          name: 'TSD Col du Joly',
          url: 'https://www.lescontamines.net/camera/tsdcol.jpg',
        ),
      ],
    ),
    SkiResort(
      id: 30,
      name: 'Les Karellis',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Front de Neige',
          url: 'https://www.youtube.com/embed/2qc7Ty6ITtk?autoplay=1&mute=1',
        ),
        WebCam(
          name: 'Vinouve',
          url: 'https://app.webcam-hd.com/les-karellis/vinouve',
        ),
      ],
    ),
    SkiResort(
      id: 31,
      name: 'Val Cenis',
      description: 'Lanslevillard, Lanslebourg, Termignon',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Téléski du Pont Noir',
          url: 'https://app.webcam-hd.com/valcenis/tk-pont-noir',
        ),
        WebCam(
          name: 'Replat des Canons',
          url: 'https://app.webcam-hd.com/valcenis/replat-des-canons',
        ),
        WebCam(
          name: 'Sommet du Solert',
          url: 'https://app.webcam-hd.com/valcenis/sommet-solert',
        ),
        WebCam(
          name: 'La Met',
          url: 'https://app.webcam-hd.com/valcenis/la-met',
        ),
      ],
    ),
    SkiResort(
      id: 32,
      name: "Collet d'Allevard",
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Les Plagnes',
          url: 'https://www.skaping.com/collet-d-allevard/sommet',
        ),
        WebCam(
          name: 'Super Collet',
          url: 'https://webcams.lecollet.com/imageSC.jpg',
        ),
        WebCam(
          name: "Chamois D'or",
          url: 'https://webcams.lecollet.com/image.jpg',
        ),
        WebCam(
          name: 'Claran',
          url: 'https://webcams.lecollet.com/imageCLARAN.jpg',
        ),
      ],
    ),
    SkiResort(
      id: 33,
      name: 'Les Sybelles',
      description:
          'La Toussuire, Le Corbier, Saint-Sorlin-d’Arves, Saint-Jean-d’Arves, Les Bottières et Saint-Colomban des Villard',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'La Toussuire - Front de Neige',
          url: 'https://www.skaping.com/la-toussuire/front-de-neige',
        ),
        WebCam(
          name: 'Les Lutins',
          url: 'https://www.skaping.com/latoussuire/les-lutins',
        ),
        WebCam(
          name: 'Chaput',
          url: 'https://www.skaping.com/latoussuire/chaput',
        ),
        WebCam(
          name: 'Pierre du Turc',
          url: 'https://www.skaping.com/latoussuire/pierre-du-turc',
        ),
        WebCam(
          name: 'Ouillon',
          url: 'https://www.skaping.com/les-sybelles/ouillon',
        ),
        WebCam(
          name: 'Pointe du Corbier',
          url: 'https://app.webcam-hd.com/le-corbier/pointe',
        ),
        WebCam(
          name: 'Le Corbier - Front de Neige',
          url: 'https://www.skaping.com/le-corbier/front-de-neige',
        ),
        WebCam(
          name: 'Saint Colomban des Villards',
          url: 'https://cms2.lumiplan.pro/lumiplan/api/webcam/156/NORMAL',
        ),
        WebCam(
          name: "Saint-Jean-d'Arves - Vue station",
          url: 'https://pv.viewsurf.com/1316/Saint-Jean-d-Arves',
        ),
        WebCam(
          name: 'Chalets de la Balme',
          url: 'https://pv.viewsurf.com/?id=58',
        ),
        WebCam(
          name: 'Les 3 Lacs',
          url:
              'https://www.skaping.com/les-sybelles/saint-sorlin-d-arves/le-rouet',
        ),
      ],
    ),
    SkiResort(
      id: 34,
      name: 'Le Grand Bornand',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Village 1000m',
          url: 'https://www.skaping.com/le-grand-bornand/village',
        ),
        WebCam(
          name: 'Le Maroly 1750m',
          url: 'https://www.skaping.com/le-grand-bornand/terresrouges',
        ),
        WebCam(
          name: 'Mont Lachat 2100m',
          url: 'https://www.skaping.com/le-grand-bornand/mont-lachat',
        ),
        WebCam(
          name: 'Chinaillon 1300m',
          url: 'https://www.skaping.com/le-grand-bornand/chinaillon',
        ),
        WebCam(
          name: 'La Taverne 1550m',
          url: 'https://www.skaping.com/le-grand-bornand/taverne',
        ),
        WebCam(
          name: 'SnowPark du Maroly 1650m',
          url: 'https://app.webcam-hd.com/grand-bornand/maroly',
        ),
        WebCam(
          name: 'Lormay 1200m',
          url: 'https://www.skaping.com/le-grand-bornand/auberge-nordique',
        ),
      ],
    ),

    SkiResort(
      id: 36,
      name: 'Sainte Foy la Tarentaise',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: ' Sommet Aiguille (2620m)',
          url: 'https://app.webcam-hd.com/ste-foy-tarentaise/sommet-aiguille',
        ),
        WebCam(
          name: 'TSD de La Marquise (2425m)',
          url: 'https://app.webcam-hd.com/ste-foy-tarentaise/ts-de-la-marquise',
        ),
        WebCam(
          name: 'Piste de Plan Bois (1770m)',
          url: 'https://app.webcam-hd.com/ste-foy-tarentaise/plan-bois',
        ),
        WebCam(
          name: 'Front de Neige (1550m)',
          url: 'https://app.webcam-hd.com/ste-foy-tarentaise/front-de-neige',
        ),
      ],
    ),
    SkiResort(
      id: 37,
      name: 'Plateau des Pettites Roches',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Dent de Crolles depuis St Hilaire',
          url:
              'https://www.sthilair-parapente.com/foscamDentCrolles/FoscamCamera_00626ED84FB0/webcam/image1.jpg',
        ),
        WebCam(
          name: 'Col Marcieu',
          url: 'https://webcams.les7laux.com/col-de-marcieu/webcam1.jpg',
        ),
      ],
    ),
    SkiResort(
      id: 38,
      name: 'Saint Francois de Longchamp/Valmorel',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Frêne',
          url: 'https://www.skaping.com/saint-francois-longchamp/le-frene',
        ),
        WebCam(
          name: 'Station',
          url:
              'https://app.webcam-hd.com/st_francois_longchamp/st_francois_village',
        ),
        WebCam(
          name: 'Biollene',
          url: 'https://app.webcam-hd.com/valmorel/biollene',
        ),
        WebCam(
          name: 'Lanchettes',
          url: 'https://app.webcam-hd.com/valmorel/lanchettes',
        ),
        WebCam(
          name: 'Valmorel Village',
          url: 'https://app.webcam-hd.com/valmorel/village',
        ),
        WebCam(
          name: 'Combelouviere',
          url: 'https://app.webcam-hd.com/valmorel/sommet-combelouviere',
        ),
        WebCam(
          name: 'Doucy',
          url: 'https://app.webcam-hd.com/valmorel/doucy-combelouviere',
        ),
        WebCam(
          name: 'Col du Mottet',
          url: 'https://www.skaping.com/valmorel/col-du-mottet',
        ),
      ],
    ),
    SkiResort(
      id: 39,
      name: 'Les saisies',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Hauteluce Chozal',
          url: 'https://app.webcam-hd.com/les-saisies/hauteluce-chozal',
        ),
        WebCam(
          name: 'Espace Erwin Eckl (1650m)',
          url: 'https://app.webcam-hd.com/les-saisies/espace-erwineckl',
        ),
        WebCam(
          name: 'Mont Bisanne (1940m)',
          url: 'https://app.webcam-hd.com/les-saisies/bisanne-panoramique-2000',
        ),
        WebCam(
          name: 'Les Chardons (1650m)',
          url: 'https://app.webcam-hd.com/les-saisies/boetet',
        ),
        WebCam(
          name: 'Bellasta (2050m)',
          url: 'https://app.webcam-hd.com/les-saisies/bellasta',
        ),
        WebCam(
          name: 'Espace ski de fond',
          url: 'https://app.webcam-hd.com/les-saisies/nordique',
        ),
        WebCam(
          name: 'Centre Station (1650m)',
          url: 'https://app.webcam-hd.com/les-saisies/centre-station',
        ),
        WebCam(
          name: 'Hauteluce ORTF (1150m)',
          url: 'https://app.webcam-hd.com/les-saisies/hauteluce-mtblanc',
        ),
        WebCam(
          name: 'Bisanne 1500',
          url: 'https://app.webcam-hd.com/les-saisies/bisanne-1500',
        ),
      ],
    ),
    SkiResort(
      id: 40,
      name: 'Praz de Lys Sommand',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Parking',
          url: 'https://app.webcam-hd.com/praz_lys_sommand/parking',
        ),
        WebCam(
          name: 'Roy',
          url: 'https://app.webcam-hd.com/praz_lys_sommand/roy',
        ),
        WebCam(
          name: 'Chevaly',
          url: 'https://app.webcam-hd.com/praz_lys_sommand/chevaly',
        ),
        WebCam(
          name: 'Haut Fleury',
          url: 'https://app.webcam-hd.com/praz_lys_sommand/haut_fleury',
        ),
      ],
    ),
    SkiResort(
      id: 41,
      name: "Val d'arly",
      description: 'Praz sur Arly, Notre Dame de Bellecombe',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Praz Front de Neige',
          url: 'https://m.webcam-hd.com/val-d-arly/depart-des-pistes',
        ),
        WebCam(
          name: 'Cret du Midi',
          url: 'https://m.webcam-hd.com/val-d-arly/cret-du-midi',
        ),
        WebCam(
          name: 'Ban Rouge – 1983m',
          url: 'https://m.webcam-hd.com/val-d-arly/ban-rouge',
        ),
        WebCam(
          name: 'Le Mont Rond – 1350m',
          url: 'https://m.webcam-hd.com/val-d-arly-ot/ndb-mont-rond',
        ),
        WebCam(
          name: 'NDB Le Centre village – 1150m',
          url: 'https://m.webcam-hd.com/val-d-arly-ot/village',
        ),
      ],
    ),
    SkiResort(
      id: 42,
      name: 'Morillon/Sixt-Fer-à-Cheval/Samoëns',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Morillon 1100m',
          url:
              'https://app.webcam-hd.com/grand-massif/grand-massif_morillon-1100',
        ),
        WebCam(
          name: 'Morillon – Biollaires',
          url:
              'https://app.webcam-hd.com/grand-massif/grand-massif_morillon-biollaires',
        ),
        WebCam(
          name: 'Morillon – Sairon',
          url: 'https://app.webcam-hd.com/grand-massif/sairon',
        ),
        WebCam(
          name: 'Sixt – Feulatière',
          url: 'https://app.webcam-hd.com/grand-massif/feulatiere',
        ),
        WebCam(
          name: 'Cirque du Fer à Cheval',
          url: 'https://m.webcam-hd.com/vallee-haut-giffre/sixt-fer-a-cheval',
        ),
        WebCam(
          name: 'Col de Joux Plane',
          url: 'https://www.skaping.com/samoens/col-de-joux-plane',
        ),
        WebCam(
          name: 'Morillon – Lac Bleu',
          url: 'https://app.webcam-hd.com/vallee-haut-giffre/morillon-lac-bleu',
        ),
        WebCam(
          name: 'Tête des Saix',
          url:
              'https://app.webcam-hd.com/grand-massif/grand-massif_samoens-tete-des-saix',
        ),
      ],
    ),
    SkiResort(
      id: 43,
      name: 'Thollon-les-Mémises',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Front de Neige',
          url: 'https://app.webcam-hd.com/thollon-les-memises/front-de-neige',
        ),
        WebCam(
          name: 'Sommet Parchet',
          url: 'https://app.webcam-hd.com/thollon-les-memises/sommet-parchet',
        ),
      ],
    ),
    SkiResort(
      id: 44,
      name: 'Tignes',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: '1800',
          url: 'https://tignes.roundshot.com/1800/#/',
        ),
        WebCam(
          name: 'Chaudannes',
          url: 'https://tignes.roundshot.com/chaudannes/#/',
        ),
        WebCam(
          name: 'Bord du Lac',
          url: 'https://tignes.roundshot.com/lac/#/',
        ),
        WebCam(
          name: 'Brévières',
          url: 'https://tignes.roundshot.com/brevieres/#/',
        ),
        WebCam(
          name: '',
          url: 'https://tignes.roundshot.com/snowpark/#/',
        ),
        WebCam(
          name: 'Val Claret',
          url: 'https://tignes.roundshot.com/val-claret/#/',
        ),
        WebCam(
          name: 'Tovière',
          url: 'https://tignes.roundshot.com/toviere/#/',
        ),
        WebCam(
          name: '',
          url: 'https://tignes.roundshot.com/grande-motte/#/',
        ),
      ],
    ),
    SkiResort(
      id: 45,
      name: "Val d'Isère",
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Village',
          url: 'https://valdisere.roundshot.com/village/#/',
        ),
        WebCam(
          name: 'Front de Neige',
          url: 'https://valdisere.roundshot.com/#/',
        ),
        WebCam(
          name: 'Crete des Lessieres',
          url: 'https://valdisere.roundshot.com/crete-des-lessieres/#/',
        ),
        WebCam(
          name: 'Glacier du Pisaillas',
          url: 'https://valdisere.roundshot.com/glacier-du-pisaillas/#/',
        ),
        WebCam(
          name: 'Snowpark',
          url: 'https://valdisere.roundshot.com/snowpark/#/',
        ),
        WebCam(
          name: 'Bellevarde',
          url: 'https://valdisere.roundshot.com/bellevarde/#/',
        ),
      ],
    ),
    SkiResort(
      id: 46,
      name: 'Valfréjus',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'TC Arrondaz',
          url: 'https://www.skaping.com/valfrejus/tc-arrondaz',
        ),
        WebCam(
          name: 'Plateau Arrondaz',
          url: 'https://www.skaping.com/valfrejus/arrondaz',
        ),
        WebCam(
          name: 'Punta Bagna',
          url: 'https://www.skaping.com/valfrejus/puntabagna',
        ),
      ],
    ),
    SkiResort(
      id: 47,
      name: 'Valloire/Val Menier',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Poingt Ravier',
          url: 'https://www.skaping.com/valloire/poingt_ravier',
        ),
        WebCam(
          name: 'Galibier',
          url: 'https://www.skaping.com/valloire/galibier',
        ),
        WebCam(
          name: 'Crey du Quart',
          url: 'https://www.skaping.com/valloire/crey-du-quart',
        ),
        WebCam(
          name: 'Sandoniere',
          url: 'https://www.skaping.com/Valmeinier/sandoniere',
        ),
        WebCam(
          name: 'Setaz',
          url: 'https://valloire.roundshot.com/setaz/',
        ),
        WebCam(
          name: 'Moneul Crey du Quart',
          url: 'https://valmeinier.roundshot.com/moneul-creyduquart/',
        ),
        WebCam(
          name: 'Les Jeux',
          url: 'https://valmeinier.roundshot.com/lesjeux/',
        ),
      ],
    ),
    SkiResort(
      id: 95,
      name: 'Gresse en Vercors',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'La Station',
          url: 'https://app.webcam-hd.com/gresse-en-vercors/grand-veymont',
        ),
      ],
    ),
    SkiResort(
      id: 96,
      name: 'Herbouilly',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Station',
          url: 'https://app.webcam-hd.com/la-drome/la-drome_herbouilly',
        ),
        WebCam(
          name: 'Parking',
          url: 'https://geo.ladrome.fr/cameras/herbouilly/herbouilly.jpg',
        ),
      ],
    ),
    SkiResort(
      id: 97,
      name: "Font d'Urle",
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Parking',
          url: 'https://app.webcam-hd.com/la-drome/font-d-urle',
        ),
        WebCam(
          name: 'Front de Neige',
          url: 'https://app.webcam-hd.com/la-drome/font-d-urle-front-de-neige',
        ),
        WebCam(
          name: 'Domaine Nordique',
          url: 'https://app.webcam-hd.com/la-drome/ski-de-fond',
        ),
      ],
    ),
    SkiResort(
      id: 98,
      name: 'Col de Rousset',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Haut du Télésiège',
          url: 'https://app.webcam-hd.com/la-drome/col-du-rousset',
        ),
        WebCam(
          name: 'Front de Neige',
          url: 'https://app.webcam-hd.com/la-drome/front-de-neige-rousset',
        ),
      ],
    ),
    SkiResort(
      id: 99,
      name: 'Rencurel/Les Coulmes',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Le Belvédère',
          url:
              'https://coulmes-vercors.com/wp-content/uploads/webcam-belvedere/webcam-belvedere.jpg',
        ),
        WebCam(
          name: 'Foyer de ski',
          url:
              'https://coulmes-vercors.com/wp-content/uploads/webcam-foyer/webcam-foyer.jpg',
        ),
      ],
    ),
    SkiResort(
      id: 100,
      name: 'Grand Echaillon',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Station',
          url: 'https://app.webcam-hd.com/la-drome/grand-echaillon',
        ),
      ],
    ),
  ];

  static const webcamsSud = [
// Alpes du sud
    SkiResort(
      id: 48,
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
      id: 49,
      name: 'Orcières',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Front de Neige',
          url: 'https://m.webcam-hd.com/orcieres-1850/front-de-neige',
        ),
        WebCam(
          name: 'Le Drouvet',
          url: 'https://m.webcam-hd.com/orcieres-1850/le-drouvet',
        ),
        WebCam(
          name: 'Estaris',
          url: 'https://m.webcam-hd.com/orcieres-1850/sommet-estaris',
        ),
        WebCam(
          name: 'Rocherousse',
          url: 'https://www.skaping.com/orcieres/plateau-de-rocherousse',
        ),
        WebCam(
          name: 'La Favue',
          url: 'https://www.skaping.com/orcieres/la-favue/panorama',
        ),
        WebCam(
          name: 'Base de Loisirs',
          url: 'https://app.webcam-hd.com/Orcieres/base-de-loisirs',
        ),
      ],
    ),
    SkiResort(
      id: 50,
      name: 'Saint Léger les Mélèzes',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Les Mélèzes',
          url: 'https://app.webcam-hd.com/st-leger/les-melezes',
        ),
        WebCam(
          name: 'Front de Neige',
          url: 'https://app.webcam-hd.com/st-leger/front-de-neige',
        ),
      ],
    ),
    SkiResort(
      id: 51,
      name: 'Gap Bayard',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Départ des pistes',
          url:
              'https://broadcast.viewsurf.com/7afdba9cdba9a355aa95f0d16e4ea1a6/capture/18884/playEmbed',
        ),
        WebCam(
          name: 'Gap Bayard',
          url:
              'https://broadcast.viewsurf.com/7afdba9cdba9a355aa95f0d16e4ea1a6/capture/18882/playEmbed',
        ),
        WebCam(
          name: 'Arrivée de la piste Golf',
          url:
              'https://broadcast.viewsurf.com/7afdba9cdba9a355aa95f0d16e4ea1a6/capture/18886/playEmbed',
        ),
        WebCam(
          name: 'Stade de neige',
          url:
              'https://broadcast.viewsurf.com/7afdba9cdba9a355aa95f0d16e4ea1a6/capture/18888/playEmbed',
        ),
      ],
    ),
    SkiResort(
      id: 52,
      name: 'Laye',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Front de Neige',
          url: 'https://app.webcam-hd.com/laye/front-de-neige',
        ),
      ],
    ),
    SkiResort(
      id: 53,
      name: 'Valgaudemar',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Prairie de Jamivoï et fond de vallée',
          url:
              'https://broadcast.viewsurf.com/7afdba9cdba9a355aa95f0d16e4ea1a6/capture/18880/playEmbed',
        ),
        WebCam(
          name: 'La Chapelle en Valgaudemar',
          url:
              'https://broadcast.viewsurf.com/7afdba9cdba9a355aa95f0d16e4ea1a6/capture/18876/playEmbed',
        ),
        WebCam(
          name: 'Panoramique',
          url:
              'https://broadcast.viewsurf.com/7afdba9cdba9a355aa95f0d16e4ea1a6/capture/18878/playEmbed',
        ),
      ],
    ),
    SkiResort(
      id: 54,
      name: 'Dévoluy',
      description: 'Superdévoluy et La Joue du Loup',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Télésiège du Génépy',
          url: 'https://app.webcam-hd.com/superdevoluy/sommet-domaine-skiable',
        ),
        WebCam(
          name: 'Télémix des Fontettes',
          url: 'https://app.webcam-hd.com/superdevoluy/fontettes',
        ),
        WebCam(
          name: 'Front de Neige de Superdévoluy',
          url: 'https://app.webcam-hd.com/superdevoluy/village',
        ),
        WebCam(
          name: 'Front de Neige de La Joue du Loup',
          url: 'https://app.webcam-hd.com/superdevoluy/la-joue-du-loup',
        ),
        WebCam(
          name: 'Col du Festre',
          url: 'https://pv.viewsurf.com/?id=252&i=NjkwMjp1bmRlZmluZWQ',
        ),
        WebCam(
          name: 'Base de Loisirs de Superdévoluy',
          url: 'https://pv.viewsurf.com/?id=404&i=NjkwNDp1bmRlZmluZWQ',
        ),
      ],
    ),
    SkiResort(
      id: 55,
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
      id: 56,
      name: 'Chaillol',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Clot Chenu',
          url: 'https://app.webcam-hd.com/chaillol/sommet-clot-chenu',
        ),
        WebCam(
          name: 'Piste Clot Chenu',
          url: 'https://app.webcam-hd.com/chaillol/piste-clot-chenu',
        ),
      ],
    ),
    SkiResort(
      id: 57,
      name: 'Puy Saint Vincent',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: '1600m',
          url:
              'https://www.youtube.com/embed/ysSRemi4LsE?si=Xmw8dpyqxzulzLEC?autoplay=1&mute=1',
        ),
        WebCam(
          name: '2000m',
          url:
              'https://www.youtube.com/embed/25W1dH4gXAw?si=h0ICgf0o-rwo6Uhx?autoplay=1&mute=1',
        ),
        WebCam(
          name: 'Sommet de la Station',
          url: 'https://www.youtube.com/embed/fn9tjsNtfKc?si=EeRK1dC5RpkbiHDu',
        ),
        WebCam(
          name: 'Crête des Bans',
          url: 'https://www.vision-environnement.com/live/player/psv2700.php',
        ),
      ],
    ),
    SkiResort(
      id: 58,
      name: 'Réallon',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Front de Neige',
          url: 'https://m.webcam-hd.com/reallon/reallon-front-de-neige',
        ),
        WebCam(
          name: 'Chabrières',
          url: 'https://m.webcam-hd.com/reallon/reallon_chabrieres',
        ),
      ],
    ),
    SkiResort(
      id: 59,
      name: 'Chabanon',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Chabanon',
          url: 'https://app.webcam-hd.com/chabanon/chabanon',
        ),
        WebCam(
          name: 'Sommet des Monges',
          url: 'https://app.webcam-hd.com/chabanon/sommet-des-monges',
        ),
      ],
    ),
    SkiResort(
      id: 60,
      name: 'La Grave',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Col des Ruillans',
          url: 'https://www.skaping.com/lagrave/3200m',
        ),
        WebCam(
          name: "Gare de Peyrou d'Amont",
          url: 'https://www.skaping.com/lagrave/2400m',
        ),
        WebCam(
          name: 'Hôtel Castillan',
          url: 'https://www.skaping.com/la-grave/hotel-castillan',
        ),
        WebCam(
          name: "Domaine nordique de Villar d'Arène",
          url: 'https://www.skaping.com/villar-d-arene/arsine',
        ),
      ],
    ),
    SkiResort(
      id: 61,
      name: 'Les Orres',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Au sommet de Pousterle (2530m)',
          url: 'https://www.skaping.com/les-orres/pousterle',
        ),
        WebCam(
          name: 'Au sommet des Crêtes (2658m)',
          url: 'https://pv.viewsurf.com/666/Les-Orres',
        ),
        WebCam(
          name: 'Front de Neige',
          url: 'https://pv.viewsurf.com/1300/Les-Orres',
        ),
      ],
    ),
    SkiResort(
      id: 62,
      name: 'Montgenèvre',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Eglise',
          url: 'https://app.webcam-hd.com/montgenevre/eglise',
        ),
        WebCam(
          name: 'Front de neige – 1860m',
          url: 'https://app.webcam-hd.com/montgenevre/front-de-neige',
        ),
        WebCam(
          name: 'Luge Monty Express – 1860m',
          url: 'https://app.webcam-hd.com/montgenevre/mur-d-escalade',
        ),
        WebCam(
          name: 'Sommet des Gondrans – 2460m',
          url: 'https://app.webcam-hd.com/montgenevre/sommet-des-gondrans',
        ),
        WebCam(
          name: 'Sommet du Rocher de l’aigle – 2595m',
          url: 'https://app.webcam-hd.com/montgenevre/ts-aigle',
        ),
        WebCam(
          name: 'Sommet de Serre Thibaud – 2550m',
          url: 'https://app.webcam-hd.com/montgenevre/serre-thibaud',
        ),
        WebCam(
          name: 'Sommet TS Chalvet – 2580m',
          url: 'https://app.webcam-hd.com/montgenevre/sommet-chalvet',
        ),
        WebCam(
          name: 'Sommet TS brousset – 2190m',
          url: 'https://app.webcam-hd.com/montgenevre/ts-brousset',
        ),
        WebCam(
          name: 'Sommet TS Crête – 2465m',
          url: 'https://app.webcam-hd.com/montgenevre/sommet-ts-crete',
        ),
      ],
    ),
    SkiResort(
      id: 63,
      name: 'Briançon/Serre Chevalier/Monetier',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Cucumelle',
          url: 'https://www.skaping.com/serre-chevalier/cucumelle',
        ),
        WebCam(
          name: 'Cole du Lautaret',
          url: 'https://www.skaping.com/serrechevalier/coldulautaret',
        ),
        WebCam(
          name: 'Monetier (2176m)',
          url: 'https://www.skaping.com/serrechevalier/monetier',
        ),
        WebCam(
          name: 'Col du Prorel',
          url: 'https://app.webcam-hd.com/serrechevalier/col-du-prorel',
        ),
        WebCam(
          name: 'Col du Galibier',
          url: 'https://www.skaping.com/valloire/galibier',
        ),
        WebCam(
          name: 'Chalet Cosy',
          url:
              'https://platforms5.joada.net/embeded/embeded.html?uuid=5476aa5e-c59a-448a-3236-3630-6d61-63-b894-6ddd1c4cbac4d&type=live&liveicon=1&vsheader=1&tz=Europe/Paris',
        ),
      ],
    ),
    SkiResort(
      id: 64,
      name: 'Sauze',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Le Brec',
          url: 'https://pv.viewsurf.com/1932/Le-Brec',
        ),
        WebCam(
          name: 'Sauze 1700 - Piste',
          url: 'https://pv.viewsurf.com/1936/Le-Sauze-1700',
        ),
        WebCam(
          name: 'Sauze 1700 - Station',
          url: 'https://pv.viewsurf.com/1936/Le-Sauze-1700',
        ),
        WebCam(
          name: 'La Savonnette',
          url: 'https://pv.viewsurf.com/1928/La-Savonnette',
        ),
        WebCam(
          name: 'Vue depuis Barcelonnette',
          url: 'https://pv.viewsurf.com/1602/Barcelonnette',
        ),
      ],
    ),
    SkiResort(
      id: 65,
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
      id: 66,
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
    SkiResort(
      id: 67,
      name: 'Queyras',
      description: 'Abriès, Arvieux, Ceillac, Ristolas, Moulines, Saint-Véran',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: "L'Echalp",
          url:
              'https://pv.viewsurf.com/390/Abries-Ristolas-L-Echalp?i=MjUzNDp1bmRlZmluZWQ',
        ),
        WebCam(
          name: 'Roche Ecroulé',
          url:
              'https://pv.viewsurf.com/390/Abries-Ristolas-L-Echalp?i=MjQ2NDp1bmRlZmluZWQ',
        ),
        WebCam(
          name: 'Arvieux - Espace-Nordique',
          url:
              'https://pv.viewsurf.com/1010/Espace-Nordique-du-Queyras-Arvieux?i=NDc1NDp1bmRlZmluZWQ',
        ),
        WebCam(
          name: 'Ceillac - Espace-Nordique',
          url:
              'https://pv.viewsurf.com/1232/Espace-Nordique-du-Queyras-Ceillac?i=NTI3NDp1bmRlZmluZWQ',
        ),
        WebCam(
          name: 'Molines - Espace-Nordique',
          url:
              'https://pv.viewsurf.com/1140/Espace-Nordique-du-Queyras-Molines-Saint-Veran?i=NTAyNjp1bmRlZmluZWQ',
        ),
        WebCam(
          name: 'Abries',
          url: 'https://live.neos360.com/queyras/fixes/abries.jpg',
        ),
        WebCam(
          name: 'Arvieux',
          url: 'https://live.neos360.com/queyras/fixes/arvieux.jpg',
        ),
        WebCam(
          name: 'Ceillac',
          url: 'https://live.neos360.com/queyras/fixes/ceillac.jpg',
        ),
        WebCam(
          name: 'Molines',
          url: 'https://live.neos360.com/queyras/fixes/molines.jpg',
        ),
        WebCam(
          name: 'Aiguilles',
          url: 'https://live.neos360.com/queyras/fixes/aiguilles.jpg',
        ),
        WebCam(
          name: 'Saint Veran',
          url: 'https://live.neos360.com/queyras/fixes/veran.jpg',
        ),
      ],
    ),
    SkiResort(
      id: 68,
      name: 'Le Grand Puy',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Les Planes',
          url: 'http://app.webcam-hd.com/grand-puy/planes',
        ),
        WebCam(
          name: 'Front de Neige',
          url: 'http://app.webcam-hd.com/grand-puy/front-de-neige',
        ),
        WebCam(
          name: 'Espace Débutant',
          url: 'http://app.webcam-hd.com/grand-puy/espace-debutant',
        ),
      ],
    ),
    SkiResort(
      id: 69,
      name: 'Allos',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'La Foux - Marin Pascal',
          url: 'https://app.webcam-hd.com/valdallos/sommet-marin-pascal',
        ),
        WebCam(
          name: "La Foux quartier de l'Ubac",
          url: 'https://app.webcam-hd.com/valdallos/front-de-neige',
        ),
        WebCam(
          name: 'La Foux - Observatoire',
          url: 'https://app.webcam-hd.com/valdallos/observatoire',
        ),
        WebCam(
          name: 'Le Seignus - Front de Neige',
          url: 'https://app.webcam-hd.com/valdallos/seignus-bas',
        ),
        WebCam(
          name: 'Le Seignus - Clos Bertrand',
          url: 'https://app.webcam-hd.com/valdallos/seignus-haut',
        ),
        WebCam(
          name: 'Le Village',
          url: 'https://app.webcam-hd.com/valdallos/village',
        ),
        WebCam(
          name: 'Le Village & Le Seignus',
          url: 'https://app.webcam-hd.com/valdallos/champons',
        ),
      ],
    ),
    SkiResort(
      id: 70,
      name: 'Pra Loup',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Station',
          url: 'https://www.skaping.com/pra-loup/station',
        ),
        WebCam(
          name: 'Clos du Serre',
          url: 'https://www.skaping.com/pra-loup/molanes',
        ),
        WebCam(
          name: 'Peguieou',
          url: 'https://www.skaping.com/pra-loup/peguieou',
        ),
        WebCam(
          name: 'Costebelle',
          url: 'https://app.webcam-hd.com/pra-loup/costebelle',
        ),
      ],
    ),
    SkiResort(
      id: 71,
      name: 'Vars/Risoul',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Speed Master',
          url: 'https://www.skaping.com/vars/speed-master',
        ),
        WebCam(
          name: 'La Mayt',
          url: 'https://www.skaping.com/vars/mayt',
        ),
        WebCam(
          name: 'Col de Crévoux',
          url: 'https://www.skaping.com/vars/col-de-crevoux',
        ),
        WebCam(
          name: 'Télémix de Chabrières',
          url: 'https://www.skaping.com/vars/chabrieres',
        ),
        WebCam(
          name: 'Luge du Caribou',
          url: 'https://app.webcam-hd.com/vars/luge-du-caribou',
        ),
        WebCam(
          name: 'Sainte-Marie',
          url: 'https://app.webcam-hd.com/vars/sainte-marie',
        ),
        WebCam(
          name: 'Front de neige des Claux',
          url: 'https://www.youtube.com/embed/_iDeHxqe86U?autoplay=1&mute=1',
        ),
        WebCam(
          name: 'Pointe du Razis',
          url: 'https://www.skaping.com/risoul/pointe-du-razis',
        ),
        WebCam(
          name: 'Pré du Bois',
          url: 'https://m.webcam-hd.com/risoul/pre-du-bois',
        ),
        WebCam(
          name: 'Front de Neige',
          url: 'https://m.webcam-hd.com/risoul/risoul_front',
        ),
        WebCam(
          name: 'Homme de Pierre',
          url: 'https://m.webcam-hd.com/risoul/homme-de-pierre',
        ),
      ],
    ),
    SkiResort(
      id: 11,
      name: 'Valberg',
      mountain: Mountain.alpesSud,
      webcams: [
        WebCam(
          name: 'Panoramique Centre Station',
          url: 'https://app.webcam-hd.com/valberg/leysin',
        ),
        WebCam(
          name: 'Village',
          url: 'https://m.webcam-hd.com/valberg/valberg_village',
        ),
        WebCam(
          name: 'Ancolies',
          url: 'https://app.webcam-hd.com/valberg/ancolie',
        ),
        WebCam(
          name: 'Sommet des Eguilles',
          url: 'https://m.webcam-hd.com/valberg/sommet-tete-des-eguilles',
        ),
        WebCam(
          name: 'Domaine nordique de Beuil-Les Launes',
          url: 'https://app.webcam-hd.com/valberg/nordique_des_launes',
        ),
      ],
    ),
  ];

  static const webcamsPyrenees = [
// Pyrenees
    SkiResort(
      id: 72,
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
      id: 73,
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
      id: 74,
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
    SkiResort(
      id: 75,
      name: 'Cauterets',
      mountain: Mountain.pyrenees,
      webcams: [
        WebCam(
          name: 'Terrasse du Lys 1800m',
          url: 'https://www.skaping.com/cauterets/cirque-du-lys/panorama',
        ),
        WebCam(
          name: 'Crêtes 2400m',
          url:
              'https://pv.viewsurf.com/1434/Cauterets-Le-Lys?i=NTc5ODp1bmRlZmluZWQ',
        ),
        WebCam(
          name: "Pont d'Espagne",
          url:
              'https://pv.viewsurf.com/354/Cauterets-Pont-d-Espagne?i=NzIwODp1bmRlZmluZWQ',
        ),
      ],
    ),
    SkiResort(
      id: 76,
      name: 'Gourette',
      mountain: Mountain.pyrenees,
      webcams: [
        WebCam(
          name: 'Plateau de Bézou',
          url:
              'https://visionenvironnement.quanteec.com/embeded/embeded.html?uuid=8b6a2241-9319-4b4f-746c-7561-6665-64-8763-4f05ee30599bd&type=live&analyticsID=visionenvironnement',
        ),
        WebCam(
          name: 'Col de l’Aubisque',
          url:
              'https://visionenvironnement.quanteec.com/embeded/embeded.html?uuid=8b6a2241-9319-4b4f-746c-7561-6665-64-8763-4f05ee30599bd&type=live&analyticsID=visionenvironnement',
        ),
        WebCam(
          name: 'Secteur Cotch',
          url:
              'https://visionenvironnement.quanteec.com/embeded/embeded.html?uuid=5e634399-feb1-42bf-746c-7561-6665-64-941c-1579904f37ffd&type=live&analyticsID=visionenvironnement',
        ),
        WebCam(
          name: 'Secteur Pène Blanque',
          url:
              'https://visionenvironnement.quanteec.com/embeded/embeded.html?uuid=54c71fab-a095-4557-746c-7561-6665-64-af95-d3f480434881d&type=live&analyticsID=visionenvironnement',
        ),
      ],
    ),
    SkiResort(
      id: 77,
      name: 'Andorre',
      description: 'Canillo, Pal Arinsal, Arcalis, Pas de la Casa, Grandvalira',
      mountain: Mountain.pyrenees,
      webcams: [
        WebCam(
          name: 'Arinsal - La Tossa',
          url:
              'http://webtv.feratel.com/webtv/?cam=15035&design=v3&c0=0&c2=1&lg=fr&pg=40354CFF-57D1-4271-9EE2-08A745983EDD&s=0',
        ),
        WebCam(
          name: 'Arinsal - Port Negre',
          url:
              'http://webtv.feratel.com/webtv/?cam=15035&design=v3&c0=0&c2=1&lg=fr&pg=40354CFF-57D1-4271-9EE2-08A745983EDD&s=0',
        ),
        WebCam(
          name: 'Arinsal - Igloo',
          url:
              'http://webtv.feratel.com/webtv/?cam=15037&design=v3&c0=0&c2=1&lg=fr&pg=40354CFF-57D1-4271-9EE2-08A745983EDD&s=0',
        ),
        WebCam(
          name: 'Pal - La Caubella',
          url:
              'http://webtv.feratel.com/webtv/?cam=15040&design=v3&c0=0&c2=1&lg=fr&pg=40354CFF-57D1-4271-9EE2-08A745983EDD&s=0',
        ),
        WebCam(
          name: 'Pal - Pla de la Cot',
          url:
              'http://webtv.feratel.com/webtv/?cam=15085&design=v3&c0=0&c2=1&lg=fr&pg=40354CFF-57D1-4271-9EE2-08A745983EDD&s=0',
        ),
        WebCam(
          name: 'Pal - Coll de la Botella',
          url:
              'http://webtv.feratel.com/webtv/?cam=15086&design=v3&c0=0&c2=1&lg=fr&pg=40354CFF-57D1-4271-9EE2-08A745983EDD&s=0',
        ),
        WebCam(
          name: 'Ordino Arcalís - Cap de la Coma',
          url:
              'http://webtv.feratel.com/webtv/?cam=15030&design=v3&c0=0&c2=1&lg=fr&pg=40354CFF-57D1-4271-9EE2-08A745983EDD&s=0',
        ),
        WebCam(
          name: 'Ordino Arcalís - La Coma',
          url:
              'http://webtv.feratel.com/webtv/?cam=15031&design=v3&c0=0&c2=1&lg=fr&pg=40354CFF-57D1-4271-9EE2-08A745983EDD&s=0',
        ),
        WebCam(
          name: 'Canillo - El Forn',
          url:
              'http://webtv.feratel.com/webtv/?cam=15065&design=v3&c0=0&c2=1&lg=fr&pg=40354CFF-57D1-4271-9EE2-08A745983EDD&s=0',
        ),
        WebCam(
          name: 'El Tarter',
          url:
              'http://webtv.feratel.com/webtv/?cam=15045&design=v3&c0=0&c2=1&lg=fr&pg=40354CFF-57D1-4271-9EE2-08A745983EDD&s=0',
        ),
        WebCam(
          name: 'Grau Roig',
          url:
              'http://webtv.feratel.com/webtv/?cam=15050&design=v3&c0=0&c2=1&lg=fr&pg=40354CFF-57D1-4271-9EE2-08A745983EDD&s=0',
        ),
        WebCam(
          name: 'Pas de la Casa',
          url:
              'http://webtv.feratel.com/webtv/?cam=15055&design=v3&c0=0&c2=1&lg=fr&pg=40354CFF-57D1-4271-9EE2-08A745983EDD&s=0',
        ),
        WebCam(
          name: 'Espiolets',
          url:
              'http://webtv.feratel.com/webtv/?cam=15060&design=v3&c0=0&c2=1&lg=fr&pg=40354CFF-57D1-4271-9EE2-08A745983EDD&s=0',
        ),
        WebCam(
          name: 'Cortals',
          url:
              'http://webtv.feratel.com/webtv/?cam=15090&design=v3&c0=0&c2=1&lg=fr&pg=40354CFF-57D1-4271-9EE2-08A745983EDD&s=0',
        ),
      ],
    ),
    SkiResort(
      id: 78,
      name: 'Peyragudes',
      mountain: Mountain.pyrenees,
      webcams: [
        WebCam(
          name: 'Belvédère',
          url: 'https://www.skaping.com/peyragudes/belvedere',
        ),
        WebCam(
          name: 'Cap de Pales - 2115m',
          url: 'https://www.skaping.com/peyragudes/cap-de-pales',
        ),
        WebCam(
          name: 'Serias - 1600m',
          url: 'https://www.skaping.com/peyragudes/serias',
        ),
        WebCam(
          name: 'Serre-Doumenge',
          url: 'https://www.skaping.com/peyragudes/serre-doumenge',
        ),
        WebCam(
          name: 'Peyresourde - 1600m',
          url: 'https://www.skaping.com/peyragudes/peyresourde',
        ),
        WebCam(
          name: 'Les Agudes',
          url: 'https://www.skaping.com/peyragudes/les-agudes',
        ),
        WebCam(
          name: 'Tour de Genos - 900m',
          url: 'https://www.skaping.com/loudenvielle/tour-de-genos',
        ),
        WebCam(
          name: 'Sérias',
          url: 'https://pv.viewsurf.com/1796/Peyragudes-Serias',
        ),
        WebCam(
          name: 'Arrivée du Serre Doumenge',
          url: 'https://pv.viewsurf.com/1794/Peyragudes-Station',
        ),
        WebCam(
          name: 'Arrivée',
          url:
              'https://pv.viewsurf.com/1794/Peyragudes-Station?i=Njg0MDp1bmRlZmluZWQ',
        ),
        WebCam(
          name: 'Sommet',
          url:
              'https://pv.viewsurf.com/1794/Peyragudes-Station?i=Njg1Mjp1bmRlZmluZWQ',
        ),
        WebCam(
          name: 'Télésièges',
          url:
              'https://pv.viewsurf.com/1794/Peyragudes-Station?i=Njg1NDp1bmRlZmluZWQ',
        ),
      ],
    ),
    SkiResort(
      id: 79,
      name: 'Font Romeu',
      mountain: Mountain.pyrenees,
      webcams: [
        WebCam(
          name: 'La Calme',
          url: 'https://app.webcam-hd.com/font-romeu/calme-sud',
        ),
        WebCam(
          name: 'Les Airelles',
          url: 'https://m.webcam-hd.com/font-romeu/pied-de-piste',
        ),
        WebCam(
          name: 'Gallinera',
          url:
              'https://visionenvironnement.quanteec.com/embeded/embeded.html?uuid=ce354013-59bd-46b8-746c-7561-6665-64-9886-b78bf7a37e88d&type=live&analyticsID=visionenvironnement?rel=0&showinfo=0&autoplay=1&playsinline=1&enablejsapi=1&mute=1&modestbranding=1',
        ),
        WebCam(
          name: 'Front de Neige',
          url:
              'https://app.webcam-hd.com/font-romeu/pyrenees-2000-front-de-neige',
        ),
        WebCam(
          name: 'Roc de la Calme',
          url: 'https://m.webcam-hd.com/font-romeu/roc-de-la-calme',
        ),
        WebCam(
          name: 'Snowpark',
          url:
              'https://platforms5.joada.net/embeded/embeded.html?uuid=aa728682-90fd-4b88-3331-3230-6d61-63-b6ad-2b5c949d5235d&type=vod&liveicon=0&vsheader=1&tz=Europe/Paris&tsp=1704199504&titletext=',
        ),
        WebCam(
          name: "Zoom Cambre d'Aze",
          url:
              'https://www.webcam-hd.com/images/font-romeu_roc-de-la-calme/zooms/font-romeu_roc-de-la-calme8.jpg',
        ),
        WebCam(
          name: 'Zoom Pic Canigou',
          url:
              'https://www.webcam-hd.com/images/font-romeu_roc-de-la-calme/zooms/font-romeu_roc-de-la-calme6.jpg',
        ),
        WebCam(
          name: 'Zoom Col Midja',
          url:
              'https://www.webcam-hd.com/images/font-romeu_roc-de-la-calme/zooms/font-romeu_roc-de-la-calme5.jpg',
        ),
        WebCam(
          name: 'Zoom Puigmal',
          url:
              'https://www.webcam-hd.com/images/font-romeu_roc-de-la-calme/zooms/font-romeu_roc-de-la-calme9.jpg',
        ),
        WebCam(
          name: 'Zoom Pics Péric',
          url:
              'https://www.webcam-hd.com/images/font-romeu_roc-de-la-calme/zooms/font-romeu_roc-de-la-calme4.jpg',
        ),
        WebCam(
          name: 'Zoom Pic Carlit',
          url:
              'https://www.webcam-hd.com/images/font-romeu_roc-de-la-calme/zooms/font-romeu_roc-de-la-calme2.jpg',
        ),
      ],
    ),
    SkiResort(
      id: 80,
      name: 'Les Angles',
      mountain: Mountain.pyrenees,
      webcams: [
        WebCam(
          name: 'Panoramique',
          url: 'https://pv.viewsurf.com/668/Les-Angles-vue-panoramique',
        ),
        WebCam(
          name: 'Plateau de Bigorre',
          url: 'https://pv.viewsurf.com/1736/Les-Angles-Plateau-de-Bigorre',
        ),
        WebCam(
          name: 'Angles Bas de Station',
          url:
              'https://pv.viewsurf.com/1734/Les-Angles-vue-du-bas-de-la-station',
        ),
        WebCam(
          name: "Roc d'Aude",
          url:
              'https://broadcast.viewsurf.com/cb35437407edec2c3234c09c927cbfd2/capture/16148/playEmbed',
        ),
      ],
    ),
    SkiResort(
      id: 81,
      name: 'La Mongie/Barèges',
      mountain: Mountain.pyrenees,
      webcams: [
        WebCam(
          name: 'Col du Tourmalet',
          url: 'https://www.skaping.com/grandtourmalet/coldutourmalet',
        ),
        WebCam(
          name: '4 Termes',
          url: 'https://www.skaping.com/grandtourmalet/lamongie4termes',
        ),
        WebCam(
          name: 'Liaison - Barèges La Mongie',
          url: 'https://www.skaping.com/grandtourmalet/liaison/video',
        ),
        WebCam(
          name: 'Pourteilh',
          url: 'https://www.skaping.com/grandtourmalet/lamongiepourteilh/video',
        ),
        WebCam(
          name: 'Barèges - Tourmalet',
          url: 'https://www.skaping.com/grandtourmalet/baregestourmalet',
        ),
        WebCam(
          name: 'La Mongie - Village',
          url: 'https://www.skaping.com/grandtourmalet/lamongievillage',
        ),
        WebCam(
          name: 'La Laquette',
          url: 'https://www.skaping.com/grandtourmalet/laquette',
        ),
        WebCam(
          name: 'Sapins',
          url: 'https://www.skaping.com/grandtourmalet/sapins',
        ),
        WebCam(
          name: 'La Mongie - Tourmalet',
          url: 'https://www.skaping.com/grandtourmalet/lamongietourmalet',
        ),
        WebCam(
          name: 'Tournaboup',
          url: 'https://www.skaping.com/grandtourmalet/baregestournaboup/video',
        ),
        WebCam(
          name: 'Lienz',
          url: 'https://www.skaping.com/grandtourmalet/baregeslienz/video',
        ),
      ],
    ),
    SkiResort(
      id: 82,
      name: 'La Pierre Saint-Martin',
      mountain: Mountain.pyrenees,
      webcams: [
        WebCam(
          name: 'Front de neige',
          url: 'https://vision-environnement.com/live/player/psm-ha0.php',
        ),
        WebCam(
          name: 'Secteur haut, Arlas',
          url: 'https://vision-environnement.com/live/player/psm-p0.php',
        ),
        WebCam(
          name: "Restaurant d'Altitude",
          url:
              'https://vision-environnement.com/live/player/psm-palombiere0.php',
        ),
        WebCam(
          name: 'Espace Nordique',
          url: 'https://vision-environnement.com/live/player/psm-en0.php',
        ),
        WebCam(
          name: 'Secteur haut, Panoramique',
          url:
              'https://visionenvironnement.quanteec.com/embeded/embeded.html?uuid=1b381ced-db6f-438f-746c-7561-6665-64-b88e-e28d153a5434d&type=live&analyticsID=visionenvironnement',
        ),
      ],
    ),
    SkiResort(
      id: 83,
      name: 'Luz Ardiden',
      mountain: Mountain.pyrenees,
      webcams: [
        WebCam(
          name: 'Pourtere',
          url: 'https://www.skaping.com/luz-ardiden/pourtere',
        ),
        WebCam(
          name: 'Aulian',
          url: 'https://www.skaping.com/luz-ardiden/aulian',
        ),
        WebCam(
          name: 'Bederet',
          url: 'https://www.skaping.com/luz-ardiden/bederet',
        ),
      ],
    ),
    SkiResort(
      id: 84,
      name: 'Luchon Superbagnères',
      mountain: Mountain.pyrenees,
      webcams: [
        WebCam(
          name: 'Le Plateau',
          url: 'https://live.neos360.com/luchon/plateau/',
        ),
      ],
    ),
    SkiResort(
      id: 85,
      name: 'Piau Engaly',
      mountain: Mountain.pyrenees,
      webcams: [
        WebCam(
          name: 'Lac Oredon',
          url: 'https://www.skaping.com/neouvielle/lac-oredon',
        ),
        WebCam(
          name: 'Espace débutants - 1850m',
          url: 'https://pv.viewsurf.com/1630/Piau-Engaly-1850m?i=NjMyMDo',
        ),
        WebCam(
          name: 'Panoramique HD - 2200m',
          url: 'https://pv.viewsurf.com/448/Piau-Engaly-2200m?i=MjkyNDo',
        ),
        WebCam(
          name: 'Pic de Piau - 2696m',
          url: 'https://pv.viewsurf.com/448/Piau-Engaly-2200m?i=MjkyODo',
        ),
        WebCam(
          name: 'Vallée de Badet - 2200m',
          url: 'https://pv.viewsurf.com/448/Piau-Engaly-2200m?i=MjkzMjo',
        ),
        WebCam(
          name: 'Combe de Piau - 2200m',
          url: 'https://pv.viewsurf.com/448/Piau-Engaly-2200m?i=Mzg0Njo',
        ),
        WebCam(
          name: 'Panoramique HD - 1850m',
          url: 'https://pv.viewsurf.com/1630/Piau-Engaly-1850m?i=NjMyNDo',
        ),
        WebCam(
          name: 'TSD Engaly - 2200m',
          url: 'https://pv.viewsurf.com/448/Piau-Engaly-2200m?i=MjkzMDo',
        ),
        WebCam(
          name: 'TSD Pic de Piau - 1850m',
          url: 'https://pv.viewsurf.com/1630/Piau-Engaly-1850m?i=NjMyODo',
        ),
        WebCam(
          name: 'Snowpark - 1850m',
          url: 'https://pv.viewsurf.com/1630/Piau-Engaly-1850m?i=NjMyNjo',
        ),
        WebCam(
          name: 'Le Col - 1850m',
          url: 'https://pv.viewsurf.com/1630/Piau-Engaly-1850m?i=NjMyMjo',
        ),
        WebCam(
          name: 'Campbielh - 1850m',
          url: 'https://pv.viewsurf.com/448/Piau-Engaly-2200m?i=MjkyNjo',
        ),
        WebCam(
          name: 'Balnéo - 1850m',
          url: 'https://pv.viewsurf.com/1630/Piau-Engaly-1850m?i=NjMxODo',
        ),
      ],
    ),
  ];

  static const webcamsCorse = <SkiResort>[
    SkiResort(
      id: 86,
      name: 'Ghisoni',
      mountain: Mountain.corse,
      webcams: [
        WebCam(
          name: 'Petra Niella',
          url: 'https://www.ghisoni.corsica/media/webcams/webcam1.jpg',
        ),
        WebCam(
          name: 'Départ U Capaghjolu',
          url: 'https://www.ghisoni.corsica/media/webcams/webcam2.jpg',
        ),
      ],
    ),
    SkiResort(
      id: 87,
      name: "Bastelica (Val d'Ese)",
      mountain: Mountain.corse,
      webcams: [
        WebCam(
          name: 'Axis',
          url: 'http://defi2a.alwaysdata.net/ese/sauve_cam_axis.jpg',
        ),
        WebCam(
          name: 'Dahua',
          url: 'http://defi2a.alwaysdata.net/ese/sauve_cam_dahua.jpg',
        ),
      ],
    ),
    SkiResort(
      id: 88,
      name: 'Asco',
      mountain: Mountain.corse,
      webcams: [
        WebCam(
          name: 'Asco',
          url:
              'https://asco.corsica/catalog_repository/UserFiles/Image/cam/asco.jpg',
        ),
      ],
    ),
  ];

  static const webcamsJura = [
// Jura
    SkiResort(
      id: 89,
      name: 'Les Rousses',
      mountain: Mountain.jura,
      webcams: [
        WebCam(
          name: 'Les Tuffes',
          url: 'https://app.webcam-hd.com/les-rousses/les-tuffes',
        ),
        WebCam(
          name: 'Les Jouvencelles',
          url: 'https://app.webcam-hd.com/les-rousses/jouvencelles-ts',
        ),
        WebCam(
          name: 'La Dôle',
          url: 'https://app.webcam-hd.com/les-rousses/massif-de-dole',
        ),
        WebCam(
          name: 'Le Balancier',
          url: 'https://app.webcam-hd.com/les-rousses/porte-balancier',
        ),
        WebCam(
          name: 'La Serra',
          url: 'https://app.webcam-hd.com/les-rousses/la-serra',
        ),
      ],
    ),
    SkiResort(
      id: 90,
      name: 'Mont Jura',
      mountain: Mountain.jura,
      webcams: [
        WebCam(
          name: 'Telecabine Fierney',
          url: 'https://app.webcam-hd.com/mont-jura/telecabine-crozet',
        ),
        WebCam(
          name: 'Menthières',
          url: 'https://app.webcam-hd.com/mont-jura/menthieres',
        ),
        WebCam(
          name: 'La Faucille',
          url:
              'https://app.webcam-hd.com/mont-jura/la-faucille-coeur-de-station',
        ),
        WebCam(
          name: 'La Vattay',
          url: 'https://app.webcam-hd.com/mont-jura/la-vattay',
        ),
        WebCam(
          name: 'Petit Mont rond 1540m',
          url: 'https://app.webcam-hd.com/mont-jura/la-faucille-1540',
        ),
        WebCam(
          name: 'Sommet Station - Monthoisey',
          url: 'https://www.skaping.com/montsjura/monthoisey',
        ),
        WebCam(
          name: 'Lélex Catheline 1450m',
          url: 'https://app.webcam-hd.com/mont-jura/catheline',
        ),
        WebCam(
          name: 'Col de la Faucille 1323m',
          url: 'https://m.webcam-hd.com/ain/col-de-la-faucille',
        ),
      ],
    ),
    SkiResort(
      id: 91,
      name: 'Métabief',
      mountain: Mountain.jura,
      webcams: [
        WebCam(
          name: 'Front de Neige',
          url: 'https://app.webcam-hd.com/orex_metabief/front-de-neige',
        ),
        WebCam(
          name: 'Sommet Morond',
          url: 'https://app.webcam-hd.com/orex_metabief/morond',
        ),
      ],
    ),
  ];

  static const webcamsCentral = [
// Massif Central
    SkiResort(
      id: 92,
      name: 'Besse/Mont-Dore',
      mountain: Mountain.massifCentral,
      webcams: [
        WebCam(
          name: 'Besse - Haut',
          url: 'https://app.webcam-hd.com/sancy/superbesse-haut',
        ),
        WebCam(
          name: 'Besse - Bas',
          url: 'https://app.webcam-hd.com/sancy/superbesse-ecole',
        ),
        WebCam(
          name: 'Besse - Front Neige',
          url: 'https://www.youtube.com/embed/XWmQtBOaSXQ?autoplay=1&mute=1',
        ),
        WebCam(
          name: 'Mont-Dore - Sommet',
          url: 'https://app.webcam-hd.com/sancy/mont-dore-sommet-station',
        ),
        WebCam(
          name: 'Mont-Dore - Bas',
          url: 'https://app.webcam-hd.com/sancy/mont-dore-bas-station',
        ),
        WebCam(
          name: 'Chastreix',
          url: 'https://app.webcam-hd.com/sancy/mont-dore-bas-station',
        ),
        WebCam(
          name: 'Besse - Pertuyzat',
          url: 'https://app.webcam-hd.com/sancy/domaine-nordique-pertuyzat',
        ),
        WebCam(
          name: "La Tour d'Auvergne - La Stèle",
          url: 'https://app.webcam-hd.com/sancy/domaine-nordique-la-stele',
        ),
        WebCam(
          name: 'Château de Murol',
          url: 'https://app.webcam-hd.com/murol/chateau-de-murol',
        ),
        WebCam(
          name: 'Lac Chambon',
          url: 'https://app.webcam-hd.com/sancy/lac-de-chambon',
        ),
      ],
    ),
    SkiResort(
      id: 93,
      name: 'Le Lioran',
      mountain: Mountain.massifCentral,
      webcams: [
        WebCam(
          name: 'Centre station',
          url: 'https://app.webcam-hd.com/lioran/lioran_station',
        ),
        WebCam(
          name: "Font d'Alagnon",
          url: 'https://app.webcam-hd.com/lioran/lioran_font-d-alagnon',
        ),
        WebCam(
          name: 'Sommet - Combe',
          url: 'https://app.webcam-hd.com/lioran/lioran_combe',
        ),
        WebCam(
          name: 'Versant - Plomb',
          url: 'https://app.webcam-hd.com/lioran/lioran_versant-plomb',
        ),
        WebCam(
          name: 'Prat de Bouc',
          url:
              'https://www.vision-environnement.com/live/modules/timelapse/capture/pratdebouc.jpg',
        ),
      ],
    ),
    SkiResort(
      id: 101,
      name: 'Croix de Bauzon',
      mountain: Mountain.massifCentral,
      webcams: [
        WebCam(
          name: 'Station',
          url: 'https://g0.ipcamlive.com/player/player.php?alias=6395af074a957',
        ),
      ],
    ),
  ];

  static const webcamsVosges = [
// Vosges
    SkiResort(
      id: 94,
      name: 'La Bresse Hohneck',
      mountain: Mountain.vosges,
      webcams: [
        WebCam(
          name: 'Front de Neige',
          url: 'https://www.skaping.com/labresse/front-de-neige',
        ),
        WebCam(
          name: 'Hohneck',
          url: 'https://www.skaping.com/la-bresse/hohneck',
        ),
        WebCam(
          name: 'Haut de Vologne',
          url: 'https://www.skaping.com/la-bresse/haut-de-vologne',
        ),
        WebCam(
          name: "Haut d'Artimont",
          url: 'https://app.webcam-hd.com/labresse/sommet-tsd4',
        ),
      ],
    ),
    SkiResort(
      id: 35,
      name: 'Le Champ du Feu',
      mountain: Mountain.vosges,
      webcams: [
        WebCam(
          name: 'Front de Neige',
          url: 'https://www.lechampdufeu.com/images/cam/cam1.jpg',
        ),
        WebCam(
          name: 'TK Rocher',
          url: 'https://www.lechampdufeu.com/images/cam/cam2.jpg',
        ),
        WebCam(
          name: 'TK Chapelle',
          url: 'https://www.lechampdufeu.com/images/cam/cam3.jpg',
        ),
        WebCam(
          name: 'Ext Toit 1',
          url: 'https://www.lechampdufeu.com/images/cam/cam4.jpg',
        ),
        WebCam(
          name: 'Ext Toit 2',
          url: 'https://www.lechampdufeu.com/images/cam/cam5.jpg',
        ),
      ],
    ),
  ];
}
