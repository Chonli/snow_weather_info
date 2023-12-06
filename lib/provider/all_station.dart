import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/constant_data_list.dart';
import 'package:snow_weather_info/data/sources/station_api.dart';
import 'package:snow_weather_info/model/station.dart';

part 'all_station.g.dart';

@Riverpod(keepAlive: true)
class AllStations extends _$AllStations {
  @override
  List<AbstractStation> build() {
    final stations = ref.watch(apiStationProvider).asData?.value ?? [];

    return [
      ...stations,
      ...ConstantDatalist.listNivose,
    ];
  }
}
