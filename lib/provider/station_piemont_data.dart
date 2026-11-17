import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/repositories/station_piemont_data.dart';
import 'package:snow_weather_info/model/data_station.dart';

part 'station_piemont_data.g.dart';

@Riverpod(keepAlive: true)
class StationPiemontData extends _$StationPiemontData {
  @override
  FutureOr<Map<String, List<DataStation>>> build() async {
    final repo = ref.watch(stationPiemontDataRepositoryProvider);
    final datas = await repo.getDataStation();

    // group by station id string (keep original code as 0-padded when possible)
    final map = <String, List<DataStation>>{};
    for (final d in datas) {
      // try to use id from DataStation if not empty, else use ''
      final key = d.id.isNotEmpty ? d.id : '';
      map.putIfAbsent(key, () => []).add(d);
    }

    // sort each list by date desc
    for (final k in map.keys) {
      map[k]!.sort((a, b) => b.date.compareTo(a.date));
    }

    return map;
  }
}
