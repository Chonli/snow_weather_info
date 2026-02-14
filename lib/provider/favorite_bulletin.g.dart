// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_bulletin.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoriteBulletin)
final favoriteBulletinProvider = FavoriteBulletinProvider._();

final class FavoriteBulletinProvider
    extends $NotifierProvider<FavoriteBulletin, List<AbstractBulletin>> {
  FavoriteBulletinProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteBulletinProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteBulletinHash();

  @$internal
  @override
  FavoriteBulletin create() => FavoriteBulletin();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<AbstractBulletin> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<AbstractBulletin>>(value),
    );
  }
}

String _$favoriteBulletinHash() => r'9bb1c2569814dd0358fa39a231c62e8bd4662afe';

abstract class _$FavoriteBulletin extends $Notifier<List<AbstractBulletin>> {
  List<AbstractBulletin> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<List<AbstractBulletin>, List<AbstractBulletin>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<AbstractBulletin>, List<AbstractBulletin>>,
              List<AbstractBulletin>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
