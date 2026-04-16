// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_piemont_stations.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StationPiemontStations)
final stationPiemontStationsProvider = StationPiemontStationsProvider._();

final class StationPiemontStationsProvider
    extends
        $AsyncNotifierProvider<StationPiemontStations, List<StationPiemont>> {
  StationPiemontStationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stationPiemontStationsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stationPiemontStationsHash();

  @$internal
  @override
  StationPiemontStations create() => StationPiemontStations();
}

String _$stationPiemontStationsHash() =>
    r'9327116f19e486e3e8e51354ac76a284fda5cf3f';

abstract class _$StationPiemontStations
    extends $AsyncNotifier<List<StationPiemont>> {
  FutureOr<List<StationPiemont>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<StationPiemont>>, List<StationPiemont>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<StationPiemont>>,
                List<StationPiemont>
              >,
              AsyncValue<List<StationPiemont>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
