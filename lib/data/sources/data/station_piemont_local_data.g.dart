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
    r'0c2bc4b9dc9c8db811deaa3826dda28c7cb17bc6';
