import 'package:flutter/material.dart';
import 'package:snow_weather_info/data/sources/preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  late Preferences preferences;

  void init() {
    themeMode = preferences.themeMode;
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
}
