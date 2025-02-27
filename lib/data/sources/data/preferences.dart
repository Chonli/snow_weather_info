import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'preferences.g.dart';

const _favoritesStationPrefs = 'favoritesStationPrefs';

const _favoritesSkiResortPrefs = 'favoritesSkiResortPrefs';
const _favoritesBERAPrefs = 'favoritesBERAPrefs';
const _themeModePrefs = 'themeModePrefs';
const _showNoDataStationPrefs = 'showNoDataStationPrefs';
const _showClusterLayerPrefs = 'showClusterLayerPrefs';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
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
class FavoritesSkiResortSettings extends _$FavoritesSkiResortSettings {
  @override
  List<int> build() {
    return _favoritesSkiResort;
  }

  SharedPreferences get _preference => ref.watch(sharedPreferencesProvider);

  List<int> get _favoritesSkiResort =>
      _preference
          .getStringList(_favoritesSkiResortPrefs)
          ?.map(int.parse)
          .toList() ??
      [];

  void update(List<int> favorites) {
    if (!listEquals(state, favorites)) {
      state = favorites;
      _preference.setStringList(
        _favoritesSkiResortPrefs,
        favorites.map((e) => e.toString()).toList(),
      );
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
