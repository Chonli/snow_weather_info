// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_piemont_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(stationPiemontDataRepository)
final stationPiemontDataRepositoryProvider =
    StationPiemontDataRepositoryProvider._();

final class StationPiemontDataRepositoryProvider
    extends
        $FunctionalProvider<
          StationPiemontDataRepository,
          StationPiemontDataRepository,
          StationPiemontDataRepository
        >
    with $Provider<StationPiemontDataRepository> {
  StationPiemontDataRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stationPiemontDataRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stationPiemontDataRepositoryHash();

  @$internal
  @override
  $ProviderElement<StationPiemontDataRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StationPiemontDataRepository create(Ref ref) {
    return stationPiemontDataRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StationPiemontDataRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StationPiemontDataRepository>(value),
    );
  }
}

String _$stationPiemontDataRepositoryHash() =>
    r'5f53203128aa49ca3a143da3995a64b7740af885';
