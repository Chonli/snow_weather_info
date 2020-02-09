import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

final String tableStation = 'station';
final String tableStationData = 'stationData';
final String columnId = 'id';
final String columnName = 'name';
final String columnLatitude = 'latitude';
final String columnLongitude = 'longitude';
final String columnAltitude = 'altitude';
final String columnDate = 'date';
final String columnIdStation = 'idStation';
final String columnTemperature = 'temperature';
final String columnTemperatureMin24 = 'temperatureMin';
final String columnTemperatureMax24 = 'temperatureMax';
final String columnTemperatureSnow = 'temperatureSnow';
final String columnSpeedWind = 'speedWind';
final String columnDirectionWind = 'directionWind';
final String columnSnowHeight = 'snowHeight';
final String columnSnowNewHeight = 'snowNewHeight';

class DatabaseHelper {
  static final _databaseName = "database.db";
  static final _databaseVersion = 1;
  static Database _database;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String pathFolder = await getDatabasesPath();
    String path = p.join(pathFolder, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
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
    Database db = await database;
    int id = 0;
    List<Map> maps = await db.query(
      tableStation,
      columns: [columnId],
      where: '$columnId = ?',
      whereArgs: [station.id],
    );
    if (maps.length == 0) {
      id = await db.insert(tableStation, station.toMap());
    }
    return id;
  }

  Future<int> insertStationData(DataStation stationData) async {
    Database db = await database;
    int id = 0;
    List<Map> maps = await db.query(
      tableStationData,
      columns: [columnIdStation, columnDate],
      where: '$columnIdStation = ? AND $columnDate = ?',
      whereArgs: [stationData.id, stationData.date.toIso8601String()],
    );
    if (maps.length == 0) {
      id = await db.insert(tableStationData, stationData.toMap());
    }
    return id;
  }

  Future<List<DataStation>> getDataStation(int idStation) async {
    var ret = List<DataStation>();
    Database db = await database;
    List<Map> maps = await db.query(
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
      whereArgs: [idStation],
    );
    if (maps.length > 0) {
      for (var stationDataMap in maps) {
        ret.add(DataStation.fromMap(stationDataMap));
      }
    }
    return ret;
  }

  Future<List<Station>> getAllStation() async {
    var ret = List<Station>();
    Database db = await database;
    List<Map> maps = await db.query(
      tableStation,
      columns: [
        columnId,
        columnName,
        columnLatitude,
        columnLongitude,
        columnAltitude
      ],
    );
    if (maps.length > 0) {
      for (var stationMap in maps) {
        ret.add(Station.fromMap(stationMap));
      }
    }
    return ret;
  }

  Future cleanOldData(int day) async {
    Database db = await database;
    await db.delete(tableStationData, where: "$columnDate < ?", whereArgs: [
      DateTime.now().subtract(Duration(days: day)).toIso8601String()
    ]);
  }
}
