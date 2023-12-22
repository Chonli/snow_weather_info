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
      name: 'Vallée de Chamonix',
      mountain: Mountain.alpesNord,
      webcams: [
        WebCam(
          name: 'Chamonix',
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
    SkiResort(
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
      ],
    ),
    // TODO(Chonli): La plagne
    SkiResort(
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
          name: 'Les Menuires -  La Masse',
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
          name: 'Les Menuires -  La Croisette',
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
          name: 'Val Thorens -  Funitel de Thorens',
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
      name: 'La Grave',
      mountain: Mountain.alpesNord,
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
    SkiResort(
      name: 'Cauterets',
      mountain: Mountain.pyrenees,
      webcams: [
        WebCam(
          name: 'Terrasse du Lys 1800m',
          url: 'https://www.skaping.com/cauterets/cirque-du-lys/panorama',
        ),
        WebCam(
          name: 'Crêtes  2400m',
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
    // Jura
    SkiResort(
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
    // Massif Central
    SkiResort(
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
          url: 'https://youtu.be/XWmQtBOaSXQ',
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
    // Vosges
    SkiResort(
      name: 'La Bresse Hohneck',
      mountain: Mountain.vosges,
      webcams: [
        WebCam(
          name: 'Front de Neige',
          url: 'https://www.skaping.com/labresse/front-de-neige',
        ),
        WebCam(
          name: 'Hohneck',
          url: 'https://www.skaping.com/labresse/hohneck',
        ),
        WebCam(
          name: 'Haut de Vologne',
          url: 'https://www.skaping.com/labresse/haut-de-vologne',
        ),
        WebCam(
          name: "Haut d'Artimont",
          url: 'https://app.webcam-hd.com/labresse/sommet-tsd4',
        ),
      ],
    ),
  ];
}
