// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_bera.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_BeraTokenHeader)
final _beraTokenHeaderProvider = _BeraTokenHeaderProvider._();

final class _BeraTokenHeaderProvider
    extends $NotifierProvider<_BeraTokenHeader, Map<String, String>> {
  _BeraTokenHeaderProvider._()
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

String _$_beraTokenHeaderHash() => r'8e63649a042e05a2751971d63930d3d9678c3099';

abstract class _$BeraTokenHeader extends $Notifier<Map<String, String>> {
  Map<String, String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Map<String, String>, Map<String, String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, String>, Map<String, String>>,
              Map<String, String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(_PdfController)
final _pdfControllerProvider = _PdfControllerFamily._();

final class _PdfControllerProvider
    extends $AsyncNotifierProvider<_PdfController, PdfController?> {
  _PdfControllerProvider._({
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
  _PdfController create() => _PdfController();

  @override
  bool operator ==(Object other) {
    return other is _PdfControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$_pdfControllerHash() => r'1d12604251b5679d0f04dfe60f06d2508cd95619';

final class _PdfControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          _PdfController,
          AsyncValue<PdfController?>,
          PdfController?,
          FutureOr<PdfController?>,
          int
        > {
  _PdfControllerFamily._()
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

abstract class _$PdfController extends $AsyncNotifier<PdfController?> {
  late final _$args = ref.$arg as int;
  int get beraNumber => _$args;

  FutureOr<PdfController?> build(int beraNumber);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<PdfController?>, PdfController?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PdfController?>, PdfController?>,
              AsyncValue<PdfController?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
