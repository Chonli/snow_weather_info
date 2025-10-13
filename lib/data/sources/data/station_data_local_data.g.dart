// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_data_local_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(stationDataLocalData)
const stationDataLocalDataProvider = StationDataLocalDataProvider._();

final class StationDataLocalDataProvider
    extends
        $FunctionalProvider<
          StationDataLocalDataContainer,
          StationDataLocalDataContainer,
          StationDataLocalDataContainer
        >
    with $Provider<StationDataLocalDataContainer> {
  const StationDataLocalDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stationDataLocalDataProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stationDataLocalDataHash();

  @$internal
  @override
  $ProviderElement<StationDataLocalDataContainer> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StationDataLocalDataContainer create(Ref ref) {
    return stationDataLocalData(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StationDataLocalDataContainer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StationDataLocalDataContainer>(
        value,
      ),
    );
  }
}

String _$stationDataLocalDataHash() =>
    r'95731e0f518c389a54ccc1d8356b2bb1c876e188';
