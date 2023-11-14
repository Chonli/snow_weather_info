// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nivose_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isFavoriteHash() => r'91cd1d0f5a487a4282f20f07f4456d720409dc4b';

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
    this.codeMF,
  ) : super.internal(
          (ref) => _isFavorite(
            ref,
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
        );

  final String codeMF;

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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
