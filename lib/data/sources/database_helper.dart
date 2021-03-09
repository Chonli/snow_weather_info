import 'package:path/path.dart' as p;
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/model/station.dart';
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

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static const _databaseName = 'database.db';
  static const _databaseVersion = 1;
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    final pathFolder = await getDatabasesPath();
    final path = p.join(pathFolder, _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $tableStationData (
                $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
                $columnIdStation INTEGER,
                $columnDate DATETIME NOT NULL,
                $columnTemperature DOUBLE,
                $columnTemperatureMax24 DOUBLE,
                $columnTemperatureMin24 DOUBLE,
                $columnTemperatureSnow DOUBLE,
                $columnDirectionWind DOUBLE,
                $columnSpeedWind DOUBLE,
                $columnSnowHeight DOUBLE,
                $columnSnowNewHeight DOUBLE
              )
              ''');
    await db.execute('''
              CREATE TABLE $tableStation (
                $columnId INTEGER PRIMARY KEY,
                $columnName TEXT NOT NULL,
                $columnLatitude DOUBLE NOT NULL,
                $columnLongitude DOUBLE NOT NULL,
                $columnAltitude INTEGER NOT NULL
              )
              ''');
  }

  Future<int> insertStation(Station station) async {
    final Database db = await database;
    int id = 0;
    final maps = await db.query(
      tableStation,
      columns: [columnId],
      where: '$columnId = ?',
      whereArgs: <dynamic>[station.id],
    );
    if (maps.isEmpty) {
      id = await db.insert(tableStation, station.toMap());
    }
    return id;
  }

  Future<int> insertStationData(DataStation stationData) async {
    final db = await database;
    int id = 0;
    final maps = await db.query(
      tableStationData,
      columns: [columnIdStation, columnDate],
      where: '$columnIdStation = ? AND $columnDate = ?',
      whereArgs: <dynamic>[stationData.id, stationData.date.toIso8601String()],
    );
    if (maps.isEmpty) {
      id = await db.insert(tableStationData, stationData.toMap());
    }
    return id;
  }

  Future<List<DataStation>> getDataStation(int idStation) async {
    final ret = <DataStation>[];
    final db = await database;
    final maps = await db.query(
      tableStationData,
      columns: [
        columnIdStation,
        columnDate,
        columnTemperature,
        columnTemperatureMin24,
        columnTemperatureMax24,
        columnTemperatureSnow,
        columnDirectionWind,
        columnSpeedWind,
        columnSnowHeight,
        columnSnowNewHeight
      ],
      where: '$columnIdStation = ?',
      whereArgs: <dynamic>[idStation],
      orderBy: '$columnDate DESC',
    );
    if (maps.isNotEmpty) {
      for (final stationDataMap in maps) {
        ret.add(DataStation.fromMap(stationDataMap));
      }
    }
    return ret;
  }

  Future<List<Station>> getAllStation() async {
    final ret = <Station>[];
    final Database db = await database;
    final List<Map> maps = await db.query(
      tableStation,
      columns: [
        columnId,
        columnName,
        columnLatitude,
        columnLongitude,
        columnAltitude
      ],
    );
    if (maps.isNotEmpty) {
      for (final stationMap in maps) {
        ret.add(Station.fromMap(stationMap as Map<String, dynamic>));
      }
    }
    return ret;
  }

  Future cleanOldData(int day) async {
    final Database db = await database;
    await db.delete(
      tableStationData,
      where: '$columnDate < ?',
      whereArgs: <dynamic>[
        DateTime.now().subtract(Duration(days: day)).toIso8601String()
      ],
    );
  }
}
