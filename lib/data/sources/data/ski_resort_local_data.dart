import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/core/local_database.dart';
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

  LocalData<List<SkiResort>> get skiResorts => load(
    key: 'skiResorts',
    serialize: (skiResorts) => skiResorts.map((e) => e.toJson()).toList(),
    deserialize:
        (json) =>
            (json as List<dynamic>)
                .map((e) => SkiResort.fromJson(e as String))
                .toList(),
    defaultValue: [],
  );
}
