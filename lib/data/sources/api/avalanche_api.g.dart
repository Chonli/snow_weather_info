// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avalanche_api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(apiAvalanche)
final apiAvalancheProvider = ApiAvalancheProvider._();

final class ApiAvalancheProvider
    extends
        $FunctionalProvider<
          AsyncValue<AtomFeed?>,
          AtomFeed?,
          FutureOr<AtomFeed?>
        >
    with $FutureModifier<AtomFeed?>, $FutureProvider<AtomFeed?> {
  ApiAvalancheProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiAvalancheProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiAvalancheHash();

  @$internal
  @override
  $FutureProviderElement<AtomFeed?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<AtomFeed?> create(Ref ref) {
    return apiAvalanche(ref);
  }
}

String _$apiAvalancheHash() => r'7766f245521128162c5a8a1cf5f608f078e6a5da';
