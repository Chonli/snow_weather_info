// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_piemont_api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(stationPiemontApi)
final stationPiemontApiProvider = StationPiemontApiProvider._();

final class StationPiemontApiProvider
    extends
        $FunctionalProvider<
          StationPiemontApi,
          StationPiemontApi,
          StationPiemontApi
        >
    with $Provider<StationPiemontApi> {
  StationPiemontApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stationPiemontApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stationPiemontApiHash();

  @$internal
  @override
  $ProviderElement<StationPiemontApi> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StationPiemontApi create(Ref ref) {
    return stationPiemontApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StationPiemontApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StationPiemontApi>(value),
    );
  }
}

String _$stationPiemontApiHash() => r'96debc3d33e6a71f9647a2f923373a65d0489c6b';
