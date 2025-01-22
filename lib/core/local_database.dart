import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast_io.dart';

part 'local_database.g.dart';

typedef Serializer<T> = Object Function(T value);
typedef Deserializer<T> = T Function(Object value);

Object _defaultSerialize<T>(T value) => value as Object;
T _defaultDeserialize<T>(Object value) => value as T;

@Riverpod(keepAlive: true)
Database dataBase(Ref ref) {
  throw Exception('Not initialize database!');
}

abstract class LocalDataContainer {
  const LocalDataContainer(this.dataBase);

  @protected
  final Database dataBase;

  @protected
  String get name;

  LocalData<T> load<T>({
    required String key,
    required T defaultValue,
    Serializer<T>? serialize,
    Deserializer<T>? deserialize,
    AsyncCallback? onSaved,
  }) {
    return LocalData<T>(
      dataBase,
      StoreRef.main().record('$name$key'),
      serialize,
      deserialize,
      defaultValue,
    );
  }
}

class LocalData<T> {
  LocalData(
    this._db,
    this._record,
    Serializer<T>? serialize,
    Deserializer<T>? deserialize,
    this.defaultValue,
  )   : _serialize = serialize ?? _defaultSerialize,
        _deserialize = deserialize ?? _defaultDeserialize;

  final Database _db;
  final RecordRef _record;
  final Serializer<T> _serialize;
  final Deserializer<T> _deserialize;
  final T defaultValue;

  T read() {
    final data = _record.getSync(_db);

    if (data != null) {
      return _deserialize(data);
    } else {
      return defaultValue;
    }
  }

  Future<void> save(T? value) async {
    if (value == null && _record.existsSync(_db)) {
      await _record.delete(_db);
    } else if (value != null) {
      final data = _serialize(value);
      await _record.put(_db, data);
    }
  }
}
