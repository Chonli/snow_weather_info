// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_station_cache.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(franceDataStationCache)
final franceDataStationCacheProvider = FranceDataStationCacheProvider._();

final class FranceDataStationCacheProvider
    extends
        $FunctionalProvider<
          DataStationCache,
          DataStationCache,
          DataStationCache
        >
    with $Provider<DataStationCache> {
  FranceDataStationCacheProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'franceDataStationCacheProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$franceDataStationCacheHash();

  @$internal
  @override
  $ProviderElement<DataStationCache> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DataStationCache create(Ref ref) {
    return franceDataStationCache(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DataStationCache value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DataStationCache>(value),
    );
  }
}

String _$franceDataStationCacheHash() =>
    r'f40ba9bb193cee6accdb29551797b4d317a13cc3';

@ProviderFor(piemontDataStationCache)
final piemontDataStationCacheProvider = PiemontDataStationCacheProvider._();

final class PiemontDataStationCacheProvider
    extends
        $FunctionalProvider<
          DataStationCache,
          DataStationCache,
          DataStationCache
        >
    with $Provider<DataStationCache> {
  PiemontDataStationCacheProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'piemontDataStationCacheProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$piemontDataStationCacheHash();

  @$internal
  @override
  $ProviderElement<DataStationCache> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DataStationCache create(Ref ref) {
    return piemontDataStationCache(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DataStationCache value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DataStationCache>(value),
    );
  }
}

String _$piemontDataStationCacheHash() =>
    r'1016be9d62dff3a60646a9739d10d650cc5e0a38';
