// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_piemont_stations.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PiemontStations)
final piemontStationsProvider = PiemontStationsProvider._();

final class PiemontStationsProvider
    extends $AsyncNotifierProvider<PiemontStations, List<StationPiemont>> {
  PiemontStationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'piemontStationsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$piemontStationsHash();

  @$internal
  @override
  PiemontStations create() => PiemontStations();
}

String _$piemontStationsHash() => r'b76c03356dd986df921e189a0eac1238ebd0c91d';

abstract class _$PiemontStations extends $AsyncNotifier<List<StationPiemont>> {
  FutureOr<List<StationPiemont>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
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
    return element.handleCreate(ref, build);
  }
}
