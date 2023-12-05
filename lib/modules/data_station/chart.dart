import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snow_weather_info/extensions/double.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/modules/data_station/view.dart';

class DataStationChart extends ConsumerWidget {
  const DataStationChart({
    super.key,
  });
  static final _xOffset = const Duration(hours: 12).inMilliseconds;

  LineChartData _getTempData(List<DataStation> datas) {
    final tempData = <FlSpot>[];
    final min = datas.firstOrNull?.date.millisecondsSinceEpoch.toDouble() ?? 0;
    final max = datas.lastOrNull?.date.millisecondsSinceEpoch.toDouble() ?? 0;

    for (var data in datas) {
      tempData.add(
        FlSpot(
          data.date.millisecondsSinceEpoch.toDouble(),
          data.temperature ?? 0,
        ),
      );
    }

    final temperatureLineData = LineChartBarData(
      spots: tempData,
      isCurved: true,
      color: Colors.red,
    );

    return LineChartData(
      lineBarsData: [
        temperatureLineData,
      ],
      minX: min - _xOffset,
      maxX: max + _xOffset,
      titlesData: FlTitlesData(
        bottomTitles: _bottomTitles(temperatureLineData),
        topTitles: _noTitlesWidget(),
        rightTitles: _noTitlesWidget(),
      ),
    );
  }

  LineChartData _getSnowData(
    List<DataStation> datas,
  ) {
    final tempData = <FlSpot>[];
    final List<List<FlSpot>> tempHeightData = [];
    final min = datas.firstOrNull?.date.millisecondsSinceEpoch.toDouble() ?? 0;
    final max = datas.lastOrNull?.date.millisecondsSinceEpoch.toDouble() ?? 0;

    for (final data in datas) {
      final x = data.date.millisecondsSinceEpoch.toDouble();
      tempData.add(
        FlSpot(
          x,
          data.snowHeight?.toCm ?? 0,
        ),
      );

      final dataHeight = data.snowNewHeight?.toCm ?? 0;
      if (dataHeight > 0) {
        tempHeightData.add([
          FlSpot(
            x,
            dataHeight,
          ),
          FlSpot(
            x,
            0,
          ),
        ]);
      }
    }

    // TODO: center when only one data
    final snowLineData = LineChartBarData(
      spots: tempData,
      isCurved: true,
      color: Colors.blue.shade600,
    );

    final snowHeightLineData = tempHeightData.map(
      (d) => LineChartBarData(
        spots: d,
        barWidth: 20,
        dotData: const FlDotData(show: false),
        color: Colors.blue.shade300.withOpacity(0.8),
      ),
    );

    final maxY = snowLineData.mostTopSpot.y + 10;

    return LineChartData(
      lineBarsData: [
        snowLineData,
        ...snowHeightLineData,
      ],
      minX: min - _xOffset,
      maxX: max + _xOffset,
      minY: 0,
      maxY: maxY,
      titlesData: FlTitlesData(
        bottomTitles: _bottomTitles(snowLineData),
        topTitles: _noTitlesWidget(),
        rightTitles: _noTitlesWidget(),
      ),
      borderData: FlBorderData(
        border: const Border(
          top: BorderSide.none,
          right: BorderSide.none,
          left: BorderSide(width: 1),
          bottom: BorderSide(width: 1),
        ),
      ),
    );
  }

  AxisTitles _bottomTitles(LineChartBarData data) {
    late double? interval;
    if (data.spots.length > 1) {
      interval = data.mostRightSpot.x - data.mostLeftSpot.x;
    } else {
      interval = data.spots.firstOrNull?.x;
    }
    return AxisTitles(
      sideTitles: SideTitles(
        interval: interval,
        showTitles: true,
        getTitlesWidget: (value, meta) {
          return Text(value.toDate);
        },
      ),
    );
  }

  AxisTitles _noTitlesWidget() {
    return const AxisTitles(sideTitles: SideTitles());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final datas = ref.watch(currentDataStationProvider);
    const graphPadding = EdgeInsets.only(right: 40, top: 40);
    final snowDatas = _getSnowData(datas);

    return Column(
      children: [
        Container(
          height: 300,
          padding: graphPadding,
          child: LineChart(snowDatas),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 300,
          padding: graphPadding,
          child: LineChart(_getTempData(datas)),
        ),
      ],
    );
  }
}
