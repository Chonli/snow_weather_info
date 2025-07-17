import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/core/local_database.dart';
import 'package:snow_weather_info/extensions/date_time.dart';
import 'package:snow_weather_info/model/data_station.dart';

part 'station_data_local_data.g.dart';

@Riverpod(keepAlive: true)
StationDataLocalDataContainer stationDataLocalData(Ref ref) {
  return StationDataLocalDataContainer(ref.watch(dataBaseProvider));
}

class StationDataLocalDataContainer extends LocalDataContainer {
  const StationDataLocalDataContainer(super.dataBase);

  @override
  String get name => 'station_data_box';

  LocalData<DateTime> get lastUpdate => load(
    key: 'last_update',
    serialize: (date) => date.toLocalData,
    deserialize: (json) => DateTime.parse(json as String),
    defaultValue: DateTime(0),
  );

  LocalData<List<DataStation>> get allDataStations => load(
    key: 'all_station_data',
    serialize: (stations) => stations.map((e) => e.toJson()).toList(),
    deserialize: (json) => (json as List<dynamic>)
        .map(
          (e) => DataStation.fromJson(e as String),
        )
        .toList(),
    defaultValue: [],
  );
}
