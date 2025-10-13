// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stations.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Stations)
const stationsProvider = StationsProvider._();

final class StationsProvider
    extends $AsyncNotifierProvider<Stations, List<Station>> {
  const StationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stationsHash();

  @$internal
  @override
  Stations create() => Stations();
}

String _$stationsHash() => r'8d71c98a5ae220120b8b1d48a87c14bfb6a55459';

abstract class _$Stations extends $AsyncNotifier<List<Station>> {
  FutureOr<List<Station>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Station>>, List<Station>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Station>>, List<Station>>,
              AsyncValue<List<Station>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
