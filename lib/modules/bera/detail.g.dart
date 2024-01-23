// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pdfControllerHash() => r'd44e0853f31b71f120ff19c2c98d963746a798fc';

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

/// See also [_pdfController].
@ProviderFor(_pdfController)
const _pdfControllerProvider = _PdfControllerFamily();

/// See also [_pdfController].
class _PdfControllerFamily extends Family<AsyncValue<PdfController?>> {
  /// See also [_pdfController].
  const _PdfControllerFamily();

  /// See also [_pdfController].
  _PdfControllerProvider call(
    int beraNumber,
  ) {
    return _PdfControllerProvider(
      beraNumber,
    );
  }

  @override
  _PdfControllerProvider getProviderOverride(
    covariant _PdfControllerProvider provider,
  ) {
    return call(
      provider.beraNumber,
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
  String? get name => r'_pdfControllerProvider';
}

/// See also [_pdfController].
class _PdfControllerProvider extends AutoDisposeFutureProvider<PdfController?> {
  /// See also [_pdfController].
  _PdfControllerProvider(
    int beraNumber,
  ) : this._internal(
          (ref) => _pdfController(
            ref as _PdfControllerRef,
            beraNumber,
          ),
          from: _pdfControllerProvider,
          name: r'_pdfControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pdfControllerHash,
          dependencies: _PdfControllerFamily._dependencies,
          allTransitiveDependencies:
              _PdfControllerFamily._allTransitiveDependencies,
          beraNumber: beraNumber,
        );

  _PdfControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.beraNumber,
  }) : super.internal();

  final int beraNumber;

  @override
  Override overrideWith(
    FutureOr<PdfController?> Function(_PdfControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _PdfControllerProvider._internal(
        (ref) => create(ref as _PdfControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        beraNumber: beraNumber,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PdfController?> createElement() {
    return _PdfControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _PdfControllerProvider && other.beraNumber == beraNumber;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, beraNumber.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _PdfControllerRef on AutoDisposeFutureProviderRef<PdfController?> {
  /// The parameter `beraNumber` of this provider.
  int get beraNumber;
}

class _PdfControllerProviderElement
    extends AutoDisposeFutureProviderElement<PdfController?>
    with _PdfControllerRef {
  _PdfControllerProviderElement(super.provider);

  @override
  int get beraNumber => (origin as _PdfControllerProvider).beraNumber;
}

String _$beraTokenHeaderHash() => r'0bbe438278a0b8d7c53812ad2a6373dff7ac4f30';

/// See also [_BeraTokenHeader].
@ProviderFor(_BeraTokenHeader)
final _beraTokenHeaderProvider =
    NotifierProvider<_BeraTokenHeader, Map<String, String>>.internal(
  _BeraTokenHeader.new,
  name: r'_beraTokenHeaderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$beraTokenHeaderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BeraTokenHeader = Notifier<Map<String, String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
