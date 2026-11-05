import 'package:sembast/sembast.dart';
import 'package:snow_weather_info/core/local_data_metadata.dart';
import 'package:snow_weather_info/core/local_database.dart';

/// Métadonnées de synchronisation (date de dernière synchro, ETag) associées à
/// un [LocalData], stockées dans un enregistrement sembast séparé.
class MetaStore {
  const new(this._db, this._key);

  /// Métadonnées associées à un [LocalData].
  static MetaStore forData<T>(LocalData<List<T>> data) =>
      MetaStore(data.dataBase, data.storeKey);

  final Database _db;
  final String _key;

  static final _metaStore = StoreRef('data_meta');

  LocalData<LocalDataMetadata> get _localData => LocalData<LocalDataMetadata>(
    _db,
    _metaStore.record(_key),
    (meta) => meta.toMap(),
    (value) => LocalDataMetadata.fromMap(value as Map<String, Object?>),
    LocalDataMetadata.empty,
  );

  LocalDataMetadata read() => _localData.read();

  Future<void> save(LocalDataMetadata metadata) => _localData.save(metadata);
}
