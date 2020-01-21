import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DataStationChart extends StatelessWidget {
  final List<DataStation> _data;
  const DataStationChart(this._data);

  @override
  Widget build(BuildContext context) {
    List<TimeSeriesData> tsdatasnow = [];
    List<TimeSeriesData> tsdatatemperature = [];
    List<TimeSeriesData> tsdatanewsnow = [];
    if (_data != null) {
      for (var d in _data) {
        if (d.hasSnowHeight) {
          tsdatasnow.add(TimeSeriesData(d.date, d.snowHeight * 100));
        }
        if (d.hasTemperature) {
          tsdatatemperature.add(TimeSeriesData(d.date, d.temperature));
        }
        if (d.hasSnowNewHeight) {
          tsdatanewsnow.add(TimeSeriesData(d.date, d.snowNewHeight * 100));
        }
      }
    } else {
      // Dummy list to prevent data = NULL
      tsdatasnow.add(TimeSeriesData(DateTime.now(), 0.0));
    }

    var seriesLine = [
      charts.Series<TimeSeriesData, DateTime>(
        id: 'SnowHeight',
        displayName: "Neige",
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesData data, _) => data.time,
        measureFn: (TimeSeriesData data, _) => data.data,
        data: tsdatasnow,
      ), //..setAttribute(charts.measureAxisIdKey, 'axis snow'),
      charts.Series<TimeSeriesData, DateTime>(
        id: 'SnowNewHeight',
        displayName: "Neige fraîche",
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesData data, _) => data.time,
        measureFn: (TimeSeriesData data, _) => data.data,
        data: tsdatanewsnow,
      )..setAttribute(charts.rendererIdKey, 'customBar'),
      //..setAttribute(charts.measureAxisIdKey, 'axis snow'),
      charts.Series<TimeSeriesData, DateTime>(
        id: 'Temperature',
        displayName: "Temperature",
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
        domainFn: (TimeSeriesData data, _) => data.time,
        measureFn: (TimeSeriesData data, _) => data.data,
        data: tsdatatemperature,
      ), //..setAttribute(charts.measureAxisIdKey, 'axis temperature'),
    ];

    return charts.TimeSeriesChart(
      seriesLine,
      animate: true,
      animationDuration: Duration(milliseconds: 800),
      behaviors: [
        charts.SeriesLegend(position: charts.BehaviorPosition.bottom),
      ],
      layoutConfig: charts.LayoutConfig(
          leftMarginSpec: charts.MarginSpec.fixedPixel(30),
          topMarginSpec: charts.MarginSpec.fixedPixel(10),
          rightMarginSpec: charts.MarginSpec.fixedPixel(10),
          bottomMarginSpec: charts.MarginSpec.fixedPixel(10)),
      disjointMeasureAxes: LinkedHashMap<String, charts.NumericAxisSpec>.from({
        'axis snow': charts.NumericAxisSpec(),
        'axis temperature': charts.NumericAxisSpec(),
      }),
      customSeriesRenderers: [
        charts.BarRendererConfig(
            // ID used to link series to this renderer.
            customRendererId: 'customBar',
            cornerStrategy: const charts.ConstCornerStrategy(30),
            fillPattern: charts.FillPatternType.forwardHatch)
      ],
    );
  }
}

class TimeSeriesData {
  final DateTime time;
  final double data;
  TimeSeriesData(this.time, this.data);
}
