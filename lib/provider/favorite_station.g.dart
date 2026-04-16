// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_station.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoriteStation)
final favoriteStationProvider = FavoriteStationProvider._();

final class FavoriteStationProvider
    extends $AsyncNotifierProvider<FavoriteStation, List<AbstractStation>> {
  FavoriteStationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteStationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteStationHash();

  @$internal
  @override
  FavoriteStation create() => FavoriteStation();
}

String _$favoriteStationHash() => r'3582a495fc6440aa45874917e96eb572f0d178c0';

abstract class _$FavoriteStation extends $AsyncNotifier<List<AbstractStation>> {
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
