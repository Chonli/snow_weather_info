import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
import 'package:intl/intl.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import 'package:package_info/package_info.dart';
import 'package:snow_weather_info/data/sources/avalanche_api.dart';
import 'package:snow_weather_info/data/sources/data_api.dart';
import 'package:snow_weather_info/data/sources/database_helper.dart';
import 'package:snow_weather_info/data/preferences.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:webfeed/domain/atom_feed.dart';
import 'constant_data_list.dart';

class DataNotifier extends ChangeNotifier {
  final _preferences = Preferences();
  AvalancheAPI avalancheAPI;
  DataAPI dataAPI;
  bool _isInitialise = false;
  HashMap<int, List<DataStation>> _mapDataStation;
  List<AvalancheBulletin> _avalancheBulletins;
  PackageInfo packageInfo;
  final Location _location = Location();
  LatLng currentMapLoc = LatLng(45.05, 6.3);
  int currentIndexTab = 0;

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
  List<Station> _stations;
  @protected
  set stations(List<Station> value) {
    if (_stations != value) {
      _stations = value;
      notifyListeners();
    }
  }

  List<Nivose> get nivoses => _nivoses.toList();
  List<Nivose> _nivoses;
  @protected
  set nivoses(List<Nivose> value) {
    if (_nivoses != value) {
      _nivoses = value;
      notifyListeners();
    }
  }

  List<AbstractStation> get allStations => [..._nivoses, ..._stations];

  List<AbstractStation> get favoritesStations => _favoritesStations.toList();
  List<AbstractStation> _favoritesStations;
  @protected
  set favoritesStations(List<AbstractStation> value) {
    if (_favoritesStations != value) {
      _favoritesStations = value;
      notifyListeners();
    }
  }

  AtomFeed get avalancheFeed => _avalancheFeed;
  AtomFeed _avalancheFeed;
  @protected
  set avalancheFeed(AtomFeed value) {
    if (_avalancheFeed != value) {
      _avalancheFeed = value;
      notifyListeners();
    }
  }

  List<DataStation> getDataOfStation(int id) {
    return _mapDataStation[id];
  }

  List<AvalancheBulletin> getAvalancheBulletin(Mountain mountain) {
    return _avalancheBulletins.where((f) => f.mountain == mountain).toList();
  }

  List<AvalancheBulletin> getAllAvalancheBulletin() {
    return _avalancheBulletins.toList();
  }

  Nivose getNivose(String codeMF) {
    return _nivoses.firstWhere((n) => n.codeMF == codeMF);
  }

  Future<bool> initData() async {
    if (!_isInitialise) {
      loading = true;
      await _preferences.init();
      packageInfo = await PackageInfo.fromPlatform();
      _initAvalancheBulletin();
      _initNivose();

      try {
        await Future.wait([
          _initStation(),
          _downloadStationData(),
        ]);
        avalancheFeed = await avalancheAPI.getAvalanche();
        await _finalizeStationData();
        await _initFavorites();
        _isInitialise = true;
      } catch (e) {
        print('init error : $e');
      } finally {
        loading = false;
      }
    }

    return _isInitialise;
  }

  Future<void> _finalizeStationData() async {
    _mapDataStation = HashMap();
    await DatabaseHelper.instance.cleanOldData(7);

    for (final s in _stations) {
      final listOfData = await DatabaseHelper.instance.getDataStation(s.id);
      _mapDataStation[s.id] = listOfData;
      s.hasData = listOfData.isNotEmpty;
      if (s.hasData) {
        final dataSt =
            listOfData.firstWhere((d) => d.hasSnowHeight, orElse: () => null);
        s.lastSnowHeight =
            dataSt != null && dataSt.hasSnowHeight ? dataSt.snowHeight : 0.0;
      } else {
        s.lastSnowHeight = 0.0;
      }
    }
  }

  Future<void> _initFavorites() async {
    final listFav = _preferences.favoritesStations;
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
    _preferences.updateFavoritesStations(_favoritesStations.map<String>((s) {
      if (s is Station) {
        return s.id.toString();
      } else if (s is Nivose) {
        return s.codeMF;
      }
      return '';
    }).toList());
  }

  Future<void> _downloadStationData() async {
    DateTime lastDataDownload;
    final lastDateData = _preferences.lastStationDataDate;
    print('last data ${lastDateData.toString()}');
    for (int i = 7; i >= 0; --i) {
      final dateTime = DateTime.now().subtract(Duration(days: i));

      if (dateTime.isAfter(lastDateData)) {
        final dateStr = DateFormat('yyyyMMdd').format(dateTime);
        final url =
            'https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/nivo.$dateStr.csv';
        print(url);
        final response = await http.get(url);

        if (response.statusCode == 200) {
          final cvsResult = const CsvToListConverter().convert(response.body,
              fieldDelimiter: ';', eol: '\n', shouldParseNumbers: false);

          if (cvsResult.length > 1) {
            if (cvsResult[0].length > 2) {
              cvsResult.removeAt(0);
              final listData = cvsResult.map<DataStation>((line) {
                return DataStation.fromList(line);
              }).toList();

              listData.forEach((d) async {
                await DatabaseHelper.instance.insertStationData(d);
              });

              lastDataDownload = dateTime;
              print('get data OK');
            }
          }
        }
      }
    }

    if (lastDataDownload != null) {
      _preferences.setLastStationDataDate(lastDataDownload);
    }
  }

  Future<void> _initStation() async {
    final stationUpdateDate = _preferences.lastStationDate;
    stations = await DatabaseHelper.instance.getAllStation();
    if (_stations.isEmpty ||
        stationUpdateDate.difference(DateTime.now()) >
            const Duration(days: 15)) {
      final response = await http.get(
          'https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/postesNivo.json');

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        final rest = data['features'] as List<dynamic>;

        for (final json in rest) {
          final st = json['properties'] as Map<String, dynamic>;
          if (st['ID'] != '') {
            _stations.add(Station.fromJson(st));
          }
        }

        _stations.forEach((s) => DatabaseHelper.instance.insertStation(s));

        _preferences.setLastStationDate(DateTime.now());

        print('donwload station ok');
      } else {
        throw Exception('Failed to load station');
      }
    }
  }

  void _initAvalancheBulletin() {
    _avalancheBulletins = ConstantDatalist.listAvalancheBulletin
      ..sort((a, b) => a.massifName.compareTo(b.massifName));
  }

  void _initNivose() {
    _nivoses = ConstantDatalist.listNivose;
  }
}
