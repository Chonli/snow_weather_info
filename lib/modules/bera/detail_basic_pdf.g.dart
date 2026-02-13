// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_basic_pdf.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_PdfController)
final _pdfControllerProvider = _PdfControllerFamily._();

final class _PdfControllerProvider
    extends $AsyncNotifierProvider<_PdfController, PdfController?> {
  _PdfControllerProvider._({
    required _PdfControllerFamily super.from,
    required AvalancheBulletinPdf super.argument,
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

String _$_pdfControllerHash() => r'8a3ef2e3f881d79c0f66034bea8447ee11ccb735';

final class _PdfControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          _PdfController,
          AsyncValue<PdfController?>,
          PdfController?,
          FutureOr<PdfController?>,
          AvalancheBulletinPdf
        > {
  _PdfControllerFamily._()
    : super(
        retry: null,
        name: r'_pdfControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  _PdfControllerProvider call(AvalancheBulletinPdf avalancheBulletinPdf) =>
      _PdfControllerProvider._(argument: avalancheBulletinPdf, from: this);

  @override
  String toString() => r'_pdfControllerProvider';
}

abstract class _$PdfController extends $AsyncNotifier<PdfController?> {
  late final _$args = ref.$arg as AvalancheBulletinPdf;
  AvalancheBulletinPdf get avalancheBulletinPdf => _$args;

  FutureOr<PdfController?> build(AvalancheBulletinPdf avalancheBulletinPdf);
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
