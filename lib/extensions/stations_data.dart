import 'package:snow_weather_info/model/data_station.dart';

extension StationDataMapExtension on Map<String, List<DataStation>> {
  bool hasData(String stationId) {
    return this[stationId]?.isNotEmpty ?? false;
  }

  double lastSnowHeight(String stationId) {
    final data = this[stationId];
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
