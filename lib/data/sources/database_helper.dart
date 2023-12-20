import 'package:sqflite/sqflite.dart';

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

// TODO(chonli): Reuse in future version
class DatabaseHelper {
  Database? _database;

  // Future<Database> get database async {
  //   _database ??= await _initDatabase();

  //   return _database!;
  // }

  // Future<Database> _initDatabase() async {
  //   final pathFolder = await getDatabasesPath();
  //   final path = p.join(pathFolder, _databaseName);

  //   return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  // }

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
}
