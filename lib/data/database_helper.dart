import 'package:snow_weather_info/model/station.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

final String tableStation = 'station';
final String columnId = '_id';
final String columnName = 'name';
final String columnLatitude = 'latitude';
final String columnLongitude = 'longitude';
final String columnAltitude = 'altitude';

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
    int id = await db.insert(tableStation, station.toMap());
    return id;
  }

  Future<List<Station>> getAllStation() async {
    List<Station> ret = List<Station>();
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
}
