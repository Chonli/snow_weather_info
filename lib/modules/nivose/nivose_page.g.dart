// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nivose_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isFavoriteHash() => r'640e830f46ed2b550d16bf1aec74eae6d8d05a83';

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
  _IsFavoriteProvider call(
    String codeMF,
  ) {
    return _IsFavoriteProvider(
      codeMF,
    );
  }

  @override
  _IsFavoriteProvider getProviderOverride(
    covariant _IsFavoriteProvider provider,
  ) {
    return call(
      provider.codeMF,
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
    String codeMF,
  ) : this._internal(
          (ref) => _isFavorite(
            ref as _IsFavoriteRef,
            codeMF,
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
          codeMF: codeMF,
        );

  _IsFavoriteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.codeMF,
  }) : super.internal();

  final String codeMF;

  @override
  Override overrideWith(
    bool Function(_IsFavoriteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _IsFavoriteProvider._internal(
        (ref) => create(ref as _IsFavoriteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        codeMF: codeMF,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<bool> createElement() {
    return _IsFavoriteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _IsFavoriteProvider && other.codeMF == codeMF;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, codeMF.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _IsFavoriteRef on AutoDisposeProviderRef<bool> {
  /// The parameter `codeMF` of this provider.
  String get codeMF;
}

class _IsFavoriteProviderElement extends AutoDisposeProviderElement<bool>
    with _IsFavoriteRef {
  _IsFavoriteProviderElement(super.provider);

  @override
  String get codeMF => (origin as _IsFavoriteProvider).codeMF;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
