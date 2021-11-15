import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _lastStationPrefs = 'lastStationPrefs';
const _lastStationDataPrefs = 'lastStationDataPrefs';
const _favoritesStationPrefs = 'favoritesStationPrefs';
const _themeModePrefs = 'themeModePrefs';

class Preferences {
  Preferences(this.preferences);

  final SharedPreferences preferences;

  DateTime get lastStationDataDate => DateTime.parse(
      preferences.getString(_lastStationDataPrefs) ?? '19700101');
  DateTime get lastStationDate => DateTime.parse(
      preferences.getString(_lastStationPrefs) ?? DateTime.now().toString());
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
}
