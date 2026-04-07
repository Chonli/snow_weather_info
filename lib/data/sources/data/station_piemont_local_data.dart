import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/core/local_database.dart';
import 'package:snow_weather_info/extensions/date_time.dart';
import 'package:snow_weather_info/model/station.dart';

part 'station_piemont_local_data.g.dart';

@Riverpod(keepAlive: true)
StationPiemontLocalDataContainer stationPiemontLocalData(Ref ref) {
  return StationPiemontLocalDataContainer(ref.watch(dataBaseProvider));
}

class StationPiemontLocalDataContainer extends LocalDataContainer {
  const StationPiemontLocalDataContainer(super.dataBase);

  @override
  String get name => 'station_piemont_box';

  LocalData<DateTime> get lastUpdate => load(
    key: 'last_update',
    serialize: (date) => date.toLocalData,
    deserialize: (json) => DateTime.parse(json as String),
    defaultValue: DateTime(0),
  );

  LocalData<List<StationPiemont>> get allStations => load(
    key: 'all_station_piemont',
    serialize: (stations) => stations.map((e) => e.toJson()).toList(),
    deserialize: (json) => (json as List<dynamic>)
        .map(
          (e) => StationPiemont.fromJson(e as String),
        )
        .toList(),
    defaultValue: [],
  );
}
