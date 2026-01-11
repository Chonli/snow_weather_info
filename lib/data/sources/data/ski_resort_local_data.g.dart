// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ski_resort_local_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(skiResortLocalData)
final skiResortLocalDataProvider = SkiResortLocalDataProvider._();

final class SkiResortLocalDataProvider
    extends
        $FunctionalProvider<
          SkiResortLocalDataContainer,
          SkiResortLocalDataContainer,
          SkiResortLocalDataContainer
        >
    with $Provider<SkiResortLocalDataContainer> {
  SkiResortLocalDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'skiResortLocalDataProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$skiResortLocalDataHash();

  @$internal
  @override
  $ProviderElement<SkiResortLocalDataContainer> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SkiResortLocalDataContainer create(Ref ref) {
    return skiResortLocalData(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SkiResortLocalDataContainer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SkiResortLocalDataContainer>(value),
    );
  }
}

String _$skiResortLocalDataHash() =>
    r'7c2b11d815cd2c828b67e15814d08ef888e7f6be';
