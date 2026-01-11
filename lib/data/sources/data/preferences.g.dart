// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = SharedPreferencesProvider._();

final class SharedPreferencesProvider
    extends
        $FunctionalProvider<
          SharedPreferences,
          SharedPreferences,
          SharedPreferences
        >
    with $Provider<SharedPreferences> {
  SharedPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $ProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPreferences create(Ref ref) {
    return sharedPreferences(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferences>(value),
    );
  }
}

String _$sharedPreferencesHash() => r'1a6250efdc19e86c923ceb598a77ff74d64378e6';

@ProviderFor(ThemeModeSettings)
final themeModeSettingsProvider = ThemeModeSettingsProvider._();

final class ThemeModeSettingsProvider
    extends $NotifierProvider<ThemeModeSettings, ThemeMode> {
  ThemeModeSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeModeSettingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeModeSettingsHash();

  @$internal
  @override
  ThemeModeSettings create() => ThemeModeSettings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$themeModeSettingsHash() => r'3481e26e850d3c8dc85fa2afe9b6ff9002c58144';

abstract class _$ThemeModeSettings extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeMode, ThemeMode>,
              ThemeMode,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(FavoritesStationSettings)
final favoritesStationSettingsProvider = FavoritesStationSettingsProvider._();

final class FavoritesStationSettingsProvider
    extends $NotifierProvider<FavoritesStationSettings, List<String>> {
  FavoritesStationSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesStationSettingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesStationSettingsHash();

  @$internal
  @override
  FavoritesStationSettings create() => FavoritesStationSettings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$favoritesStationSettingsHash() =>
    r'3ac1182ccb3c5324af45cb87181d2c836df5677d';

abstract class _$FavoritesStationSettings extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(FavoritesSkiResortSettings)
final favoritesSkiResortSettingsProvider =
    FavoritesSkiResortSettingsProvider._();

final class FavoritesSkiResortSettingsProvider
    extends $NotifierProvider<FavoritesSkiResortSettings, List<int>> {
  FavoritesSkiResortSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesSkiResortSettingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesSkiResortSettingsHash();

  @$internal
  @override
  FavoritesSkiResortSettings create() => FavoritesSkiResortSettings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<int>>(value),
    );
  }
}

String _$favoritesSkiResortSettingsHash() =>
    r'9dee0325bfdc6b77b6d9259b22a8f2664578753c';

abstract class _$FavoritesSkiResortSettings extends $Notifier<List<int>> {
  List<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<int>, List<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<int>, List<int>>,
              List<int>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(FavoritesBERASettings)
final favoritesBERASettingsProvider = FavoritesBERASettingsProvider._();

final class FavoritesBERASettingsProvider
    extends $NotifierProvider<FavoritesBERASettings, List<String>> {
  FavoritesBERASettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesBERASettingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesBERASettingsHash();

  @$internal
  @override
  FavoritesBERASettings create() => FavoritesBERASettings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$favoritesBERASettingsHash() =>
    r'bb1598fd624f3bea69453ecbc8d714065bc6b677';

abstract class _$FavoritesBERASettings extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ShowNoDataStationSettings)
final showNoDataStationSettingsProvider = ShowNoDataStationSettingsProvider._();

final class ShowNoDataStationSettingsProvider
    extends $NotifierProvider<ShowNoDataStationSettings, bool> {
  ShowNoDataStationSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showNoDataStationSettingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showNoDataStationSettingsHash();

  @$internal
  @override
  ShowNoDataStationSettings create() => ShowNoDataStationSettings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showNoDataStationSettingsHash() =>
    r'2507553c37504980fc948535b2b257c5f19de774';

abstract class _$ShowNoDataStationSettings extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ShowClusterLayerSettings)
final showClusterLayerSettingsProvider = ShowClusterLayerSettingsProvider._();

final class ShowClusterLayerSettingsProvider
    extends $NotifierProvider<ShowClusterLayerSettings, bool> {
  ShowClusterLayerSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showClusterLayerSettingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showClusterLayerSettingsHash();

  @$internal
  @override
  ShowClusterLayerSettings create() => ShowClusterLayerSettings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showClusterLayerSettingsHash() =>
    r'90b7b8db79e0ac783c231fff074dc22462154252';

abstract class _$ShowClusterLayerSettings extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
