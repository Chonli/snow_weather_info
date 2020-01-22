import 'package:flutter/material.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DataStationChart extends StatelessWidget {
  final List<DataStation> _data;
  const DataStationChart(this._data);

  @override
  Widget build(BuildContext context) {
    List<TimeSeriesData> tsdatasnow = [];
    List<TimeSeriesData> tsdatanewsnow = [];
    List<TimeSeriesDataTemp> tsdatatemperature = [];
    if (_data != null) {
      for (var d in _data) {
        if (d.hasSnowHeight) {
          tsdatasnow.add(TimeSeriesData(d.date, d.snowHeight * 100));
        }
        if (d.hasTemperature) {
          tsdatatemperature.add(TimeSeriesDataTemp(
            d.date,
            d.temperature,
            d.hasTemperatureMin24 ? d.temperatureMin24 : d.temperature,
            d.hasTemperatureMax24 ? d.temperatureMax24 : d.temperature,
          ));
        }
        if (d.hasSnowNewHeight) {
          tsdatanewsnow.add(TimeSeriesData(d.date, d.snowNewHeight * 100));
        }
      }
    } else {
      // Dummy list to prevent data = NULL
      tsdatasnow.add(TimeSeriesData(DateTime.now(), 0.0));
    }

    var seriesSnow = [
      charts.Series<TimeSeriesData, DateTime>(
        id: 'SnowHeight',
        displayName: "Neige",
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesData data, _) => data.time,
        measureFn: (TimeSeriesData data, _) => data.data,
        data: tsdatasnow,
      ),
      charts.Series<TimeSeriesData, DateTime>(
        id: 'SnowNewHeight',
        displayName: "Neige fraîche",
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesData data, _) => data.time,
        measureFn: (TimeSeriesData data, _) => data.data,
        data: tsdatanewsnow,
      )..setAttribute(charts.rendererIdKey, 'customBar'),
    ];

    var seriesTemperature = [
      charts.Series<TimeSeriesDataTemp, DateTime>(
        id: 'Temperature',
        displayName: "Temperature",
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
        domainFn: (TimeSeriesDataTemp data, _) => data.time,
        measureFn: (TimeSeriesDataTemp data, _) => data.temp,
        measureLowerBoundFn: (TimeSeriesDataTemp data, _) => data.tempMin,
        measureUpperBoundFn: (TimeSeriesDataTemp data, _) => data.tempMax,
        data: tsdatatemperature,
      ),
    ];

    return ListView(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 300,
          ),
          child: charts.TimeSeriesChart(
            seriesSnow,
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
            customSeriesRenderers: [
              charts.BarRendererConfig(
                  // ID used to link series to this renderer.
                  customRendererId: 'customBar',
                  cornerStrategy: const charts.ConstCornerStrategy(30),
                  fillPattern: charts.FillPatternType.forwardHatch)
            ],
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 300,
          ),
          child: charts.TimeSeriesChart(
            seriesTemperature,
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
          ),
        ),
      ],
    );
  }
}

class TimeSeriesData {
  final DateTime time;
  final double data;
  TimeSeriesData(this.time, this.data);
}

class TimeSeriesDataTemp {
  final DateTime time;
  final double temp;
  final double tempMin;
  final double tempMax;
  TimeSeriesDataTemp(this.time, this.temp, this.tempMin, this.tempMax);
}
