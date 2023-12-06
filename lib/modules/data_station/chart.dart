import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snow_weather_info/extensions/double.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/modules/data_station/view.dart';

final _snowColor = Colors.blue.shade600;
final _snowHeightColor = Colors.blue.shade300.withOpacity(0.5);
const _tempColor = Colors.red;

class DataStationChart extends ConsumerWidget {
  const DataStationChart({
    super.key,
  });
  static final _xOffset = const Duration(hours: 12).inMilliseconds;

  LineChartData _getTempData(List<DataStation> datas) {
    final tempData = <FlSpot>[];
    final minTempData = <FlSpot>[];
    final maxTempData = <FlSpot>[];
    final min = datas.firstOrNull?.date.millisecondsSinceEpoch.toDouble() ?? 0;
    final max = datas.lastOrNull?.date.millisecondsSinceEpoch.toDouble() ?? 0;

    for (var data in datas) {
      tempData.add(
        FlSpot(
          data.date.millisecondsSinceEpoch.toDouble(),
          data.temperature ?? 0,
        ),
      );

      final minTemp = data.temperatureMin24;
      if (minTemp != null) {
        minTempData.add(
          FlSpot(
            data.date.millisecondsSinceEpoch.toDouble(),
            minTemp,
          ),
        );
      }
      final maxTemp = data.temperatureMax24;
      if (maxTemp != null) {
        maxTempData.add(
          FlSpot(
            data.date.millisecondsSinceEpoch.toDouble(),
            maxTemp,
          ),
        );
      }
    }

    final temperatureLineData = LineChartBarData(
      spots: tempData,
      isCurved: true,
      color: _tempColor,
    );
    final temperatureMaxLineData = LineChartBarData(
      spots: minTempData,
      isCurved: true,
      show: false,
      dotData: const FlDotData(show: false),
    );
    final temperatureMinLineData = LineChartBarData(
      spots: maxTempData,
      isCurved: true,
      show: false,
      dotData: const FlDotData(show: false),
    );

    return LineChartData(
      lineBarsData: [
        temperatureLineData,
        temperatureMaxLineData,
        temperatureMinLineData,
      ],
      minX: min - _xOffset,
      maxX: max + _xOffset,
      betweenBarsData: [
        BetweenBarsData(
          fromIndex: 0,
          toIndex: 1,
          color: _tempColor.withOpacity(0.5),
        ),
        BetweenBarsData(
          fromIndex: 0,
          toIndex: 2,
          color: _tempColor.withOpacity(0.5),
        )
      ],
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

    final snowLineData = LineChartBarData(
      spots: tempData,
      isCurved: true,
      color: _snowColor,
    );

    final snowHeightLineData = tempHeightData.map(
      (d) => LineChartBarData(
        spots: d,
        barWidth: 20,
        dotData: const FlDotData(show: false),
        color: _snowHeightColor,
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
        _LegendChart(
          color: _snowColor,
          label: 'Neige',
        ),
        _LegendChart(
          color: _snowHeightColor,
          label: 'Neige fraîche',
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 300,
          padding: graphPadding,
          child: LineChart(_getTempData(datas)),
        ),
        const SizedBox(
          height: 10,
        ),
        const _LegendChart(
          color: _tempColor,
          label: 'Température',
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _LegendChart extends StatelessWidget {
  const _LegendChart({
    required this.color,
    required this.label,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          SizedBox(
            width: 12,
            height: 12,
            child: ColoredBox(color: color),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(label),
        ],
      ),
    );
  }
}
