import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/extensions/double.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/modules/data_station/card.dart';
import 'package:snow_weather_info/modules/data_station/chart.dart';
import 'package:snow_weather_info/modules/data_station/notifier.dart';

class DataStationView extends StatefulWidget {
  const DataStationView({
    super.key,
    required this.station,
  });

  final Station station;

  @override
  State<DataStationView> createState() => _DataStationViewState();
}

class _DataStationViewState extends State<DataStationView> {
  late final List<DataStation> data;

  @override
  void initState() {
    super.initState();
    final notifier = context.read<DataNotifier>();
    notifier.currentMapLoc = widget.station.position;
    data = notifier.getDataOfStation(widget.station.id);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Station>.value(value: widget.station),
        Provider<List<DataStation>>.value(value: data),
        ChangeNotifierProvider<DataStationNotifier>(
          create: (_) => DataStationNotifier(),
        ),
      ],
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View({
    super.key,
  });

  String _formatDataToString(BuildContext context) {
    final station = context.read<Station>();
    final notifier = context.read<DataStationNotifier>();
    final displayData =
        context.read<List<DataStation>>()[notifier.currentIndex];

    String ret =
        "Station ${station.name} (${station.altitude}m) au ${DateFormat('dd-MM-yyyy à kk:mm').format(displayData.date)}\n";
    if (displayData.temperature != null) {
      ret += 'Température: ${displayData.temperature!.toStringTemperature()}\n';
    }
    if (displayData.snowHeight != null) {
      ret +=
          'Hauteur de neige: ${displayData.snowHeight!.toStringSnowHeigth()}cm\n';
    }
    if (displayData.snowNewHeight != null) {
      ret +=
          'Hauteur de neige fraiches: ${displayData.snowNewHeight!.toStringSnowHeigth()}cm\n';
    }

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    final station = context.watch<Station>();
    final dataIsNotEmpty = context.watch<List<DataStation>>().isNotEmpty;
    final isFavorite = context.select(
      (DataNotifier notifier) => notifier.isFavorite(station),
    );

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
            onPressed: () =>
                context.read<DataNotifier>().addOrRemoveFavoriteStation(
                      station,
                    ),
          ),
          if (dataIsNotEmpty)
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () => Share.share(
                _formatDataToString(
                  context,
                ),
              ),
            ),
        ],
      ),
      body: dataIsNotEmpty
          ? const _Body()
          : const Center(child: Text('Pas de donnée pour cette station météo')),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              primary: true,
              shrinkWrap: true,
              children: const [
                _DataView(),
                _DotRow(),
                DataStationChart(),
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

class _DataView extends StatefulWidget {
  const _DataView({
    super.key,
  });

  @override
  State<_DataView> createState() => _DataViewState();
}

class _DataViewState extends State<_DataView> {
  late final carouselController = PageController();

  @override
  void dispose() {
    carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<DataStation> data = context.watch<List<DataStation>>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            if (context.read<DataStationNotifier>().currentIndex > 0) {
              carouselController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            }
          },
          icon: const Icon(Icons.arrow_back_ios),
          padding: const EdgeInsets.all(0),
        ),
        Expanded(
          child: SizedBox(
            height: 220,
            child: PageView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => CardDataStation(
                data: data[index],
              ),
              controller: carouselController,
              onPageChanged: (index) =>
                  context.read<DataStationNotifier>().currentIndex = index,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            if (context.read<DataStationNotifier>().currentIndex <
                data.length - 1) {
              carouselController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            }
          },
          icon: const Icon(Icons.arrow_forward_ios),
          padding: const EdgeInsets.all(0),
        ),
      ],
    );
  }
}

class _DotRow extends StatelessWidget {
  const _DotRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final number = context.watch<List<DataStation>>().length;
    final currentIndex = context.select(
      (DataStationNotifier n) => n.currentIndex,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        number,
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
    );
  }
}
