// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentDataStationHash() =>
    r'8030f6f30ebb0b4de5b64599e07ba630fc438e75';

/// See also [currentDataStation].
@ProviderFor(currentDataStation)
final currentDataStationProvider =
    AutoDisposeProvider<List<DataStation>>.internal(
      currentDataStation,
      name: r'currentDataStationProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$currentDataStationHash,
      dependencies: const <ProviderOrFamily>[],
      allTransitiveDependencies: const <ProviderOrFamily>{},
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentDataStationRef = AutoDisposeProviderRef<List<DataStation>>;
String _$currentStationHash() => r'd60a58973507c5e6eecabb2310e673c38166b922';

/// See also [currentStation].
@ProviderFor(currentStation)
final currentStationProvider = AutoDisposeProvider<Station>.internal(
  currentStation,
  name: r'currentStationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentStationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentStationRef = AutoDisposeProviderRef<Station>;
String _$isFavoriteHash() => r'687055a698fb459c7e3b0ee4cb430e33f0ef41dc';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [_isFavorite].
@ProviderFor(_isFavorite)
const _isFavoriteProvider = _IsFavoriteFamily();

/// See also [_isFavorite].
class _IsFavoriteFamily extends Family<bool> {
  /// See also [_isFavorite].
  const _IsFavoriteFamily();

  /// See also [_isFavorite].
  _IsFavoriteProvider call(int id) {
    return _IsFavoriteProvider(id);
  }

  @override
  _IsFavoriteProvider getProviderOverride(
    covariant _IsFavoriteProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'_isFavoriteProvider';
}

/// See also [_isFavorite].
class _IsFavoriteProvider extends AutoDisposeProvider<bool> {
  /// See also [_isFavorite].
  _IsFavoriteProvider(int id)
    : this._internal(
        (ref) => _isFavorite(ref as _IsFavoriteRef, id),
        from: _isFavoriteProvider,
        name: r'_isFavoriteProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$isFavoriteHash,
        dependencies: _IsFavoriteFamily._dependencies,
        allTransitiveDependencies: _IsFavoriteFamily._allTransitiveDependencies,
        id: id,
      );

  _IsFavoriteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(bool Function(_IsFavoriteRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: _IsFavoriteProvider._internal(
        (ref) => create(ref as _IsFavoriteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<bool> createElement() {
    return _IsFavoriteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _IsFavoriteProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin _IsFavoriteRef on AutoDisposeProviderRef<bool> {
  /// The parameter `id` of this provider.
  int get id;
}

class _IsFavoriteProviderElement extends AutoDisposeProviderElement<bool>
    with _IsFavoriteRef {
  _IsFavoriteProviderElement(super.provider);

  @override
  int get id => (origin as _IsFavoriteProvider).id;
}

String _$currentIndexHash() => r'6e74376bced0377c27a8aa641601ddf61c2fc918';

/// See also [_CurrentIndex].
@ProviderFor(_CurrentIndex)
final _currentIndexProvider =
    AutoDisposeNotifierProvider<_CurrentIndex, int>.internal(
      _CurrentIndex.new,
      name: r'_currentIndexProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$currentIndexHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CurrentIndex = AutoDisposeNotifier<int>;
String _$currentIndexDataHash() => r'cdbf1535bea2a08c23e75353e4338e4b9bcb87f5';

/// See also [_CurrentIndexData].
@ProviderFor(_CurrentIndexData)
final _currentIndexDataProvider =
    AutoDisposeNotifierProvider<_CurrentIndexData, DataStation?>.internal(
      _CurrentIndexData.new,
      name: r'_currentIndexDataProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$currentIndexDataHash,
      dependencies: <ProviderOrFamily>[currentDataStationProvider],
      allTransitiveDependencies: <ProviderOrFamily>{
        currentDataStationProvider,
        ...?currentDataStationProvider.allTransitiveDependencies,
      },
    );

typedef _$CurrentIndexData = AutoDisposeNotifier<DataStation?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
