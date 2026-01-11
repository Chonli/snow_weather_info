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
    extends $AsyncNotifierProvider<StationData, Map<int, List<DataStation>>> {
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

String _$stationDataHash() => r'd799da9a60391c322ea2c2824da5ff8369810e6b';

abstract class _$StationData
    extends $AsyncNotifier<Map<int, List<DataStation>>> {
  FutureOr<Map<int, List<DataStation>>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Map<int, List<DataStation>>>,
              Map<int, List<DataStation>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<int, List<DataStation>>>,
                Map<int, List<DataStation>>
              >,
              AsyncValue<Map<int, List<DataStation>>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
