import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'preferences.g.dart';

const _lastStationPrefs = 'lastStationPrefs';
const _lastStationDataPrefs = 'lastStationDataPrefs';
const _favoritesStationPrefs = 'favoritesStationPrefs';
const _favoritesBERAPrefs = 'favoritesBERAPrefs';
const _themeModePrefs = 'themeModePrefs';
const _showNoDataStationPrefs = 'showNoDataStationPrefs';
const _showClusterLayerPrefs = 'showClusterLayerPrefs';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(SharedPreferencesRef ref) {
  throw UnimplementedError();
}

@riverpod
class ThemeModeSettings extends _$ThemeModeSettings {
  @override
  ThemeMode build() {
    return _themeMode;
  }

  SharedPreferences get _preference => ref.read(sharedPreferencesProvider);

  ThemeMode get _themeMode {
    final index = _preference.getInt(_themeModePrefs);
    if (index != null) {
      return ThemeMode.values[index];
    }

    return ThemeMode.system;
  }

  set _themeMode(ThemeMode themeMode) {
    _preference.setInt(_themeModePrefs, themeMode.index);
  }

  void updateThemeMode(ThemeMode mode) {
    if (state != mode) {
      state = mode;
      _themeMode = mode;
    }
  }
}

@riverpod
class LastStationDataSettings extends _$LastStationDataSettings {
  @override
  DateTime build() {
    return _lastStationDataDate;
  }

  SharedPreferences get _preference => ref.read(sharedPreferencesProvider);

  DateTime get _lastStationDataDate => DateTime.parse(
        _preference.getString(_lastStationDataPrefs) ?? '19700101',
      );

  void updateDate(DateTime lastDate) {
    if (state != lastDate) {
      state = lastDate;
      _preference.setString(_lastStationDataPrefs, lastDate.toString());
    }
  }
}

@riverpod
class LastStationSettings extends _$LastStationSettings {
  @override
  DateTime build() {
    return _lastStationDate;
  }

  SharedPreferences get _preference => ref.read(sharedPreferencesProvider);

  DateTime get _lastStationDate => DateTime.parse(
        _preference.getString(_lastStationPrefs) ?? '19700101',
      );

  void updateDate(DateTime lastDate) {
    if (state != lastDate) {
      state = lastDate;
      _preference.setString(_lastStationPrefs, lastDate.toString());
    }
  }
}

@riverpod
class FavoritesStationSettings extends _$FavoritesStationSettings {
  @override
  List<String> build() {
    return _favoritesStations;
  }

  SharedPreferences get _preference => ref.read(sharedPreferencesProvider);

  List<String> get _favoritesStations =>
      _preference.getStringList(_favoritesStationPrefs) ?? [];

  void update(List<String> favorites) {
    if (!listEquals(state, favorites)) {
      state = favorites;
      _preference.setStringList(_favoritesStationPrefs, favorites);
    }
  }
}

@riverpod
class FavoritesBERASettings extends _$FavoritesBERASettings {
  @override
  List<String> build() {
    return _favoritesStations;
  }

  SharedPreferences get _preference => ref.read(sharedPreferencesProvider);

  List<String> get _favoritesStations =>
      _preference.getStringList(_favoritesBERAPrefs) ?? [];

  void update(List<String> favorites) {
    if (!listEquals(state, favorites)) {
      state = favorites;
      _preference.setStringList(_favoritesBERAPrefs, favorites);
    }
  }
}

@riverpod
class ShowNoDataStationSettings extends _$ShowNoDataStationSettings {
  @override
  bool build() {
    return _showNoDataStation;
  }

  SharedPreferences get _preference => ref.read(sharedPreferencesProvider);

  bool get _showNoDataStation =>
      _preference.getBool(_showNoDataStationPrefs) ?? true;

  void update() {
    state = !state;
    _preference.setBool(_showNoDataStationPrefs, state);
  }
}

@riverpod
class ShowClusterLayerSettings extends _$ShowClusterLayerSettings {
  @override
  bool build() {
    return _showClusterLayer;
  }

  SharedPreferences get _preference => ref.read(sharedPreferencesProvider);

  bool get _showClusterLayer =>
      _preference.getBool(_showClusterLayerPrefs) ?? false;

  void update() {
    state = !state;
    _preference.setBool(_showClusterLayerPrefs, state);
  }
}
