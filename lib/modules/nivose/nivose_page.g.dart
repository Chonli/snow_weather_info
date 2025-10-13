// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nivose_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_isFavorite)
const _isFavoriteProvider = _IsFavoriteFamily._();

final class _IsFavoriteProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const _IsFavoriteProvider._({
    required _IsFavoriteFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'_isFavoriteProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$_isFavoriteHash();

  @override
  String toString() {
    return r'_isFavoriteProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as String;
    return _isFavorite(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _IsFavoriteProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$_isFavoriteHash() => r'6a4e20c692a9cc432999a9dca41676908fd4a090';

final class _IsFavoriteFamily extends $Family
    with $FunctionalFamilyOverride<bool, String> {
  const _IsFavoriteFamily._()
    : super(
        retry: null,
        name: r'_isFavoriteProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  _IsFavoriteProvider call(String codeMF) =>
      _IsFavoriteProvider._(argument: codeMF, from: this);

  @override
  String toString() => r'_isFavoriteProvider';
}
