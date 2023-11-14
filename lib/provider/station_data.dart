import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/database_helper.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/provider/stations.dart';

part 'station_data.g.dart';

@Riverpod(keepAlive: true)
class StationData extends _$StationData {
  DatabaseHelper get databaseHelper => ref.read(databaseHelperProvider);

  @override
  FutureOr<Map<int, List<DataStation>>> build() async {
    final asyncStations = ref.watch(stationsProvider);
    final mapDataStation = <int, List<DataStation>>{};

    await databaseHelper.cleanOldData(7);

    asyncStations.whenData((stations) {
      for (final s in stations) {
        final listOfData =
            <DataStation>[]; //await databaseHelper.getDataStation(s.id);
        mapDataStation[s.id] = listOfData;
        s.hasData = listOfData.isNotEmpty;
        if (s.hasData) {
          final dataSt =
              listOfData.firstWhereOrNull((d) => d.snowHeight != null);
          s.lastSnowHeight = dataSt?.snowHeight ?? 0;
        } else {
          s.lastSnowHeight = 0.0;
        }
      }
    });

    return mapDataStation;
  }

  List<DataStation> getDataOfStation(int id) {
    return state.asData?.value[id] ?? [];
  }
}
