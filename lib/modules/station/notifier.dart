import 'package:flutter/foundation.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/model/station.dart';

class StationNotifier extends ChangeNotifier {
  late DataNotifier dataNotifier;
  late bool displayNoDataStation;
  late List<Station> _noDataStations;
  late List<Station> _dataStations;

  void init() {
    _dataStations = dataNotifier.stations.where((s) => s.hasData).toList();
    _noDataStations = dataNotifier.stations.where((s) => !s.hasData).toList();
    final tmpStations = <AbstractStation>[];
    if (displayNoDataStation) {
      tmpStations.addAll(_noDataStations);
    }
    tmpStations.addAll(_dataStations);
    tmpStations.addAll(dataNotifier.nivoses);
    tmpStations.sort((a, b) => a.name.compareTo(b.name));

    stations = _splitToGroupMap(tmpStations);
    favoriteStations = dataNotifier.favoritesStations;
  }

  Map<String, List<AbstractStation>> _stations = {};
  Map<String, List<AbstractStation>> get stations => _stations;
  set stations(Map<String, List<AbstractStation>> value) {
    if (_stations != value) {
      _stations = value;
      notifyListeners();
    }
  }

  List<AbstractStation> _favoriteStations = [];
  List<AbstractStation> get favoriteStations => _favoriteStations;
  set favoriteStations(List<AbstractStation> value) {
    if (_favoriteStations != value) {
      _favoriteStations = value;
      notifyListeners();
    }
  }

  void search(String query) {
    final tmpQuery = query.toLowerCase();
    final tmpStations = <AbstractStation>[];
    final tmpFavoriteStations = <AbstractStation>[];
    if (query == '') {
      if (displayNoDataStation) {
        tmpStations.addAll(_noDataStations);
      }
      tmpStations.addAll(_dataStations);
      tmpStations.addAll(dataNotifier.nivoses);
      tmpFavoriteStations.addAll(dataNotifier.favoritesStations);
    } else {
      tmpStations.addAll(_dataStations
          .where((s) => s.name.toLowerCase().contains(tmpQuery))
          .toList());
      if (displayNoDataStation) {
        tmpStations.addAll(_noDataStations
            .where((s) => s.name.toLowerCase().contains(tmpQuery))
            .toList());
      }
      tmpStations.addAll(dataNotifier.nivoses
          .where((s) => s.name.toLowerCase().contains(tmpQuery))
          .toList());
      tmpFavoriteStations.addAll(dataNotifier.favoritesStations
          .where((s) => s.name.toLowerCase().contains(tmpQuery))
          .toList());
    }
    tmpStations.sort((a, b) => a.name.compareTo(b.name));
    stations = _splitToGroupMap(tmpStations);

    tmpFavoriteStations.sort((a, b) => a.name.compareTo(b.name));
    favoriteStations = tmpFavoriteStations;
  }

  Map<String, List<AbstractStation>> _splitToGroupMap(
    List<AbstractStation> stations,
  ) {
    final Map<String, List<AbstractStation>> tmpGroupList = {};
    stations.forEach((s) {
      if (tmpGroupList[s.name[0]] == null) {
        tmpGroupList[s.name[0]] = <AbstractStation>[];
      }

      tmpGroupList[s.name[0]]?.add(s);
    });

    return tmpGroupList;
  }
}
