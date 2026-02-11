import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/core/local_database.dart';
import 'package:snow_weather_info/extensions/date_time.dart';
import 'package:snow_weather_info/model/ski_resort.dart';

part 'ski_resort_local_data.g.dart';

@Riverpod(keepAlive: true)
SkiResortLocalDataContainer skiResortLocalData(Ref ref) {
  return SkiResortLocalDataContainer(ref.watch(dataBaseProvider));
}

class SkiResortLocalDataContainer extends LocalDataContainer {
  const SkiResortLocalDataContainer(super.dataBase);

  @override
  String get name => 'ski_resort_box';

  LocalData<DateTime> get lastUpdate => load(
    key: 'last_update',
    serialize: (date) => date.toLocalData,
    deserialize: (json) => DateTime.parse(json as String),
    defaultValue: DateTime(0),
  );

  LocalData<List<SkiResort>> get skiResorts => load(
    key: 'skiResorts',
    serialize: (skiResorts) => skiResorts.map((e) => e.toJson()).toList(),
    deserialize: (json) => (json as List<dynamic>)
        .map((e) => SkiResort.fromJson(e as String))
        .toList(),
    defaultValue: [],
  );
}
