// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoriteSkiResort)
final favoriteSkiResortProvider = FavoriteSkiResortProvider._();

final class FavoriteSkiResortProvider
    extends $AsyncNotifierProvider<FavoriteSkiResort, List<SkiResort>> {
  FavoriteSkiResortProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteSkiResortProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteSkiResortHash();

  @$internal
  @override
  FavoriteSkiResort create() => FavoriteSkiResort();
}

String _$favoriteSkiResortHash() => r'f918743054196436f47f4e19ff9cff9c2adc9e1b';

abstract class _$FavoriteSkiResort extends $AsyncNotifier<List<SkiResort>> {
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
