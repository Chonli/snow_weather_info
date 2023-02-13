// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$preferencesHash() => r'b15baf65e36214206e4e6fa804a1c8f5f83dda78';

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

typedef PreferencesRef = ProviderRef<Preferences>;

/// See also [preferences].
@ProviderFor(preferences)
const preferencesProvider = PreferencesFamily();

/// See also [preferences].
class PreferencesFamily extends Family<Preferences> {
  /// See also [preferences].
  const PreferencesFamily();

  /// See also [preferences].
  PreferencesProvider call(
    SharedPreferences pref,
  ) {
    return PreferencesProvider(
      pref,
    );
  }

  @override
  PreferencesProvider getProviderOverride(
    covariant PreferencesProvider provider,
  ) {
    return call(
      provider.pref,
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
  String? get name => r'preferencesProvider';
}

/// See also [preferences].
class PreferencesProvider extends Provider<Preferences> {
  /// See also [preferences].
  PreferencesProvider(
    this.pref,
  ) : super.internal(
          (ref) => preferences(
            ref,
            pref,
          ),
          from: preferencesProvider,
          name: r'preferencesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$preferencesHash,
          dependencies: PreferencesFamily._dependencies,
          allTransitiveDependencies:
              PreferencesFamily._allTransitiveDependencies,
        );

  final SharedPreferences pref;

  @override
  bool operator ==(Object other) {
    return other is PreferencesProvider && other.pref == pref;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pref.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
