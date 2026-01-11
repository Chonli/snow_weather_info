// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dataBase)
final dataBaseProvider = DataBaseProvider._();

final class DataBaseProvider
    extends $FunctionalProvider<Database, Database, Database>
    with $Provider<Database> {
  DataBaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dataBaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dataBaseHash();

  @$internal
  @override
  $ProviderElement<Database> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Database create(Ref ref) {
    return dataBase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Database value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Database>(value),
    );
  }
}

String _$dataBaseHash() => r'68a9b2cc146d8ad0dfd705d69709df0e82d9fa7b';
