// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ski_resorts.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(skiResortsRepository)
const skiResortsRepositoryProvider = SkiResortsRepositoryProvider._();

final class SkiResortsRepositoryProvider
    extends
        $FunctionalProvider<
          SkiResortsRepository,
          SkiResortsRepository,
          SkiResortsRepository
        >
    with $Provider<SkiResortsRepository> {
  const SkiResortsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'skiResortsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$skiResortsRepositoryHash();

  @$internal
  @override
  $ProviderElement<SkiResortsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SkiResortsRepository create(Ref ref) {
    return skiResortsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SkiResortsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SkiResortsRepository>(value),
    );
  }
}

String _$skiResortsRepositoryHash() =>
    r'1a25fab821ac411ea90ccf74384a9a91d856baea';
