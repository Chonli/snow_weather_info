import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/core/local_database.dart';
import 'package:snow_weather_info/extensions/date_time.dart';
import 'package:snow_weather_info/model/station.dart';

part 'station_local_data.g.dart';

@riverpod
SationLocalDataContainer stationLocalData(Ref ref) {
  return SationLocalDataContainer(ref.watch(dataBaseProvider));
}

class SationLocalDataContainer extends LocalDataContainer {
  const SationLocalDataContainer(super.dataBase);

  @override
  String get name => 'station_box';

  LocalData<DateTime> get lastUpdate => load(
        key: 'last_update',
        serialize: (date) => date.toLocalData,
        deserialize: (json) => DateTime.parse(json as String),
        defaultValue: DateTime.now(),
      );

  LocalData<List<Station>> get allStations => load(
        key: 'all_station',
        serialize: (stations) => stations.map((e) => e.toJson()).toList(),
        deserialize: (json) => (json as List<dynamic>)
            .map(
              (e) => Station.fromJson(e as String),
            )
            .toList(),
        defaultValue: [],
      );
}
