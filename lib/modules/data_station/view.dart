import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/extensions/double.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/modules/data_station/card.dart';
import 'package:snow_weather_info/modules/data_station/chart.dart';

final dataListProvider =
    StateProvider.autoDispose<List<DataStation>>((ref) => []);
final _currentIndexProvider = StateProvider.autoDispose<int>((ref) => 0);

class DataStationView extends ConsumerStatefulWidget {
  const DataStationView({
    super.key,
    required this.station,
  });
  final Station station;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DataStationViewState();
}

class _DataStationViewState extends ConsumerState<DataStationView> {
  @override
  void initState() {
    super.initState();
    final notifier = ref.read(dataNotifier);
    notifier.currentMapLoc = widget.station.position;
    ref.read(dataListProvider.notifier).state =
        notifier.getDataOfStation(widget.station.id);
  }

  String _formatDataToString() {
    final currentIndex = ref.read(_currentIndexProvider);
    final displayData = ref.read(dataListProvider)[currentIndex];

    String ret =
        "Station ${widget.station.name} (${widget.station.altitude}m) au ${DateFormat('dd-MM-yyyy à kk:mm').format(displayData.date)}\n";
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
    final dataIsNotEmpty = ref.watch(dataListProvider).isNotEmpty;
    final isFavorite = ref.watch(
      dataNotifier.select(
        (notifier) => notifier.isFavorite(widget.station),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.station.name,
            ),
            Text(
              ' (${widget.station.altitude}m)',
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () => ref.read(dataNotifier).addOrRemoveFavoriteStation(
                  widget.station,
                ),
          ),
          if (dataIsNotEmpty)
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () => Share.share(
                _formatDataToString(),
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
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
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
                color: Theme.of(context).textTheme.titleLarge?.color,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DataView extends ConsumerStatefulWidget {
  const _DataView();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __DataViewState();
}

class __DataViewState extends ConsumerState<_DataView> {
  late final carouselController = PageController();

  @override
  void dispose() {
    carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(dataListProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            if (ref.read(_currentIndexProvider) > 0) {
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
                  ref.read(_currentIndexProvider.notifier).state = index,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            if (ref.read(_currentIndexProvider) < data.length - 1) {
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

class _DotRow extends ConsumerWidget {
  const _DotRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final number = ref.watch(dataListProvider).length;
    final currentIndex = ref.watch(_currentIndexProvider);

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
