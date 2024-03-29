import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _lastStationPrefs = 'lastStationPrefs';
const _lastStationDataPrefs = 'lastStationDataPrefs';
const _favoritesStationPrefs = 'favoritesStationPrefs';
const _favoritesBERAPrefs = 'favoritesBERAPrefs';
const _themeModePrefs = 'themeModePrefs';
const _viewNoDataStationPrefs = 'viewNoDataStationPrefs';
const _showClusterLayerPrefs = 'showClusterLayerPrefs';

class Preferences {
  Preferences(this.preferences);

  final SharedPreferences preferences;

  DateTime get lastStationDataDate => DateTime.parse(
        preferences.getString(_lastStationDataPrefs) ?? '19700101',
      );
  DateTime get lastStationDate => DateTime.parse(
        preferences.getString(_lastStationPrefs) ?? DateTime.now().toString(),
      );
  List<String> get favoritesStations =>
      preferences.getStringList(_favoritesStationPrefs) ?? [];

  void setLastStationDataDate(DateTime lastStationData) {
    preferences.setString(_lastStationDataPrefs, lastStationData.toString());
  }

  void setLastStationDate(DateTime lastStation) {
    preferences.setString(_lastStationPrefs, lastStation.toString());
  }

  void updateFavoritesStations(List<String> favorites) {
    preferences.setStringList(_favoritesStationPrefs, favorites);
  }

  // BERA
  List<String> get favoritesBERA =>
      preferences.getStringList(_favoritesBERAPrefs) ?? [];

  void updateFavoritesBERA(List<String> favorites) {
    preferences.setStringList(_favoritesBERAPrefs, favorites);
  }

  //Themes
  ThemeMode get themeMode {
    final index = preferences.getInt(_themeModePrefs);
    if (index != null) {
      return ThemeMode.values[index];
    }

    return ThemeMode.system;
  }

  void setThemeMode(ThemeMode themeMode) {
    preferences.setInt(_themeModePrefs, themeMode.index);
  }

  //views data station
  bool get viewNoDataStation =>
      preferences.getBool(_viewNoDataStationPrefs) ?? true;

  void setViewNoDataStation({required bool viewNoDataStation}) {
    preferences.setBool(_viewNoDataStationPrefs, viewNoDataStation);
  }

  //views data station
  bool get showClusterLayer =>
      preferences.getBool(_showClusterLayerPrefs) ?? false;

  void setShowClusterLayer({required bool showClusterLayer}) {
    preferences.setBool(_showClusterLayerPrefs, showClusterLayer);
  }
}
