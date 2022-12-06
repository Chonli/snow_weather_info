import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/extensions/double.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/modules/data_station/chart.dart';
import 'package:snow_weather_info/modules/data_station/notifier.dart';
import 'package:snow_weather_info/modules/data_station/widget.dart';

class DataStationView extends StatelessWidget {
  const DataStationView({
    super.key,
    required this.station,
  });

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
    super.key,
    required this.station,
  });

  final Station station;

  String _formatDataToString(Station station, DataStation data) {
    var ret =
        "Station ${station.name} (${station.altitude}m) au ${DateFormat('dd-MM-yyyy à kk:mm').format(data.date)}\n";
    if (data.temperature != null) {
      ret += 'Température: ${data.temperature!.toStringTemperature()}\n';
    }
    if (data.snowHeight != null) {
      ret += 'Hauteur de neige: ${data.snowHeight!.toStringSnowHeigth()}cm\n';
    }
    if (data.snowNewHeight != null) {
      ret +=
          'Hauteur de neige fraiches: ${data.snowNewHeight!.toStringSnowHeigth()}cm\n';
    }

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<DataNotifier>();
    notifier.currentMapLoc = station.position;
    final data = notifier.getDataOfStation(station.id);
    final isFavorite = notifier.isFavorite(station);

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
            onPressed: () => notifier.addOrRemoveFavoriteStation(station),
          ),
          if (data.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () => Share.share(
                _formatDataToString(
                  station,
                  data[context.read<DataStationNotifier>().currentIndex],
                ),
              ),
            ),
        ],
      ),
      body: data.isEmpty
          ? const Center(child: Text('Pas de donnée pour cette station météo'))
          : _Body(data: data),
    );
  }
}

class _Body extends StatelessWidget {
  _Body({
    super.key,
    required this.data,
  });

  final List<DataStation> data;
  final carouselController = PageController();

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
                      child: SizedBox(
                        height: 220,
                        child: PageView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) => DataStationWidget(
                            data: data[index],
                          ),
                          controller: carouselController,
                          onPageChanged: (index) => context
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
                color: Theme.of(context).textTheme.headline6?.color,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
