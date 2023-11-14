// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isFavoriteHash() => r'f27bfede422a682fa1c315541dffe6f7f7c009fe';

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

typedef _IsFavoriteRef = AutoDisposeProviderRef<bool>;

/// See also [_isFavorite].
@ProviderFor(_isFavorite)
const _isFavoriteProvider = _IsFavoriteFamily();

/// See also [_isFavorite].
class _IsFavoriteFamily extends Family<bool> {
  /// See also [_isFavorite].
  const _IsFavoriteFamily();

  /// See also [_isFavorite].
  _IsFavoriteProvider call(
    int id,
  ) {
    return _IsFavoriteProvider(
      id,
    );
  }

  @override
  _IsFavoriteProvider getProviderOverride(
    covariant _IsFavoriteProvider provider,
  ) {
    return call(
      provider.id,
    );
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
  _IsFavoriteProvider(
    this.id,
  ) : super.internal(
          (ref) => _isFavorite(
            ref,
            id,
          ),
          from: _isFavoriteProvider,
          name: r'_isFavoriteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isFavoriteHash,
          dependencies: _IsFavoriteFamily._dependencies,
          allTransitiveDependencies:
              _IsFavoriteFamily._allTransitiveDependencies,
        );

  final int id;

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

String _$dataListHash() => r'9b5d0c940e89b92d078311985ef34054dec91e34';

/// See also [DataList].
@ProviderFor(DataList)
final dataListProvider =
    AutoDisposeNotifierProvider<DataList, List<DataStation>>.internal(
  DataList.new,
  name: r'dataListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dataListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DataList = AutoDisposeNotifier<List<DataStation>>;
String _$currentIndexHash() => r'1337ee5127d36cb29455cd2d38c368ae860cd27e';

/// See also [_CurrentIndex].
@ProviderFor(_CurrentIndex)
final _currentIndexProvider =
    AutoDisposeNotifierProvider<_CurrentIndex, int>.internal(
  _CurrentIndex.new,
  name: r'_currentIndexProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentIndex = AutoDisposeNotifier<int>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
