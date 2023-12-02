import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/station_api.dart';
import 'package:snow_weather_info/data/sources/station_data_api.dart';
import 'package:snow_weather_info/model/data_station.dart';

part 'station_data.g.dart';

@Riverpod(keepAlive: true)
class StationData extends _$StationData {
  @override
  FutureOr<Map<int, List<DataStation>>> build() async {
    final stations = ref.watch(apiStationProvider).asData?.value ?? [];
    final stationDatas = ref.watch(apiStationDataProvider).asData?.value ?? [];
    final mapDataStation = <int, List<DataStation>>{};

    for (final s in stations) {
      final listOfData = stationDatas
          .where(
            (data) => data.id == s.id,
          )
          .toList();
      mapDataStation[s.id] = listOfData;
    }

    return mapDataStation;
  }

  List<DataStation> getDataOfStation(int id) {
    return state.asData?.value[id] ?? [];
  }

  bool hasData(int id) {
    return state.asData?.value[id]?.isNotEmpty ?? false;
  }

  double lastSnowHeight(int id) {
    return state.asData?.value[id]?.reversed
            .firstWhereOrNull(
              (d) => d.snowHeight != null,
            )
            ?.snowHeight ??
        0.0;
  }
}
