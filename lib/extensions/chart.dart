import 'package:fl_chart/fl_chart.dart';

extension ListLineChartBarDataExt on Iterable<LineChartBarData> {
  double get safeTopMostY {
    if (length > 1) {
      return reduce((a, b) => a.mostTopSpot.y > b.mostTopSpot.y ? a : b)
          .mostTopSpot
          .y;
    } else {
      return firstOrNull?.mostTopSpot.y ?? 0;
    }
  }
}
