import 'package:sembast/sembast.dart';
import 'package:snow_weather_info/core/local_data_metadata.dart';
import 'package:snow_weather_info/core/local_database.dart';
import 'package:snow_weather_info/core/meta_store.dart';
import 'package:snow_weather_info/model/data_station.dart';

/// Cache des mesures horaires par station : chaque [DataStation] est stocké
/// dans un enregistrement sembast dédié (clé `id::date`), dans un store séparé
/// par source. Une synchro n'écrit que les mesures nouvelles ou modifiées et ne
/// lit que la fenêtre de dates demandée : le transfert comme les écritures
/// restent proportionnels au delta.
class DataStationCache {
  new(LocalData<List<DataStation>> legacyData, {required String source})
    : _db = legacyData.dataBase,
      _store = StoreRef('station_data_$source'),
      _meta = MetaStore.forData(legacyData),
      _legacy = legacyData;

  final Database _db;
  final StoreRef _store;
  final MetaStore _meta;
  final LocalData<List<DataStation>> _legacy;
  Map<String, DateTime>? _lastDates;

  static String keyFor(DataStation data) =>
      '${data.id}::${data.date.toUtc().toIso8601String()}';

  static Map<String, Object?> _serialize(DataStation data) => {
    'id': data.id,
    'date': data.date.toUtc().toIso8601String(),
    'json': data.toJson(),
  };

  LocalDataMetadata get metadata => _meta.read();

  Future<void> saveMetadata(LocalDataMetadata metadata) => _meta.save(metadata);

  /// Dernière date de mesure connue par station, pour calculer le delta à
  /// télécharger. Les clés sembast sont triées (`id::date`), une simple
  /// suffix-scan suffit et les résultats sont gardés en mémoire.
  Future<Map<String, DateTime>> lastDatePerStation() async =>
      _lastDates ??= await _loadLastDates();

  Future<Map<String, DateTime>> _loadLastDates() async {
    await _ensureMigrated();
    final finder = Finder(
      filter: Filter.notNull('date'),
      sortOrders: [SortOrder('date')],
    );
    final records = await _store.find(_db, finder: finder);
    final loaded = <String, DateTime>{};
    for (final record in records) {
      final value = record.value;
      if (value is! Map) continue;
      final date = DateTime.tryParse(value['date']?.toString() ?? '');
      if (date == null) continue;
      loaded[value['id']?.toString() ?? ''] = date;
    }

    return loaded;
  }

  /// Lit les mesures stockées entre [from] et [to] (bornes incluses),
  /// éventuellement limitées aux stations [onlyIds].
  Future<List<DataStation>> read({
    DateTime? from,
    DateTime? to,
    Set<String>? onlyIds,
  }) async {
    await _ensureMigrated();
    final finder = Finder(
      filter: Filter.custom(
        (record) => _inRange(record.value, from, to, onlyIds),
      ),
      sortOrders: [SortOrder('date', false)],
    );

    final records = await _store.find(_db, finder: finder);
    return records
        .map((record) => _deserialize(record.value))
        .nonNulls
        .toList();
  }

  static bool _inRange(
    Object? recordValue,
    DateTime? from,
    DateTime? to,
    Set<String>? onlyIds,
  ) {
    if (recordValue is! Map) return false;
    final date = DateTime.tryParse(recordValue['date']?.toString() ?? '');
    if (date == null) return false;
    if (from != null && date.isBefore(from.toUtc())) return false;
    if (to != null && date.isAfter(to.toUtc())) return false;
    if (onlyIds != null && !onlyIds.contains(recordValue['id'])) return false;
    return true;
  }

  /// Fusionne [items] dans le cache : seules les mesures nouvelles ou modifiées
  /// sont écrites. Supprime les mesures plus anciennes que [pruneBefore].
  /// Retourne le nombre de mesures écrites.
  Future<int> merge(
    Iterable<DataStation> items, {
    DateTime? pruneBefore,
  }) async {
    await _ensureMigrated();

    // Lecture ciblée de la fenêtre concernée pour ne réécrire que le delta.
    final existing = <String, DataStation>{};
    if (items.isNotEmpty) {
      final ids = items.map((d) => d.id).toSet();
      final dates = items.map((d) => d.date).toList()..sort();
      final candidates = await read(
        from: dates.first,
        to: dates.last,
        onlyIds: ids,
      );
      for (final candidate in candidates) {
        existing[keyFor(candidate)] = candidate;
      }
    }

    final toRemove = <String>[];
    if (pruneBefore != null) {
      final old = await read(to: pruneBefore);
      toRemove.addAll(old.map(keyFor));
    }

    final updates = <String, Object?>{};
    for (final item in items) {
      final key = keyFor(item);
      final previous = existing[key];
      if (previous != null && _sameMeasurement(previous, item)) continue;
      updates[key] = _serialize(item);
    }

    if (toRemove.isNotEmpty || updates.isNotEmpty) {
      await _db.transaction((txn) async {
        for (final key in toRemove) {
          await _store.record(key).delete(txn);
        }
        for (final entry in updates.entries) {
          await _store.record(entry.key).put(txn, entry.value);
        }
      });
      _lastDates = null;
    }
    return updates.length;
  }

  /// Remplace toute la collection (réinitialisation complète).
  Future<void> replaceAll(Iterable<DataStation> items) async {
    await _db.transaction((txn) async {
      await _store.delete(txn);
      for (final item in items) {
        await _store.record(keyFor(item)).put(txn, _serialize(item));
      }
    });
    _lastDates = null;
  }

  Future<void> _ensureMigrated() async {
    if (_migrated) return;
    _migrated = true;
    final marker = _MigratedMarker(_db, _legacy.storeKey);
    if (marker.exists) return;

    final legacy = _legacy.read();
    if (legacy.isNotEmpty) {
      await replaceAll(legacy);
      await _legacy.save(null);
    }
    await marker.save();
  }

  bool _migrated = false;

  static bool _sameMeasurement(DataStation a, DataStation b) {
    return a.temperature == b.temperature &&
        a.temperatureMin24 == b.temperatureMin24 &&
        a.temperatureMax24 == b.temperatureMax24 &&
        a.temperatureSnow == b.temperatureSnow &&
        a.speedWind == b.speedWind &&
        a.directionWind == b.directionWind &&
        a.snowHeight == b.snowHeight &&
        a.snowNewHeight == b.snowNewHeight;
  }
}

/// Simple marqueur persistant indiquant que la migration blob -> par entrée a
/// déjà été faite pour une source donnée.
class _MigratedMarker {
  const new(this._db, this._key);

  final Database _db;
  final String _key;

  static final _store = StoreRef('data_meta');

  bool get exists => _store.record('$_key@migrated').existsSync(_db);

  Future<void> save() => _store.record('$_key@migrated').put(_db, true);
}

DataStation? _deserialize(Object? value) {
  if (value is! Map) return null;
  try {
    return DataStation.fromJson(value['json'].toString());
  } on Exception {
    return null;
  }
}
