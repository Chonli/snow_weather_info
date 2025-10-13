// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoriteSkiResort)
const favoriteSkiResortProvider = FavoriteSkiResortProvider._();

final class FavoriteSkiResortProvider
    extends $AsyncNotifierProvider<FavoriteSkiResort, List<SkiResort>> {
  const FavoriteSkiResortProvider._()
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

String _$favoriteSkiResortHash() => r'bb57921b951ea1312a39ecdb2d169bf1af74307f';

abstract class _$FavoriteSkiResort extends $AsyncNotifier<List<SkiResort>> {
  FutureOr<List<SkiResort>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<SkiResort>>, List<SkiResort>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<SkiResort>>, List<SkiResort>>,
              AsyncValue<List<SkiResort>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
