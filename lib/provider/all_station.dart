import 'dart:developer' show log;

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/constant_data_list.dart';
import 'package:snow_weather_info/data/repositories/station.dart';
import 'package:snow_weather_info/data/repositories/station_piemont.dart';
import 'package:snow_weather_info/model/station.dart';

part 'all_station.g.dart';

@Riverpod(keepAlive: true)
class AllStations extends _$AllStations {
  @override
  Future<List<AbstractStation>> build() async {
    try {
      final stationRepo = ref.watch(stationRepositoryProvider);
      final stationPiemontRepo = ref.watch(stationPiemontRepositoryProvider);

      final (stations, piemontStations) = await (
        stationRepo.getStations(),
        stationPiemontRepo.getStations(),
      ).wait;

      return [...stations, ...piemontStations, ...ConstantDatalist.listNivose];
    } on Exception catch (e) {
      log('Error fetching all stations: $e');
      return [...ConstantDatalist.listNivose];
    }
  }
}
