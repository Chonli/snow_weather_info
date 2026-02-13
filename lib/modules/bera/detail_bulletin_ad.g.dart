// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_bulletin_ad.dart';

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
    required AvalancheBulletinAndorre super.argument,
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

String _$_pdfControllerHash() => r'9914e6b7405e631d8faa271540cfafa0e7fe7853';

final class _PdfControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          _PdfController,
          AsyncValue<PdfController?>,
          PdfController?,
          FutureOr<PdfController?>,
          AvalancheBulletinAndorre
        > {
  _PdfControllerFamily._()
    : super(
        retry: null,
        name: r'_pdfControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  _PdfControllerProvider call(AvalancheBulletinAndorre avalancheBulletin) =>
      _PdfControllerProvider._(argument: avalancheBulletin, from: this);

  @override
  String toString() => r'_pdfControllerProvider';
}

abstract class _$PdfController extends $AsyncNotifier<PdfController?> {
  late final _$args = ref.$arg as AvalancheBulletinAndorre;
  AvalancheBulletinAndorre get avalancheBulletin => _$args;

  FutureOr<PdfController?> build(AvalancheBulletinAndorre avalancheBulletin);
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
