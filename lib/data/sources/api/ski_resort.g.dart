// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ski_resort.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(skiResortApi)
final skiResortApiProvider = SkiResortApiProvider._();

final class SkiResortApiProvider
    extends $FunctionalProvider<SkiResortApi, SkiResortApi, SkiResortApi>
    with $Provider<SkiResortApi> {
  SkiResortApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'skiResortApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$skiResortApiHash();

  @$internal
  @override
  $ProviderElement<SkiResortApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SkiResortApi create(Ref ref) {
    return skiResortApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SkiResortApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SkiResortApi>(value),
    );
  }
}

String _$skiResortApiHash() => r'3ff824650d0cbc71240c9e273c96c9d5d4499577';
