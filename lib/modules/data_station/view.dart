import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share/share.dart';
import 'package:snow_weather_info/extensions/double.dart';
import 'package:snow_weather_info/model/data_station.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/modules/data_station/card.dart';
import 'package:snow_weather_info/modules/data_station/chart.dart';
import 'package:snow_weather_info/modules/map/map_widget.dart';
import 'package:snow_weather_info/provider/favorite_station.dart';
import 'package:snow_weather_info/provider/station_data.dart';

part 'view.g.dart';

@Riverpod(keepAlive: false)
class DataList extends _$DataList {
  @override
  List<DataStation> build() {
    return [];
  }

  setDatas(List<DataStation> value) {
    state = value;
  }
}

@Riverpod(keepAlive: false)
class _CurrentIndex extends _$CurrentIndex {
  @override
  int build() {
    return 0;
  }

  void setIndex(int index) {
    state = index;
  }
}

@riverpod
bool _isFavorite(Ref ref, int id) {
  final favorites = ref.watch(favoriteStationProvider);
  return favorites.any(
    (element) => switch (element) {
      Station st => st.id == id,
      _ => false,
    },
  );
}

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

    ref
        .read(currentMapLocProvider.notifier)
        .setLocation(widget.station.position);
    ref.read(dataListProvider.notifier).setDatas(
          ref.read(stationDataProvider.notifier).getDataOfStation(
                widget.station.id,
              ),
        );
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
      _isFavoriteProvider(widget.station.id),
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
            onPressed: () => ref
                .read(favoriteStationProvider.notifier)
                .addOrRemoveFavoriteStation(
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
                  ref.read(_currentIndexProvider.notifier).setIndex(index),
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
