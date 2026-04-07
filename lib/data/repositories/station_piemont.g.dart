// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_piemont.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(stationDataRepository)
final stationDataRepositoryProvider = StationDataRepositoryProvider._();

final class StationDataRepositoryProvider
    extends
        $FunctionalProvider<
          StationPiemontRepository,
          StationPiemontRepository,
          StationPiemontRepository
        >
    with $Provider<StationPiemontRepository> {
  StationDataRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stationDataRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stationDataRepositoryHash();

  @$internal
  @override
  $ProviderElement<StationPiemontRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StationPiemontRepository create(Ref ref) {
    return stationDataRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StationPiemontRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StationPiemontRepository>(value),
    );
  }
}

String _$stationDataRepositoryHash() =>
    r'54ccf7a2117422c744558d0162d7f190c4621eec';
