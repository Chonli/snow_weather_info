// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_piemont_data_api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(stationPiemontDataApi)
final stationPiemontDataApiProvider = StationPiemontDataApiProvider._();

final class StationPiemontDataApiProvider
    extends
        $FunctionalProvider<
          StationPiemontDataApi,
          StationPiemontDataApi,
          StationPiemontDataApi
        >
    with $Provider<StationPiemontDataApi> {
  StationPiemontDataApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stationPiemontDataApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stationPiemontDataApiHash();

  @$internal
  @override
  $ProviderElement<StationPiemontDataApi> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StationPiemontDataApi create(Ref ref) {
    return stationPiemontDataApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StationPiemontDataApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StationPiemontDataApi>(value),
    );
  }
}

String _$stationPiemontDataApiHash() =>
    r'd4b3fc6dc472500c9afbc38be456d38184d28e9b';
