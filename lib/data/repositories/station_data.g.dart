// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_data.dart';

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
          StationDataRepository,
          StationDataRepository,
          StationDataRepository
        >
    with $Provider<StationDataRepository> {
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
  $ProviderElement<StationDataRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StationDataRepository create(Ref ref) {
    return stationDataRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StationDataRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StationDataRepository>(value),
    );
  }
}

String _$stationDataRepositoryHash() =>
    r'9dc8fc3835023534d3a5c88351ff5fa4ec41f832';
