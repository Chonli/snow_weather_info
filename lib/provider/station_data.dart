import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/repositories/station.dart';
import 'package:snow_weather_info/data/repositories/station_data.dart';
import 'package:snow_weather_info/model/data_station.dart';

part 'station_data.g.dart';

@Riverpod(keepAlive: true)
class StationData extends _$StationData {
  @override
  FutureOr<Map<String, List<DataStation>>> build() async {
    final stationRepo = ref.watch(stationRepositoryProvider);
    final stations = await stationRepo.getStations();
    final stationDataRepo = ref.watch(stationDataRepositoryProvider);
    final stationDatas = await stationDataRepo.getDataStation();

    final mapDataStation = <String, List<DataStation>>{};

    for (final s in stations) {
      final listOfData = stationDatas
          .where(
            (data) => data.id == s.id.toString(),
          )
          .sorted((a, b) => b.date.compareTo(a.date))
          .toList();
      mapDataStation[s.id.toString()] = listOfData;
    }

    return mapDataStation;
  }
}
