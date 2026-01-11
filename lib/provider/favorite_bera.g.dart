// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_bera.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoriteBera)
final favoriteBeraProvider = FavoriteBeraProvider._();

final class FavoriteBeraProvider
    extends $NotifierProvider<FavoriteBera, List<AvalancheBulletin>> {
  FavoriteBeraProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteBeraProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteBeraHash();

  @$internal
  @override
  FavoriteBera create() => FavoriteBera();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<AvalancheBulletin> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<AvalancheBulletin>>(value),
    );
  }
}

String _$favoriteBeraHash() => r'37e84c8c8c8ede734803853429ea597c12ae63b2';

abstract class _$FavoriteBera extends $Notifier<List<AvalancheBulletin>> {
  List<AvalancheBulletin> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<List<AvalancheBulletin>, List<AvalancheBulletin>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<AvalancheBulletin>, List<AvalancheBulletin>>,
              List<AvalancheBulletin>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
