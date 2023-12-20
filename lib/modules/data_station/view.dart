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
import 'package:snow_weather_info/provider/favorite_station.dart';
import 'package:snow_weather_info/provider/station_data.dart';

part 'view.g.dart';

@Riverpod(dependencies: [])
List<DataStation> currentDataStation(Ref ref) {
  throw UnimplementedError();
}

@riverpod
Station currentStation(Ref ref) {
  throw UnimplementedError();
}

@riverpod
class _CurrentIndex extends _$CurrentIndex {
  @override
  int build() {
    return 0;
  }

  // ignore: use_setters_to_change_properties
  void setIndex(int index) {
    state = index;
  }
}

@Riverpod(dependencies: [currentDataStation])
class _CurrentIndexData extends _$CurrentIndexData {
  @override
  DataStation? build() {
    final index = ref.watch(_currentIndexProvider);
    try {
      return ref.watch(currentDataStationProvider)[index];
      // ignore: avoid_catching_errors
    } on RangeError catch (_) {
      return null;
    }
  }
}

@riverpod
bool _isFavorite(Ref ref, int id) {
  final favorites = ref.watch(favoriteStationProvider);
  return favorites.any(
    (element) => switch (element) {
      final Station st => st.id == id,
      _ => false,
    },
  );
}

class DataStationView extends ConsumerWidget {
  const DataStationView({
    required this.station,
    super.key,
  });
  final Station station;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        currentDataStationProvider.overrideWith(
          (ref) => ref
              .watch(stationDataProvider.notifier)
              .getDataOfStation(station.id),
        ),
        currentStationProvider.overrideWithValue(station),
      ],
      child: const _InnerView(),
    );
  }
}

class _InnerView extends ConsumerWidget {
  const _InnerView();

  String _formatDataToString(WidgetRef ref) {
    final displayData = ref.read(_currentIndexDataProvider);
    final station = ref.read(currentStationProvider);

    if (displayData != null) {
      String ret =
          "Station ${station.name} (${station.altitude}m) au ${DateFormat('dd-MM-yyyy à kk:mm').format(displayData.date)}\n";

      if (displayData.temperature != null) {
        ret += 'Température: ${displayData.temperature!.toStringTemperature}\n';
      }
      if (displayData.snowHeight != null) {
        ret +=
            'Hauteur de neige: ${displayData.snowHeight!.toStringSnowHeigth}\n';
      }
      if (displayData.snowNewHeight != null) {
        ret +=
            'Hauteur de neige fraiches: ${displayData.snowNewHeight!.toStringSnowHeigth}\n';
      }

      return ret;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayData = ref.watch(_currentIndexDataProvider);
    final station = ref.watch(currentStationProvider);
    final isFavorite = ref.watch(
      _isFavoriteProvider(station.id),
    );

    return SafeArea(
      child: Scaffold(
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
              onPressed: () => ref
                  .read(favoriteStationProvider.notifier)
                  .addOrRemoveFavoriteStation(
                    station,
                  ),
            ),
            if (displayData != null)
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () => Share.share(
                  _formatDataToString(ref),
                ),
              ),
          ],
        ),
        body: displayData != null
            ? const _Body()
            : const Center(
                child: Text('Pas de donnée pour cette station météo'),
              ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.background,
      child: const Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _DataView(),
                  _DotRow(),
                  DataStationChart(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Informations créées à partir de données de Météo-France',
              style: TextStyle(
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
    final data = ref.watch(currentDataStationProvider);

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
          padding: EdgeInsets.zero,
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
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}

class _DotRow extends ConsumerWidget {
  const _DotRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final number = ref.watch(currentDataStationProvider).length;
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
