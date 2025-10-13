// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_MassifFilter)
const _massifFilterProvider = _MassifFilterProvider._();

final class _MassifFilterProvider
    extends $NotifierProvider<_MassifFilter, List<Mountain>> {
  const _MassifFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_massifFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_massifFilterHash();

  @$internal
  @override
  _MassifFilter create() => _MassifFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Mountain> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Mountain>>(value),
    );
  }
}

String _$_massifFilterHash() => r'38333b2b6862a8591522d56b823077d8093a8e36';

abstract class _$MassifFilter extends $Notifier<List<Mountain>> {
  List<Mountain> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Mountain>, List<Mountain>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Mountain>, List<Mountain>>,
              List<Mountain>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
