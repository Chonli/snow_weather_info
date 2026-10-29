import 'package:snow_weather_info/model/data_station.dart';

extension StationDataListExtension on List<DataStation> {
  /// Keeps only one measurement per station and per [intervalHours]-hour slot,
  /// preferring the measurement closest to the slot start (so with full hourly
  /// data this yields measurements at 00:00, 04:00, 08:00, …).
  List<DataStation> onePerSlot({required int intervalHours}) {
    DateTime slotStart(DataStation d) => DateTime(
      d.date.year,
      d.date.month,
      d.date.day,
      (d.date.hour ~/ intervalHours) * intervalHours,
    );

    int distanceToSlotStart(DataStation d) =>
        d.date.difference(slotStart(d)).inMinutes;

    final bestPerSlot = <(String, DateTime), DataStation>{};
    for (final d in this) {
      final key = (d.id, slotStart(d));
      final current = bestPerSlot[key];
      if (current == null ||
          distanceToSlotStart(d) < distanceToSlotStart(current)) {
        bestPerSlot[key] = d;
      }
    }

    return bestPerSlot.values.toList()
      ..sort((a, b) => b.date.compareTo(a.date));
  }
}

extension StationDataMapExtension on Map<String, List<DataStation>> {
  bool hasData(String stationId) {
    return this[stationId]?.isNotEmpty ?? false;
  }

  double lastSnowHeight(String stationId) {
    final data = this[stationId];
    if (data == null || data.isEmpty) return 0;

    return data
            .firstWhere(
              (d) => d.snowHeight != null,
              orElse: () => data.first,
            )
            .snowHeight ??
        0.0;
  }
}
