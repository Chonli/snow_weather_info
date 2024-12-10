import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive.dart';

typedef Serializer<T> = T Function(T value);
typedef Deserializer<T> = T Function(Object value);

T _defaultSerialize<T>(T value) => value;
T _defaultDeserialize<T>(Object value) => value as T;

class LocalDataBase<T> {
  const LocalDataBase(this.database);

  final Box<T> database;

  LocalData<T> load({
    required String key,
    Serializer<T>? serialize,
    Deserializer<T>? deserialize,
    T? defaultValue,
    AsyncCallback? onSaved,
  }) {
    return LocalData<T>(
      database,
      serialize,
      deserialize,
      defaultValue,
      onSaved,
    );
  }
}

class LocalData<T> {
  LocalData(
    this._db,
    Serializer<T>? serialize,
    Deserializer<T>? deserialize,
    this.defaultValue,
    this.onSaved,
  )   : assert(
          serialize == null && deserialize == null ||
              serialize != null && deserialize != null,
          'serialize and deserialize should be set at the same time',
        ),
        _serialize = serialize ?? _defaultSerialize,
        _deserialize = deserialize ?? _defaultDeserialize;

  final Box<T> _db;
  final Serializer<T> _serialize;
  final Deserializer<T> _deserialize;
  final T? defaultValue;
  final AsyncCallback? onSaved;

  Future<T?> read() async {
    final value = _db.get(_db) as Object? ?? defaultValue;

    return value == null ? null : _deserialize(value);
  }

  Future<void> save(T? value) async {
    if (value == null && _db.containsKey(_db)) {
      await _db.delete(_db);
    } else if (value != null) {
      final data = _serialize(value);
      await _db.put(_db, data);
    }
    await onSaved?.call();
  }
}

 



  // Future<void> _onCreate(Database db, int version) async {
  //   await db.execute('''
  //             CREATE TABLE $tableStationData (
  //               $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
  //               $columnIdStation INTEGER,
  //               $columnDate DATETIME NOT NULL,
  //               $columnTemperature DOUBLE,
  //               $columnTemperatureMax24 DOUBLE,
  //               $columnTemperatureMin24 DOUBLE,
  //               $columnTemperatureSnow DOUBLE,
  //               $columnDirectionWind DOUBLE,
  //               $columnSpeedWind DOUBLE,
  //               $columnSnowHeight DOUBLE,
  //               $columnSnowNewHeight DOUBLE
  //             )
  //             ''');
  //   await db.execute('''
  //             CREATE TABLE $tableStation (
  //               $columnId INTEGER PRIMARY KEY,
  //               $columnName TEXT NOT NULL,
  //               $columnLatitude DOUBLE NOT NULL,
  //               $columnLongitude DOUBLE NOT NULL,
  //               $columnAltitude INTEGER NOT NULL
  //             )
  //             ''');
  // }

  // Future<int> insertStation(Station station) async {
  //   final db = await database;
  //   var id = 0;
  //   final maps = await db.query(
  //     tableStation,
  //     columns: [columnId],
  //     where: '$columnId = ?',
  //     whereArgs: <dynamic>[station.id],
  //   );
  //   if (maps.isEmpty) {
  //     id = await db.insert(tableStation, station.toMap());
  //   }

  //   return id;
  // }

  // Future<int> insertStationData(DataStation stationData) async {
  //   final db = await database;
  //   var id = 0;
  //   final maps = await db.query(
  //     tableStationData,
  //     columns: [columnIdStation, columnDate],
  //     where: '$columnIdStation = ? AND $columnDate = ?',
  //     whereArgs: <dynamic>[stationData.id, stationData.date.toIso8601String()],
  //   );
  //   if (maps.isEmpty) {
  //     id = await db.insert(tableStationData, stationData.toMap());
  //   }

  //   return id;
  // }

  // Future<List<DataStation>> getDataStation(int idStation) async {
  //   final ret = <DataStation>[];
  //   final db = await database;
  //   final maps = await db.query(
  //     tableStationData,
  //     columns: [
  //       columnIdStation,
  //       columnDate,
  //       columnTemperature,
  //       columnTemperatureMin24,
  //       columnTemperatureMax24,
  //       columnTemperatureSnow,
  //       columnDirectionWind,
  //       columnSpeedWind,
  //       columnSnowHeight,
  //       columnSnowNewHeight,
  //     ],
  //     where: '$columnIdStation = ?',
  //     whereArgs: <dynamic>[idStation],
  //     orderBy: '$columnDate DESC',
  //   );
  //   if (maps.isNotEmpty) {
  //     for (final stationDataMap in maps) {
  //       ret.add(DataStation.fromMap(stationDataMap));
  //     }
  //   }

  //   return ret;
  // }

  // Future<List<Station>> getAllStation() async {
  //   final ret = <Station>[];
  //   final db = await database;
  //   final maps = await db.query(
  //     tableStation,
  //     columns: [
  //       columnId,
  //       columnName,
  //       columnLatitude,
  //       columnLongitude,
  //       columnAltitude,
  //     ],
  //   );
  //   if (maps.isNotEmpty) {
  //     for (final stationMap in maps) {
  //       ret.add(Station.fromMap(stationMap));
  //     }
  //   }

  //   return ret;
  // }

  // Future<void> cleanOldData(int day) async {
  //   final db = await database;
  //   await db.delete(
  //     tableStationData,
  //     where: '$columnDate < ?',
  //     whereArgs: <dynamic>[
  //       DateTime.now()
  //           .subtract(
  //             Duration(days: day),
  //           )
  //           .toIso8601String(),
  //     ],
  //   );
  // }

