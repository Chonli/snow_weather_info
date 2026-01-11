// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_station.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AllStations)
final allStationsProvider = AllStationsProvider._();

final class AllStationsProvider
    extends $AsyncNotifierProvider<AllStations, List<AbstractStation>> {
  AllStationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allStationsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allStationsHash();

  @$internal
  @override
  AllStations create() => AllStations();
}

String _$allStationsHash() => r'e49bd7fd10e614f907451c49d802a4495b1db51a';

abstract class _$AllStations extends $AsyncNotifier<List<AbstractStation>> {
  FutureOr<List<AbstractStation>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<AbstractStation>>, List<AbstractStation>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<AbstractStation>>,
                List<AbstractStation>
              >,
              AsyncValue<List<AbstractStation>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
