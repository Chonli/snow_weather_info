import 'package:flutter/material.dart';
import 'package:snow_weather_info/data/sources/preferences.dart';

class PreferenceNotifier extends ChangeNotifier {
  late final Preferences preferences;

  void init() {
    themeMode = preferences.themeMode;
    viewNoDataStation = preferences.viewNoDataStation;
  }

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  set themeMode(ThemeMode value) {
    if (_themeMode != value) {
      _themeMode = value;
      preferences.setThemeMode(value);
      notifyListeners();
    }
  }

  bool _viewNoDataStation = true;
  bool get viewNoDataStation => _viewNoDataStation;
  set viewNoDataStation(bool value) {
    if (_viewNoDataStation != value) {
      _viewNoDataStation = value;
      preferences.setViewNoDataStation(viewNoDataStation: value);
      notifyListeners();
    }
  }
}
