import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast.dart';

const tableStation = 'station';
const tableStationData = 'stationData';
const columnId = 'id';
const columnName = 'name';
const columnLatitude = 'latitude';
const columnLongitude = 'longitude';
const columnAltitude = 'altitude';
const columnDate = 'date';
const columnIdStation = 'idStation';
const columnTemperature = 'temperature';
const columnTemperatureMin24 = 'temperatureMin';
const columnTemperatureMax24 = 'temperatureMax';
const columnTemperatureSnow = 'temperatureSnow';
const columnSpeedWind = 'speedWind';
const columnDirectionWind = 'directionWind';
const columnSnowHeight = 'snowHeight';
const columnSnowNewHeight = 'snowNewHeight';

const _databaseName = 'database.db';
const _databaseVersion = 1;

part 'database_helper.g.dart';

typedef Serializer<T> = Object Function(T value);
typedef Deserializer<T> = T Function(Object value);

Object _defaultSerialize<T>(T value) => value as Object;
T _defaultDeserialize<T>(Object value) => value as T;

@Riverpod(keepAlive: true)
DatabaseHelper databaseHelper(DatabaseHelperRef ref) {
  throw UnimplementedError();
}

// TODO(chonli): Reuse in future version
class DatabaseHelper {
  DatabaseHelper(this.database);
  final Database database;

   LocalData<T> load<T>({
    required String key,
    Serializer<T>? serialize,
    Deserializer<T>? deserialize,
    T? defaultValue,
    AsyncCallback? onSaved,
  }) {
    return LocalData<T>(
      database,
      StoreRef.main().record(key),
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
    this._record,
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

  final Database _db;
  final RecordRef _record;
  final Serializer<T> _serialize;
  final Deserializer<T> _deserialize;
  final T? defaultValue;
  final AsyncCallback? onSaved;

  Future<T?> read() async {
    final value = await _record.get(_db) ?? defaultValue;

    return value == null ? null : _deserialize(value);
  }

  Future<void> save(T? value) async {
    if (value == null && _record.existsSync(_db)) {
      await _record.delete(_db);
    } else if (value != null) {
      final data = _serialize(value);
      await _record.put(_db, data);
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

