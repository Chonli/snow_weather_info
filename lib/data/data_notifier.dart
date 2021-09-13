import 'dart:async';
import 'dart:developer' show log;

import 'package:collection/collection.dart';
import 'package:csv/csv.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:snow_weather_info/data/sources/avalanche_api.dart';
import 'package:snow_weather_info/data/sources/data_api.dart';
import 'package:snow_weather_info/data/sources/database_helper.dart';
import 'package:snow_weather_info/data/sources/preferences.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/model/station.dart';

import 'constant_data_list.dart';

class DataNotifier extends ChangeNotifier {
  late Preferences preferences;
  late AvalancheAPI avalancheAPI;
  late DataAPI dataAPI;
  late DatabaseHelper databaseHelper;

  bool _isInitialise = false;
  final _mapDataStation = <int, List<DataStation>>{};
  LatLng currentMapLoc = LatLng(45.05, 6.3);
  int currentIndexTab = 0;

  List<AvalancheBulletin> get avalancheBulletins =>
      ConstantDatalist.listAvalancheBulletin;

  bool get loading => _loading;
  bool _loading = false;
  @protected
  set loading(bool value) {
    if (_loading != value) {
      _loading = value;
      notifyListeners();
    }
  }

  List<Station> get stations => _stations.toList();
  List<Station> _stations = [];
  @protected
  set stations(List<Station> value) {
    if (_stations != value) {
      _stations = value;
      notifyListeners();
    }
  }

  List<Nivose> get nivoses => _nivoses.toList();
  List<Nivose> _nivoses = [];
  @protected
  set nivoses(List<Nivose> value) {
    if (_nivoses != value) {
      _nivoses = value;
      notifyListeners();
    }
  }

  List<AbstractStation> get allStations => [..._nivoses, ..._stations];

  List<AbstractStation> get favoritesStations => _favoritesStations.toList();
  List<AbstractStation> _favoritesStations = [];
  @protected
  set favoritesStations(List<AbstractStation> value) {
    if (_favoritesStations != value) {
      _favoritesStations = value;
      notifyListeners();
    }
  }

  AtomFeed? get avalancheFeed => _avalancheFeed;
  AtomFeed? _avalancheFeed;
  @protected
  set avalancheFeed(AtomFeed? value) {
    if (_avalancheFeed != value) {
      _avalancheFeed = value;
      notifyListeners();
    }
  }

  List<DataStation> getDataOfStation(int id) {
    return _mapDataStation[id] ?? [];
  }

  Nivose getNivose(String codeMF) {
    return _nivoses.firstWhere((n) => n.codeMF == codeMF);
  }

  Future<bool> initData() async {
    if (!_isInitialise) {
      loading = true;
      await preferences.init();
      _initNivose();

      try {
        await Future.wait([
          _initStation(),
          _downloadStationData(),
          // uncomment to use test value
          //_readTestStationData(),
        ]);
        avalancheFeed = await avalancheAPI.getAvalanche();
        await _finalizeStationData();
        await _initFavorites();
        _isInitialise = true;
      } catch (e) {
        log('init error : $e');
      } finally {
        loading = false;
      }
    }

    return _isInitialise;
  }

  Future<void> _finalizeStationData() async {
    await databaseHelper.cleanOldData(7);

    for (final s in _stations) {
      final listOfData = await databaseHelper.getDataStation(s.id);
      _mapDataStation[s.id] = listOfData;
      s.hasData = listOfData.isNotEmpty;
      if (s.hasData) {
        final dataSt = listOfData.firstWhereOrNull((d) => d.snowHeight != null);
        s.lastSnowHeight = dataSt?.snowHeight ?? 0;
      } else {
        s.lastSnowHeight = 0.0;
      }
    }
  }

  Future<void> _initFavorites() async {
    final listFav = preferences.favoritesStations;
    _favoritesStations = [];
    _stations.forEach((s) {
      if (listFav.contains(s.id.toString())) {
        _favoritesStations.add(s);
      }
    });
    _nivoses.forEach((s) {
      if (listFav.contains(s.codeMF)) {
        _favoritesStations.add(s);
      }
    });
  }

  bool isFavorite(AbstractStation station) {
    return _favoritesStations.contains(station);
  }

  void addFavoriteStation(AbstractStation station) {
    _favoritesStations.add(station);
    _updateFavoriteStation();
    notifyListeners();
  }

  void removeFavoriteStation(AbstractStation station) {
    _favoritesStations.remove(station);
    _updateFavoriteStation();
    notifyListeners();
  }

  void _updateFavoriteStation() {
    preferences.updateFavoritesStations(
      _favoritesStations.map<String>(
        (s) {
          if (s is Station) {
            return s.id.toString();
          } else if (s is Nivose) {
            return s.codeMF;
          }
          return '';
        },
      ).toList(),
    );
  }

  void _decodeStationData(String data) {
    final cvsResult = const CsvToListConverter().convert(
      data,
      fieldDelimiter: ';',
      eol: '\n',
      shouldParseNumbers: false,
    );

    if (cvsResult.length > 1) {
      if (cvsResult[0].length > 2) {
        cvsResult.removeAt(0);
        final listData = cvsResult.map<DataStation>(
          (line) {
            return DataStation.fromList(line);
          },
        ).toList();

        listData.forEach((d) async {
          await databaseHelper.insertStationData(d);
        });
      }
    }
  }

  Future<void> _downloadStationData() async {
    DateTime? lastDataDownload;
    final lastDateData = preferences.lastStationDataDate;
    log('last data ${lastDateData.toString()}');
    for (int i = 7; i >= 0; --i) {
      final dateTime = DateTime.now().subtract(Duration(days: i));

      if (dateTime.isAfter(lastDateData)) {
        final dateStr = DateFormat('yyyyMMdd').format(dateTime);
        final url = Uri.parse(
          'https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/nivo.$dateStr.csv',
        );
        final response = await http.get(url);

        if (response.statusCode == 200) {
          _decodeStationData(response.body);
          lastDataDownload = dateTime;
          log('get data OK');
        }
      }
    }

    if (lastDataDownload != null) {
      preferences.setLastStationDataDate(lastDataDownload);
    }
  }

  Future<void> _readTestStationData() async {
    final data =
        await rootBundle.loadString('assets/test_data/nivo.202102.txt');
    _decodeStationData(data);
  }

  Future<void> _initStation() async {
    final stationUpdateDate = preferences.lastStationDate;
    stations = await databaseHelper.getAllStation();
    if (stations.isEmpty ||
        stationUpdateDate.difference(DateTime.now()) >
            const Duration(days: 15)) {
      stations = await dataAPI.getStation();
      stations.forEach((s) => databaseHelper.insertStation(s));

      preferences.setLastStationDate(DateTime.now());
    }
  }

  void _initNivose() {
    _nivoses = ConstantDatalist.listNivose;
  }
}
