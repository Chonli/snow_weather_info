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

  LineChartData _getTempData(List<DataStation> datas) {
    final tempData = <FlSpot>[];

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
      titlesData: FlTitlesData(
        bottomTitles: _bottomTitles(temperatureLineData),
        topTitles: _noTitlesWidget(),
        rightTitles: _noTitlesWidget(),
      ),
    );
  }

  LineChartData _getSnowData(List<DataStation> datas) {
    final tempData = <FlSpot>[];

    for (var data in datas) {
      tempData.add(
        FlSpot(
          data.date.millisecondsSinceEpoch.toDouble(),
          data.snowHeight?.toCm ?? 0,
        ),
      );
    }

    // TODO: center when only one data

    final snowLineData = LineChartBarData(
      spots: tempData,
      isCurved: true,
      color: Colors.blue.shade300,
    );

    return LineChartData(
      lineBarsData: [
        snowLineData,
      ],
      minY: 0,
      maxY: snowLineData.mostTopSpot.y + 10,
      titlesData: FlTitlesData(
        bottomTitles: _bottomTitles(snowLineData),
        topTitles: _noTitlesWidget(),
        rightTitles: _noTitlesWidget(),
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

    return Column(
      children: [
        Container(
          height: 300,
          padding: graphPadding,
          child: LineChart(_getSnowData(datas)),
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

    // final List<TimeSeriesData> tsdatasnow = [];
    // final List<TimeSeriesData> tsdatanewsnow = [];
    // final List<TimeSeriesData> tsdatasnowtemperature = [];
    // final List<TimeSeriesDataTemp> tsdatatemperature = [];

    // // Axis Style
    // final brightness = Theme.of(context).brightness;
    // final charts.Color textColor;
    // final lineColor = charts.MaterialPalette.gray.shade400;
    // textColor = brightness == Brightness.dark
    //     ? charts.MaterialPalette.white
    //     : charts.MaterialPalette.black;
    // final primaryAxis = charts.NumericAxisSpec(
    //   showAxisLine: false,
    //   renderSpec: charts.GridlineRendererSpec(
    //     lineStyle: charts.LineStyleSpec(color: lineColor),
    //     labelStyle: charts.TextStyleSpec(
    //       color: textColor,
    //     ),
    //   ),
    // );
    // final domainAxis = charts.DateTimeAxisSpec(
    //   renderSpec: charts.SmallTickRendererSpec(
    //     labelStyle: charts.TextStyleSpec(
    //       color: textColor,
    //     ),
    //   ),
    //   tickFormatterSpec: const charts.AutoDateTimeTickFormatterSpec(
    //     day: charts.TimeFormatterSpec(
    //       format: 'd',
    //       transitionFormat: 'dd/MM',
    //     ),
    //   ),
    // );

    // if (data.isNotEmpty) {
    //   for (final d in data) {
    //     if (d.snowHeight != null) {
    //       tsdatasnow.add(TimeSeriesData(d.date, d.snowHeight! * 100));
    //     }
    //     if (d.temperature != null) {
    //       tsdatatemperature.add(TimeSeriesDataTemp(
    //         d.date,
    //         d.temperature!,
    //         d.temperatureMin24 != null ? d.temperatureMin24! : d.temperature!,
    //         d.temperatureMax24 != null ? d.temperatureMax24! : d.temperature!,
    //       ));
    //     }
    //     if (d.temperatureSnow != null) {
    //       tsdatasnowtemperature.add(TimeSeriesData(d.date, d.temperatureSnow!));
    //     }
    //     if (d.snowNewHeight != null) {
    //       tsdatanewsnow.add(TimeSeriesData(d.date, d.snowNewHeight! * 100));
    //     }
    //   }
    // } else {
    //   // Dummy list to prevent data = NULL
    //   tsdatasnow.add(TimeSeriesData(DateTime.now(), 0));
    // }

    // final seriesSnow = [
    //   charts.Series<TimeSeriesData, DateTime>(
    //     id: 'SnowHeight',
    //     displayName: 'Neige',
    //     colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
    //     domainFn: (TimeSeriesData data, _) => data.time,
    //     measureFn: (TimeSeriesData data, _) => data.data,
    //     data: tsdatasnow,
    //   ),
    //   charts.Series<TimeSeriesData, DateTime>(
    //     id: 'SnowNewHeight',
    //     displayName: 'Neige fraîche',
    //     colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
    //     domainFn: (TimeSeriesData data, _) => data.time,
    //     measureFn: (TimeSeriesData data, _) => data.data,
    //     data: tsdatanewsnow,
    //   )..setAttribute(charts.rendererIdKey, 'customBar'),
    // ];

    // final seriesTemperature = [
    //   charts.Series<TimeSeriesDataTemp, DateTime>(
    //     id: 'Temperature',
    //     displayName: 'Température',
    //     colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
    //     domainFn: (TimeSeriesDataTemp data, _) => data.time,
    //     measureFn: (TimeSeriesDataTemp data, _) => data.temp,
    //     measureLowerBoundFn: (TimeSeriesDataTemp data, _) => data.tempMin,
    //     measureUpperBoundFn: (TimeSeriesDataTemp data, _) => data.tempMax,
    //     data: tsdatatemperature,
    //   ),
    //   charts.Series<TimeSeriesData, DateTime>(
    //     id: 'Temperature Snow',
    //     displayName: 'Température Neige',
    //     colorFn: (_, __) => charts.MaterialPalette.pink.shadeDefault,
    //     domainFn: (TimeSeriesData data, _) => data.time,
    //     measureFn: (TimeSeriesData data, _) => data.data,
    //     data: tsdatasnowtemperature,
    //   ),
    // ];

    // return ListView(
    //   primary: false,
    //   shrinkWrap: true,
    //   children: [
    //     Container(
    //       constraints: const BoxConstraints(
    //         maxHeight: 300,
    //       ),
    //       child: charts.TimeSeriesChart(
    //         seriesSnow,
    //         animate: true,
    //         animationDuration: const Duration(milliseconds: 800),
    //         behaviors: [
    //           charts.SeriesLegend(
    //             position: charts.BehaviorPosition.bottom,
    //             showMeasures: true,
    //             horizontalFirst: false,
    //             measureFormatter: (value) {
    //               return value == null ? '-' : '${value.toStringAsFixed(1)}cm';
    //             },
    //           ),
    //         ],
    //         layoutConfig: charts.LayoutConfig(
    //           leftMarginSpec: charts.MarginSpec.fixedPixel(30),
    //           topMarginSpec: charts.MarginSpec.fixedPixel(10),
    //           rightMarginSpec: charts.MarginSpec.fixedPixel(10),
    //           bottomMarginSpec: charts.MarginSpec.fixedPixel(10),
    //         ),
    //         primaryMeasureAxis: primaryAxis,
    //         domainAxis: domainAxis,
    //         customSeriesRenderers: [
    //           charts.BarRendererConfig(
    //             // ID used to link series to this renderer.
    //             customRendererId: 'customBar',
    //             cornerStrategy: const charts.ConstCornerStrategy(30),
    //             fillPattern: charts.FillPatternType.forwardHatch,
    //           ),
    //         ],
    //       ),
    //     ),
    //     Container(
    //       constraints: const BoxConstraints(
    //         maxHeight: 300,
    //       ),
    //       child: charts.TimeSeriesChart(
    //         seriesTemperature,
    //         animate: true,
    //         animationDuration: const Duration(milliseconds: 800),
    //         behaviors: [
    //           charts.SeriesLegend(
    //             position: charts.BehaviorPosition.bottom,
    //             showMeasures: true,
    //             horizontalFirst: false,
    //             measureFormatter: (value) {
    //               return value == null ? '-' : '${value.toStringAsFixed(1)}°C';
    //             },
    //           ),
    //         ],
    //         layoutConfig: charts.LayoutConfig(
    //           leftMarginSpec: charts.MarginSpec.fixedPixel(30),
    //           topMarginSpec: charts.MarginSpec.fixedPixel(10),
    //           rightMarginSpec: charts.MarginSpec.fixedPixel(10),
    //           bottomMarginSpec: charts.MarginSpec.fixedPixel(10),
    //         ),
    //         primaryMeasureAxis: primaryAxis,
    //         domainAxis: domainAxis,
    //       ),
    //     ),
    //   ],
    // );
  }
}

// class TimeSeriesData {
//   TimeSeriesData(this.time, this.data);

//   final DateTime time;
//   final double data;
// }

// class TimeSeriesDataTemp {
//   TimeSeriesDataTemp(this.time, this.temp, this.tempMin, this.tempMax);

//   final DateTime time;
//   final double temp;
//   final double tempMin;
//   final double tempMax;
// }
