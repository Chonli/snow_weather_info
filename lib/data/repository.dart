import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
import 'package:intl/intl.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import 'package:package_info/package_info.dart';
import 'package:snow_weather_info/data/database_helper.dart';
import 'package:snow_weather_info/data/preferences.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/model/station.dart';
import 'constant_data_list.dart';

class Repository {
  Preferences _preferences = Preferences();
  bool _isInitialise = false;
  List<Station> _listStation;
  List<Nivose> _listNivose;
  List<AbstractStation> _listFavoritesStation;
  HashMap<int, List<DataStation>> _hashDataStation;
  List<AvalancheBulletin> _listAvalancheBulletin;
  PackageInfo packageInfo;
  final Location _location = Location();
  LatLng currentMapLoc = LatLng(45.05, 6.3);
  LatLng currentUserLoc;
  int currentIndexTab = 0;

  List<Station> get stations => _listStation.toList();

  List<Nivose> get nivoses => _listNivose.toList();

  List<AbstractStation> get favoritesStations => _listFavoritesStation.toList();

  List<DataStation> getDataOfStation(int id) {
    return _hashDataStation[id];
  }

  List<AvalancheBulletin> getAvalancheBulletin(Mountain mountain) {
    return _listAvalancheBulletin.where((f) => f.mountain == mountain).toList();
  }

  List<AvalancheBulletin> getAllAvalancheBulletin() {
    return _listAvalancheBulletin.toList();
  }

  Nivose getNivose(String codeMF) {
    return _listNivose.firstWhere((n) => n.codeMF == codeMF);
  }

  Future<bool> updateLocation() async {
    PermissionStatus hasPermission = await _location.hasPermission();
    if (hasPermission == PermissionStatus.granted) {
      hasPermission = await _location.requestPermission();
    }
    if (hasPermission == PermissionStatus.granted) {
      var loc = await _location.getLocation();
      currentUserLoc = LatLng(loc.latitude, loc.longitude);
    }

    return hasPermission == PermissionStatus.granted;
  }

  Future<bool> initData() async {
    if (!_isInitialise) {
      await _preferences.init();
      packageInfo = await PackageInfo.fromPlatform();
      _initAvalancheBulletin();
      _initNivose();

      try {
        await Future.wait([
          _initStation(),
          _downloadStationData(),
        ]);
        await _finalizeStationData();
        await _initFavorites();
        _isInitialise = true;
      } catch (e) {
        print("init error : " + e.toString());
      }
    }
    return _isInitialise;
  }

  Future<void> _finalizeStationData() async {
    _hashDataStation = HashMap();
    await DatabaseHelper.instance.cleanOldData(7);

    for (var s in _listStation) {
      var listOfData = await DatabaseHelper.instance.getDataStation(s.id);
      _hashDataStation[s.id] = listOfData;
      s.hasData = listOfData.length > 0 ? true : false;
      if (s.hasData) {
        var dataSt =
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
    _listFavoritesStation = List();
    _listStation.forEach((s) {
      if (listFav.contains(s.id.toString())) {
        _listFavoritesStation.add(s);
      }
    });
    _listNivose.forEach((s) {
      if (listFav.contains(s.codeMF)) {
        _listFavoritesStation.add(s);
      }
    });
  }

  bool isFavorite(AbstractStation station) {
    return _listFavoritesStation.contains(station);
  }

  void addFavoriteStation(AbstractStation station) {
    _listFavoritesStation.add(station);
    _updateFavoriteStation();
  }

  void removeFavoriteStation(AbstractStation station) {
    _listFavoritesStation.remove(station);
    _updateFavoriteStation();
  }

  void _updateFavoriteStation() {
    _preferences.updateFavoritesStations(_listFavoritesStation.map<String>((s) {
      if (s is Station) {
        return s.id.toString();
      } else if (s is Nivose) {
        return s.codeMF;
      }
      return "";
    }).toList());
  }

  Future<void> _downloadStationData() async {
    DateTime lastDataDownload;
    var lastDateData = _preferences.lastStationDataDate;
    print("last data ${lastDateData.toString()}");
    for (int i = 7; i >= 0; --i) {
      var dateTime = DateTime.now().subtract(Duration(days: i));

      if (dateTime.isAfter(lastDateData)) {
        var dateStr = DateFormat('yyyyMMdd').format(dateTime);
        var url =
            'https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/nivo.$dateStr.csv';
        print(url);
        var response = await http.get(url);

        if (response.statusCode == 200) {
          var cvsResult = const CsvToListConverter().convert(response.body,
              fieldDelimiter: ';', eol: '\n', shouldParseNumbers: false);

          if (cvsResult.length > 1) {
            if (cvsResult[0].length > 2) {
              cvsResult.removeAt(0);
              var listData = cvsResult.map<DataStation>((line) {
                return DataStation.fromList(line);
              }).toList();

              listData.forEach((d) async {
                await DatabaseHelper.instance.insertStationData(d);
              });

              lastDataDownload = dateTime;
              print("get data OK");
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
    var stationUpdateDate = _preferences.lastStationDate;
    _listStation = await DatabaseHelper.instance.getAllStation();
    if (_listStation.length == 0 ||
        stationUpdateDate.difference(DateTime.now()) > Duration(days: 15)) {
      final response = await http.get(
          'https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/postesNivo.json');

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var rest = data["features"] as List;

        for (var json in rest) {
          var st = json["properties"];
          if (st['ID'] != '') _listStation.add(Station.fromJson(st));
        }

        _listStation.forEach(
            (s) async => await DatabaseHelper.instance.insertStation(s));

        _preferences.setLastStationDate(DateTime.now());

        print("donwload station ok");
      } else {
        throw Exception('Failed to load station');
      }
    }
  }

  _initAvalancheBulletin() {
    _listAvalancheBulletin = ConstantDatalist.listAvalancheBulletin
      ..sort((a, b) => a.massifName.compareTo(b.massifName));
  }

  _initNivose() {
    _listNivose = ConstantDatalist.listNivose;
  }
}
