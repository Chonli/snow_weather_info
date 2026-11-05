// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_piemont_local_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(stationPiemontLocalData)
final stationPiemontLocalDataProvider = StationPiemontLocalDataProvider._();

final class StationPiemontLocalDataProvider
    extends
        $FunctionalProvider<
          StationPiemontLocalDataContainer,
          StationPiemontLocalDataContainer,
          StationPiemontLocalDataContainer
        >
    with $Provider<StationPiemontLocalDataContainer> {
  StationPiemontLocalDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stationPiemontLocalDataProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stationPiemontLocalDataHash();

  @$internal
  @override
  $ProviderElement<StationPiemontLocalDataContainer> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StationPiemontLocalDataContainer create(Ref ref) {
    return stationPiemontLocalData(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StationPiemontLocalDataContainer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StationPiemontLocalDataContainer>(
        value,
      ),
    );
  }
}

String _$stationPiemontLocalDataHash() =>
    r'93aa04470e18eb4561c88e4e2fd73221eee53e86';
