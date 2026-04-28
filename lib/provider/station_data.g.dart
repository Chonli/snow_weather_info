// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StationData)
final stationDataProvider = StationDataProvider._();

final class StationDataProvider
    extends
        $AsyncNotifierProvider<StationData, Map<String, List<DataStation>>> {
  StationDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stationDataProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stationDataHash();

  @$internal
  @override
  StationData create() => StationData();
}

String _$stationDataHash() => r'efe09d61fcf2bdf897be8ea2d3ff1ab62bdfa8b7';

abstract class _$StationData
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
