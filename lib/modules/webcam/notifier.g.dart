// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SkiResorts)
final skiResortsProvider = SkiResortsProvider._();

final class SkiResortsProvider
    extends $AsyncNotifierProvider<SkiResorts, List<SkiResort>> {
  SkiResortsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'skiResortsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$skiResortsHash();

  @$internal
  @override
  SkiResorts create() => SkiResorts();
}

String _$skiResortsHash() => r'fc8cebee5ff61af002cd1fd00aa934a47f15731f';

abstract class _$SkiResorts extends $AsyncNotifier<List<SkiResort>> {
  FutureOr<List<SkiResort>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<SkiResort>>, List<SkiResort>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<SkiResort>>, List<SkiResort>>,
              AsyncValue<List<SkiResort>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
