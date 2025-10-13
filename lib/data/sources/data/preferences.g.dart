// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sharedPreferences)
const sharedPreferencesProvider = SharedPreferencesProvider._();

final class SharedPreferencesProvider
    extends
        $FunctionalProvider<
          SharedPreferences,
          SharedPreferences,
          SharedPreferences
        >
    with $Provider<SharedPreferences> {
  const SharedPreferencesProvider._()
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
const themeModeSettingsProvider = ThemeModeSettingsProvider._();

final class ThemeModeSettingsProvider
    extends $NotifierProvider<ThemeModeSettings, ThemeMode> {
  const ThemeModeSettingsProvider._()
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

String _$themeModeSettingsHash() => r'106550861a9acf66c527c4f3f77fe9c7c850ac47';

abstract class _$ThemeModeSettings extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeMode, ThemeMode>,
              ThemeMode,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(FavoritesStationSettings)
const favoritesStationSettingsProvider = FavoritesStationSettingsProvider._();

final class FavoritesStationSettingsProvider
    extends $NotifierProvider<FavoritesStationSettings, List<String>> {
  const FavoritesStationSettingsProvider._()
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
    r'1558bd39ac145e4dad63815a1427b95068c6c379';

abstract class _$FavoritesStationSettings extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(FavoritesSkiResortSettings)
const favoritesSkiResortSettingsProvider =
    FavoritesSkiResortSettingsProvider._();

final class FavoritesSkiResortSettingsProvider
    extends $NotifierProvider<FavoritesSkiResortSettings, List<int>> {
  const FavoritesSkiResortSettingsProvider._()
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
    r'e267cf13d5da54b939713822d10626d34f24464d';

abstract class _$FavoritesSkiResortSettings extends $Notifier<List<int>> {
  List<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<int>, List<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<int>, List<int>>,
              List<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(FavoritesBERASettings)
const favoritesBERASettingsProvider = FavoritesBERASettingsProvider._();

final class FavoritesBERASettingsProvider
    extends $NotifierProvider<FavoritesBERASettings, List<String>> {
  const FavoritesBERASettingsProvider._()
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
    r'fae0e555c2ed965494d055085abe2ded4603b9f4';

abstract class _$FavoritesBERASettings extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ShowNoDataStationSettings)
const showNoDataStationSettingsProvider = ShowNoDataStationSettingsProvider._();

final class ShowNoDataStationSettingsProvider
    extends $NotifierProvider<ShowNoDataStationSettings, bool> {
  const ShowNoDataStationSettingsProvider._()
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
    r'a8bc73ea9a30a056c0d89820ba8556cd972446e3';

abstract class _$ShowNoDataStationSettings extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ShowClusterLayerSettings)
const showClusterLayerSettingsProvider = ShowClusterLayerSettingsProvider._();

final class ShowClusterLayerSettingsProvider
    extends $NotifierProvider<ShowClusterLayerSettings, bool> {
  const ShowClusterLayerSettingsProvider._()
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
    r'd6a4cd5ea6a4babe575c094592ec120df6c66d57';

abstract class _$ShowClusterLayerSettings extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
