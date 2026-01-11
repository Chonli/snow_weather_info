// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_local_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(stationLocalData)
final stationLocalDataProvider = StationLocalDataProvider._();

final class StationLocalDataProvider
    extends
        $FunctionalProvider<
          StationLocalDataContainer,
          StationLocalDataContainer,
          StationLocalDataContainer
        >
    with $Provider<StationLocalDataContainer> {
  StationLocalDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stationLocalDataProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stationLocalDataHash();

  @$internal
  @override
  $ProviderElement<StationLocalDataContainer> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StationLocalDataContainer create(Ref ref) {
    return stationLocalData(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StationLocalDataContainer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StationLocalDataContainer>(value),
    );
  }
}

String _$stationLocalDataHash() => r'7448a16b454f75679983de968add781eca7bdd42';
