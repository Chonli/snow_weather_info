// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPreferencesHash() => r'1a6250efdc19e86c923ceb598a77ff74d64378e6';

/// See also [sharedPreferences].
@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = Provider<SharedPreferences>.internal(
  sharedPreferences,
  name: r'sharedPreferencesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPreferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SharedPreferencesRef = ProviderRef<SharedPreferences>;
String _$themeModeSettingsHash() => r'106550861a9acf66c527c4f3f77fe9c7c850ac47';

/// See also [ThemeModeSettings].
@ProviderFor(ThemeModeSettings)
final themeModeSettingsProvider =
    NotifierProvider<ThemeModeSettings, ThemeMode>.internal(
  ThemeModeSettings.new,
  name: r'themeModeSettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$themeModeSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ThemeModeSettings = Notifier<ThemeMode>;
String _$favoritesStationSettingsHash() =>
    r'1558bd39ac145e4dad63815a1427b95068c6c379';

/// See also [FavoritesStationSettings].
@ProviderFor(FavoritesStationSettings)
final favoritesStationSettingsProvider =
    NotifierProvider<FavoritesStationSettings, List<String>>.internal(
  FavoritesStationSettings.new,
  name: r'favoritesStationSettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoritesStationSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FavoritesStationSettings = Notifier<List<String>>;
String _$favoritesSkiResortSettingsHash() =>
    r'e267cf13d5da54b939713822d10626d34f24464d';

/// See also [FavoritesSkiResortSettings].
@ProviderFor(FavoritesSkiResortSettings)
final favoritesSkiResortSettingsProvider =
    NotifierProvider<FavoritesSkiResortSettings, List<int>>.internal(
  FavoritesSkiResortSettings.new,
  name: r'favoritesSkiResortSettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoritesSkiResortSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FavoritesSkiResortSettings = Notifier<List<int>>;
String _$favoritesBERASettingsHash() =>
    r'fae0e555c2ed965494d055085abe2ded4603b9f4';

/// See also [FavoritesBERASettings].
@ProviderFor(FavoritesBERASettings)
final favoritesBERASettingsProvider =
    NotifierProvider<FavoritesBERASettings, List<String>>.internal(
  FavoritesBERASettings.new,
  name: r'favoritesBERASettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoritesBERASettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FavoritesBERASettings = Notifier<List<String>>;
String _$showNoDataStationSettingsHash() =>
    r'a8bc73ea9a30a056c0d89820ba8556cd972446e3';

/// See also [ShowNoDataStationSettings].
@ProviderFor(ShowNoDataStationSettings)
final showNoDataStationSettingsProvider =
    NotifierProvider<ShowNoDataStationSettings, bool>.internal(
  ShowNoDataStationSettings.new,
  name: r'showNoDataStationSettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showNoDataStationSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowNoDataStationSettings = Notifier<bool>;
String _$showClusterLayerSettingsHash() =>
    r'd6a4cd5ea6a4babe575c094592ec120df6c66d57';

/// See also [ShowClusterLayerSettings].
@ProviderFor(ShowClusterLayerSettings)
final showClusterLayerSettingsProvider =
    NotifierProvider<ShowClusterLayerSettings, bool>.internal(
  ShowClusterLayerSettings.new,
  name: r'showClusterLayerSettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showClusterLayerSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowClusterLayerSettings = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
