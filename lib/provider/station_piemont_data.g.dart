// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_piemont_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StationPiemontData)
final stationPiemontDataProvider = StationPiemontDataProvider._();

final class StationPiemontDataProvider
    extends
        $AsyncNotifierProvider<
          StationPiemontData,
          Map<String, List<DataStation>>
        > {
  StationPiemontDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stationPiemontDataProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stationPiemontDataHash();

  @$internal
  @override
  StationPiemontData create() => StationPiemontData();
}

String _$stationPiemontDataHash() =>
    r'533aee1e57422326b881759856b6072a342e4404';

abstract class _$StationPiemontData
    extends $AsyncNotifier<Map<String, List<DataStation>>> {
  FutureOr<Map<String, List<DataStation>>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Map<String, List<DataStation>>>,
              Map<String, List<DataStation>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, List<DataStation>>>,
                Map<String, List<DataStation>>
              >,
              AsyncValue<Map<String, List<DataStation>>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
