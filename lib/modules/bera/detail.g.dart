// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_BeraTokenHeader)
const _beraTokenHeaderProvider = _BeraTokenHeaderProvider._();

final class _BeraTokenHeaderProvider
    extends $NotifierProvider<_BeraTokenHeader, Map<String, String>> {
  const _BeraTokenHeaderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_beraTokenHeaderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_beraTokenHeaderHash();

  @$internal
  @override
  _BeraTokenHeader create() => _BeraTokenHeader();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, String>>(value),
    );
  }
}

String _$_beraTokenHeaderHash() => r'858a0056d13e03936bf0452b5b622e7f140dd5a3';

abstract class _$BeraTokenHeader extends $Notifier<Map<String, String>> {
  Map<String, String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Map<String, String>, Map<String, String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, String>, Map<String, String>>,
              Map<String, String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(_pdfController)
const _pdfControllerProvider = _PdfControllerFamily._();

final class _PdfControllerProvider
    extends
        $FunctionalProvider<
          AsyncValue<PdfController?>,
          PdfController?,
          FutureOr<PdfController?>
        >
    with $FutureModifier<PdfController?>, $FutureProvider<PdfController?> {
  const _PdfControllerProvider._({
    required _PdfControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'_pdfControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$_pdfControllerHash();

  @override
  String toString() {
    return r'_pdfControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<PdfController?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PdfController?> create(Ref ref) {
    final argument = this.argument as int;
    return _pdfController(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is _PdfControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$_pdfControllerHash() => r'5edcfd1e2d6806a2cf0e5755aea8989ed1b4aa9c';

final class _PdfControllerFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<PdfController?>, int> {
  const _PdfControllerFamily._()
    : super(
        retry: null,
        name: r'_pdfControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  _PdfControllerProvider call(int beraNumber) =>
      _PdfControllerProvider._(argument: beraNumber, from: this);

  @override
  String toString() => r'_pdfControllerProvider';
}
