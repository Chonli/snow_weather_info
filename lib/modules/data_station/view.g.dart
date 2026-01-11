// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(currentDataStation)
final currentDataStationProvider = CurrentDataStationProvider._();

final class CurrentDataStationProvider
    extends
        $FunctionalProvider<
          List<DataStation>,
          List<DataStation>,
          List<DataStation>
        >
    with $Provider<List<DataStation>> {
  CurrentDataStationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentDataStationProvider',
        isAutoDispose: true,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$currentDataStationHash();

  @$internal
  @override
  $ProviderElement<List<DataStation>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<DataStation> create(Ref ref) {
    return currentDataStation(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DataStation> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DataStation>>(value),
    );
  }
}

String _$currentDataStationHash() =>
    r'8030f6f30ebb0b4de5b64599e07ba630fc438e75';

@ProviderFor(currentStation)
final currentStationProvider = CurrentStationProvider._();

final class CurrentStationProvider
    extends $FunctionalProvider<Station, Station, Station>
    with $Provider<Station> {
  CurrentStationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentStationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentStationHash();

  @$internal
  @override
  $ProviderElement<Station> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Station create(Ref ref) {
    return currentStation(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Station value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Station>(value),
    );
  }
}

String _$currentStationHash() => r'd60a58973507c5e6eecabb2310e673c38166b922';

@ProviderFor(_CurrentIndex)
final _currentIndexProvider = _CurrentIndexProvider._();

final class _CurrentIndexProvider
    extends $NotifierProvider<_CurrentIndex, int> {
  _CurrentIndexProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_currentIndexProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_currentIndexHash();

  @$internal
  @override
  _CurrentIndex create() => _CurrentIndex();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$_currentIndexHash() => r'6e74376bced0377c27a8aa641601ddf61c2fc918';

abstract class _$CurrentIndex extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(_CurrentIndexData)
final _currentIndexDataProvider = _CurrentIndexDataProvider._();

final class _CurrentIndexDataProvider
    extends $NotifierProvider<_CurrentIndexData, DataStation?> {
  _CurrentIndexDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_currentIndexDataProvider',
        isAutoDispose: true,
        dependencies: <ProviderOrFamily>[currentDataStationProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          _CurrentIndexDataProvider.$allTransitiveDependencies0,
        ],
      );

  static final $allTransitiveDependencies0 = currentDataStationProvider;

  @override
  String debugGetCreateSourceHash() => _$_currentIndexDataHash();

  @$internal
  @override
  _CurrentIndexData create() => _CurrentIndexData();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DataStation? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DataStation?>(value),
    );
  }
}

String _$_currentIndexDataHash() => r'cdbf1535bea2a08c23e75353e4338e4b9bcb87f5';

abstract class _$CurrentIndexData extends $Notifier<DataStation?> {
  DataStation? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DataStation?, DataStation?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DataStation?, DataStation?>,
              DataStation?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(_isFavorite)
final _isFavoriteProvider = _IsFavoriteFamily._();

final class _IsFavoriteProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  _IsFavoriteProvider._({
    required _IsFavoriteFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'_isFavoriteProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$_isFavoriteHash();

  @override
  String toString() {
    return r'_isFavoriteProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as int;
    return _isFavorite(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _IsFavoriteProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$_isFavoriteHash() => r'687055a698fb459c7e3b0ee4cb430e33f0ef41dc';

final class _IsFavoriteFamily extends $Family
    with $FunctionalFamilyOverride<bool, int> {
  _IsFavoriteFamily._()
    : super(
        retry: null,
        name: r'_isFavoriteProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  _IsFavoriteProvider call(int id) =>
      _IsFavoriteProvider._(argument: id, from: this);

  @override
  String toString() => r'_isFavoriteProvider';
}
