// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_piemont.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(stationPiemontRepository)
final stationPiemontRepositoryProvider = StationPiemontRepositoryProvider._();

final class StationPiemontRepositoryProvider
    extends
        $FunctionalProvider<
          StationPiemontRepository,
          StationPiemontRepository,
          StationPiemontRepository
        >
    with $Provider<StationPiemontRepository> {
  StationPiemontRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stationPiemontRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stationPiemontRepositoryHash();

  @$internal
  @override
  $ProviderElement<StationPiemontRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StationPiemontRepository create(Ref ref) {
    return stationPiemontRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StationPiemontRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StationPiemontRepository>(value),
    );
  }
}

String _$stationPiemontRepositoryHash() =>
    r'd7aee59c6d5d817e7c9960bc625a9e5457189644';
