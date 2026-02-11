// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(stationApi)
final stationApiProvider = StationApiProvider._();

final class StationApiProvider
    extends $FunctionalProvider<StationApi, StationApi, StationApi>
    with $Provider<StationApi> {
  StationApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stationApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stationApiHash();

  @$internal
  @override
  $ProviderElement<StationApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StationApi create(Ref ref) {
    return stationApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StationApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StationApi>(value),
    );
  }
}

String _$stationApiHash() => r'd3638c28b45f015329ddfa86ca72cba5f805f52a';
