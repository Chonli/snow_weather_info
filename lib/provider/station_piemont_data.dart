import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/model/data_station.dart';

part 'station_piemont_data.g.dart';

@Riverpod(keepAlive: true)
class StationPiemontData extends _$StationPiemontData {
  @override
  FutureOr<Map<String, List<DataStation>>> build() async {
    // Data source not implemented yet for Piemonte — return empty map for now
    return <String, List<DataStation>>{};
  }

  List<DataStation> getDataOfStation(String id) {
    return state.asData?.value[id] ?? [];
  }

  bool hasData(String id) {
    return state.asData?.value[id]?.isNotEmpty ?? false;
  }

  double lastSnowHeight(String id) {
    final data = state.asData?.value[id];
    if (data == null || data.isEmpty) return 0.0;

    return data
            .firstWhere(
              (d) => d.snowHeight != null,
              orElse: () => data.first,
            )
            .snowHeight ??
        0.0;
  }
}
