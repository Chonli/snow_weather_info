// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_widget.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrentMapLoc)
final currentMapLocProvider = CurrentMapLocProvider._();

final class CurrentMapLocProvider
    extends $NotifierProvider<CurrentMapLoc, Coordinate> {
  CurrentMapLocProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentMapLocProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentMapLocHash();

  @$internal
  @override
  CurrentMapLoc create() => CurrentMapLoc();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Coordinate value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Coordinate>(value),
    );
  }
}

String _$currentMapLocHash() => r'd1554a09c91bf0d51437d829b641c3dff5398579';

abstract class _$CurrentMapLoc extends $Notifier<Coordinate> {
  Coordinate build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Coordinate, Coordinate>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Coordinate, Coordinate>,
              Coordinate,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
