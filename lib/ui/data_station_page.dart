import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:snow_weather_info/data/repository.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/ui/data_station_chart.dart';
import 'package:snow_weather_info/ui/data_station_widget.dart';

class DataStationPage extends StatefulWidget {
  final Station station;

  DataStationPage(this.station);

  @override
  _DataStationPageState createState() => _DataStationPageState();
}

class _DataStationPageState extends State<DataStationPage> {
  int _current = 0;
  Station get station => widget.station;

  String _formatDataToString(Station station, DataStation data) {
    var ret =
        "Station ${station.name} (${station.altitude}m) au ${DateFormat('dd-MM-yyyy à kk:mm').format(data.date)}\n";
    if (data.hasTemperature) {
      ret += "Température: ${data.temperature.toStringAsFixed(1)}°C\n";
    }
    if (data.hasSnowHeight) {
      ret +=
          "Hauteur de neige: ${(data.snowHeight * 100).toStringAsFixed(1)}cm\n";
    }
    if (data.hasSnowNewHeight) {
      ret +=
          "Hauteur de neige fraiches: ${(data.snowNewHeight * 100).toStringAsFixed(1)}cm\n";
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    Repository repository = Provider.of<Repository>(context);
    repository.currentMapLoc = station.position;
    final data = repository.getDataOfStation(station.id);
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                station.name,
              ),
              Text(
                " (${station.altitude}m)",
              ),
            ],
          ),
          actions: <Widget>[
            Visibility(
              visible: (data != null && data.length != 0),
              child: IconButton(
                icon: Icon(Icons.share),
                onPressed: () =>
                    Share.share(_formatDataToString(station, data[_current])),
              ),
            ),
          ],
        ),
        body: data == null || data.length == 0
            ? Center(child: Text('Pas de donnée pour cette station météo'))
            : _pageBody(data));
  }

  Widget _pageBody(final List<DataStation> data) {
    final dataSlider = CarouselSlider(
      items: data.map((d) => DataStationWidget(d)).toList(),
      height: 220,
      initialPage: 0,
      viewportFraction: 1.0,
      enableInfiniteScroll: false,
      reverse: false,
      autoPlay: false,
      enlargeCenterPage: true,
      onPageChanged: (index) {
        setState(() {
          _current = index;
        });
      },
      scrollDirection: Axis.horizontal,
      scrollPhysics: BouncingScrollPhysics(),
    );
    return Column(children: <Widget>[
      Expanded(
        child: ListView(
          primary: true,
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  onPressed: () => dataSlider.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear),
                  icon: Icon(Icons.arrow_back_ios),
                  padding: EdgeInsets.all(0.0),
                ),
                Expanded(child: dataSlider),
                IconButton(
                  onPressed: () => dataSlider.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear),
                  icon: Icon(Icons.arrow_forward_ios),
                  padding: EdgeInsets.all(0.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                data.length,
                (i) => Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == i
                          ? Color.fromRGBO(0, 0, 255, 0.9)
                          : Color.fromRGBO(0, 0, 255, 0.4)),
                ),
              ),
            ),
            DataStationChart(data),
          ],
        ),
      ),
      Container(
        color: Colors.blue,
        child: Text(
          'Informations créées à partir de données de Météo-France',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    ]);
  }
}
