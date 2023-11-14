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

@Riverpod(keepAlive: true)
class ThemeModeSettings extends _$ThemeModeSettings {
  @override
  ThemeMode build() {
    return _themeMode;
  }

  SharedPreferences get _preference => ref.watch(sharedPreferencesProvider);

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

@Riverpod(keepAlive: true)
class LastStationDataSettings extends _$LastStationDataSettings {
  @override
  DateTime build() {
    return _lastStationDataDate;
  }

  SharedPreferences get _preference => ref.watch(sharedPreferencesProvider);

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

@Riverpod(keepAlive: true)
class LastStationSettings extends _$LastStationSettings {
  @override
  DateTime build() {
    return _lastStationDate;
  }

  SharedPreferences get _preference => ref.watch(sharedPreferencesProvider);

  DateTime get _lastStationDate => DateTime.parse(
        _preference.getString(_lastStationPrefs) ?? '19700101',
      );

  void updateDate(DateTime lastDate) {
    if (state.difference(lastDate) > const Duration(days: 1)) {
      state = lastDate;
      _preference.setString(_lastStationPrefs, lastDate.toString());
    }
  }
}

@Riverpod(keepAlive: true)
class FavoritesStationSettings extends _$FavoritesStationSettings {
  @override
  List<String> build() {
    return _favoritesStations;
  }

  SharedPreferences get _preference => ref.watch(sharedPreferencesProvider);

  List<String> get _favoritesStations =>
      _preference.getStringList(_favoritesStationPrefs) ?? [];

  void update(List<String> favorites) {
    if (!listEquals(state, favorites)) {
      state = favorites;
      _preference.setStringList(_favoritesStationPrefs, favorites);
    }
  }
}

@Riverpod(keepAlive: true)
class FavoritesBERASettings extends _$FavoritesBERASettings {
  @override
  List<String> build() {
    return _favoritesStations;
  }

  SharedPreferences get _preference => ref.watch(sharedPreferencesProvider);

  List<String> get _favoritesStations =>
      _preference.getStringList(_favoritesBERAPrefs) ?? [];

  void update(List<String> favorites) {
    if (!listEquals(state, favorites)) {
      state = favorites;
      _preference.setStringList(_favoritesBERAPrefs, favorites);
    }
  }
}

@Riverpod(keepAlive: true)
class ShowNoDataStationSettings extends _$ShowNoDataStationSettings {
  @override
  bool build() {
    return _showNoDataStation;
  }

  SharedPreferences get _preference => ref.watch(sharedPreferencesProvider);

  bool get _showNoDataStation =>
      _preference.getBool(_showNoDataStationPrefs) ?? true;

  void update() {
    state = !state;
    _preference.setBool(_showNoDataStationPrefs, state);
  }
}

@Riverpod(keepAlive: true)
class ShowClusterLayerSettings extends _$ShowClusterLayerSettings {
  @override
  bool build() {
    return _showClusterLayer;
  }

  SharedPreferences get _preference => ref.watch(sharedPreferencesProvider);

  bool get _showClusterLayer =>
      _preference.getBool(_showClusterLayerPrefs) ?? false;

  void update() {
    state = !state;
    _preference.setBool(_showClusterLayerPrefs, state);
  }
}
