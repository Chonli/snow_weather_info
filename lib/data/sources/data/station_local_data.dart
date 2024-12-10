import 'package:hive_ce/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/core/local_database.dart';
import 'package:snow_weather_info/model/station.dart';

part 'station_local_data.g.dart';

@riverpod
LocalDataBase<Station> stationLocalData(Ref ref) {
  final database = Hive.box<Station>('Station');

  return LocalDataBase<Station>(database);
}
