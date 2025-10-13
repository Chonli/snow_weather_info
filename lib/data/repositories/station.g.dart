// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(stationRepository)
const stationRepositoryProvider = StationRepositoryProvider._();

final class StationRepositoryProvider
    extends
        $FunctionalProvider<
          StationRepository,
          StationRepository,
          StationRepository
        >
    with $Provider<StationRepository> {
  const StationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stationRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stationRepositoryHash();

  @$internal
  @override
  $ProviderElement<StationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StationRepository create(Ref ref) {
    return stationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StationRepository>(value),
    );
  }
}

String _$stationRepositoryHash() => r'827dc02733cdf22479010c953b53053ffc2bcd91';
