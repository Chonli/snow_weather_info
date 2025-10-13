// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_data_api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(stationDataApi)
const stationDataApiProvider = StationDataApiProvider._();

final class StationDataApiProvider
    extends $FunctionalProvider<StationDataApi, StationDataApi, StationDataApi>
    with $Provider<StationDataApi> {
  const StationDataApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stationDataApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stationDataApiHash();

  @$internal
  @override
  $ProviderElement<StationDataApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StationDataApi create(Ref ref) {
    return stationDataApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StationDataApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StationDataApi>(value),
    );
  }
}

String _$stationDataApiHash() => r'2ab5247bed0040beee7e5bbef4c19b8f30987e6a';
