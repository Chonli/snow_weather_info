import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/modules/data_station/chart.dart';
import 'package:snow_weather_info/modules/data_station/notifier.dart';
import 'package:snow_weather_info/modules/data_station/widget.dart';

class DataStationView extends StatelessWidget {
  const DataStationView({
    Key key,
    @required this.station,
  }) : super(key: key);

  final Station station;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataStationNotifier>(
      create: (_) => DataStationNotifier(),
      child: _View(station: station),
    );
  }
}

class _View extends StatelessWidget {
  const _View({
    Key key,
    @required this.station,
  }) : super(key: key);

  final Station station;

  String _formatDataToString(Station station, DataStation data) {
    var ret =
        "Station ${station.name} (${station.altitude}m) au ${DateFormat('dd-MM-yyyy à kk:mm').format(data.date)}\n";
    if (data.hasTemperature) {
      ret += 'Température: ${data.temperature.toStringAsFixed(1)}°C\n';
    }
    if (data.hasSnowHeight) {
      ret +=
          'Hauteur de neige: ${(data.snowHeight * 100).toStringAsFixed(1)}cm\n';
    }
    if (data.hasSnowNewHeight) {
      ret +=
          'Hauteur de neige fraiches: ${(data.snowNewHeight * 100).toStringAsFixed(1)}cm\n';
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    final repository = context.watch<DataNotifier>();
    repository.currentMapLoc = station.position;
    final data = repository.getDataOfStation(station.id);
    final isFavorite = repository.isFavorite(station);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              station.name,
            ),
            Text(
              ' (${station.altitude}m)',
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                if (isFavorite) {
                  repository.removeFavoriteStation(station);
                } else {
                  repository.addFavoriteStation(station);
                }
              }),
          Visibility(
            visible: data != null && data.isNotEmpty,
            child: IconButton(
              icon: const Icon(Icons.share),
              onPressed: () => Share.share(
                _formatDataToString(
                  station,
                  data[context.read<DataStationNotifier>().currentIndex],
                ),
              ),
            ),
          ),
        ],
      ),
      body: data == null || data.isEmpty
          ? const Center(child: Text('Pas de donnée pour cette station météo'))
          : _Body(data: data),
    );
  }
}

class _Body extends StatelessWidget {
  _Body({
    Key key,
    this.data,
  }) : super(key: key);

  final List<DataStation> data;
  final carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.select<DataStationNotifier, int>(
      (n) => n.currentIndex,
    );
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              primary: true,
              shrinkWrap: true,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => carouselController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      ),
                      icon: const Icon(Icons.arrow_back_ios),
                      padding: const EdgeInsets.all(0),
                    ),
                    Expanded(
                      child: CarouselSlider(
                        items: data
                            .map((d) => DataStationWidget(
                                  data: d,
                                ))
                            .toList(),
                        carouselController: carouselController,
                        options: CarouselOptions(
                          height: 220,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          viewportFraction: 1,
                          scrollPhysics: const BouncingScrollPhysics(),
                          onPageChanged: (index, _) => context
                              .read<DataStationNotifier>()
                              .currentIndex = index,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => carouselController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      ),
                      icon: const Icon(Icons.arrow_forward_ios),
                      padding: const EdgeInsets.all(0),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                    data.length,
                    (i) => Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 2,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == i
                            ? Theme.of(context).primaryColor.withOpacity(0.9)
                            : Theme.of(context).primaryColor.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
                DataStationChart(data: data),
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Text(
              'Informations créées à partir de données de Météo-France',
              style: TextStyle(
                color: Theme.of(context).textTheme.headline6.color,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
