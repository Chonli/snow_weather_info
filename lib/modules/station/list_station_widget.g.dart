// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_station_widget.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_Search)
const _searchProvider = _SearchProvider._();

final class _SearchProvider extends $NotifierProvider<_Search, String> {
  const _SearchProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_searchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_searchHash();

  @$internal
  @override
  _Search create() => _Search();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$_searchHash() => r'61226d45460befcf6e68d1c49a0bef7181a7ab19';

abstract class _$Search extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(_FilteredStations)
const _filteredStationsProvider = _FilteredStationsProvider._();

final class _FilteredStationsProvider
    extends
        $NotifierProvider<
          _FilteredStations,
          Map<String, List<AbstractStation>>
        > {
  const _FilteredStationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_filteredStationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_filteredStationsHash();

  @$internal
  @override
  _FilteredStations create() => _FilteredStations();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, List<AbstractStation>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, List<AbstractStation>>>(
        value,
      ),
    );
  }
}

String _$_filteredStationsHash() => r'62f91c5ff8cda5ddf9a4919213706e4e3e4c2cb4';

abstract class _$FilteredStations
    extends $Notifier<Map<String, List<AbstractStation>>> {
  Map<String, List<AbstractStation>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Map<String, List<AbstractStation>>,
              Map<String, List<AbstractStation>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Map<String, List<AbstractStation>>,
                Map<String, List<AbstractStation>>
              >,
              Map<String, List<AbstractStation>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
