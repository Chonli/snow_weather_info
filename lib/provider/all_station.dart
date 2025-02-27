import 'dart:developer' show log;

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/constant_data_list.dart';
import 'package:snow_weather_info/data/repositories/station.dart';
import 'package:snow_weather_info/model/station.dart';

part 'all_station.g.dart';

@Riverpod(keepAlive: true)
class AllStations extends _$AllStations {
  @override
  Future<List<AbstractStation>> build() async {
    try {
      final stationRepo = ref.watch(stationRepositoryProvider);
      final stations = await stationRepo.getStation();

      return [
        ...stations,
        ...ConstantDatalist.listNivose,
      ];
    } on Exception catch (e) {
      log('Error fetching all stations: $e');
      return [...ConstantDatalist.listNivose];
    }
  }
}
