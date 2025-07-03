import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster_plus/flutter_map_marker_cluster_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/core/notifier/location.dart';
import 'package:snow_weather_info/data/constant_data_list.dart';
import 'package:snow_weather_info/data/sources/api/avalanche_api.dart';
import 'package:snow_weather_info/data/sources/data/preferences.dart';
import 'package:snow_weather_info/model/coordinate.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/modules/map/map_licence_widget.dart';
import 'package:snow_weather_info/modules/map/map_maker.dart';
import 'package:snow_weather_info/provider/station_data.dart';
import 'package:snow_weather_info/provider/stations.dart';
import 'package:snow_weather_info/router/router.dart';

part 'map_widget.g.dart';

final Color _nivoseColor = Colors.blue.shade900;
const Color _stationColor = Colors.black;
const MaterialColor _stationNoDataColor = Colors.grey;
const MaterialColor _avalancheColor = Colors.orange;

@riverpod
class CurrentMapLoc extends _$CurrentMapLoc {
  @override
  Coordinate build() {
    return const Coordinate(latitude: 45.05, longitude: 6.3);
  }

  // ignore: use_setters_to_change_properties
  void setLocation(Coordinate value) {
    state = value;
  }
}

class MapWidget extends ConsumerWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stations = ref.watch(stationsProvider).asData?.value ?? [];
    final feeds = ref.watch(apiAvalancheProvider).asData?.value;

    return _InnerView(
      stations: stations,
      feeds: feeds,
    );
  }
}

class _InnerView extends ConsumerStatefulWidget {
  const _InnerView({
    required this.stations,
    this.feeds,
  });

  final List<Station> stations;
  final AtomFeed? feeds;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __InnerViewState();
}

class __InnerViewState extends ConsumerState<_InnerView> {
  final _mapController = MapController();
  final _listStationMarker = <Marker>[];
  final _listNivoseMarker = <Marker>[];
  final _listAvalancheMarker = <Marker>[];
  final _listStationNoDataMarker = <Marker>[];

  @override
  void initState() {
    super.initState();
    _updateMakerList();
    ServicesBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _updateUserLocation();
      }
    });
  }

  @override
  void didUpdateWidget(covariant _InnerView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.feeds != widget.feeds ||
        !listEquals(oldWidget.stations, widget.stations)) {
      _updateMakerList();
    }
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  void _updateMakerList() {
    final nivoses = ConstantDatalist.listNivose;

    _listNivoseMarker.clear();
    for (final nivose in nivoses) {
      _listNivoseMarker.add(
        Marker(
          width: 90,
          height: 50,
          point: nivose.position.toLatLng(),
          child: MapMaker(
            icon: const Icon(Icons.place),
            color: _nivoseColor,
            onPressed: () {
              ref
                  .read(currentMapLocProvider.notifier)
                  .setLocation(nivose.position);

              context.goNamed(
                AppRoute.detailMapSt.name,
                extra: nivose,
              );
            },
          ),
        ),
      );
    }

    _listStationMarker.clear();
    _listStationNoDataMarker.clear();
    final dataProvider = ref.read(stationDataProvider.notifier);
    for (final station in widget.stations) {
      final hasData = dataProvider.hasData(
        station.id,
      );

      if (hasData) {
        _listStationMarker.add(
          Marker(
            width: 90,
            height: 50,
            point: station.position.toLatLng(),
            child: MapMaker(
              icon: const Icon(Icons.place),
              color: _stationColor,
              lastSnowHeight: dataProvider.lastSnowHeight(
                station.id,
              ),
              onPressed: () {
                ref
                    .read(currentMapLocProvider.notifier)
                    .setLocation(station.position);

                context.goNamed(
                  AppRoute.detailMapSt.name,
                  extra: station,
                );
              },
            ),
          ),
        );
      } else {
        _listStationNoDataMarker.add(
          Marker(
            width: 90,
            height: 50,
            point: station.position.toLatLng(),
            child: const MapMaker(
              icon: Icon(Icons.place),
              color: _stationNoDataColor,
            ),
          ),
        );
      }
    }

    _listAvalancheMarker.clear();
    widget.feeds?.items.forEach(
      (AtomItem item) {
        final lat = item.geo?.lat;
        final long = item.geo?.long;
        if (lat != null && long != null) {
          _listAvalancheMarker.add(
            Marker(
              width: 90,
              height: 50,
              point: LatLng(lat, long),
              child: MapMaker(
                icon: const Icon(Icons.ac_unit),
                color: _avalancheColor,
                onPressed: () {
                  ref
                      .read(currentMapLocProvider.notifier)
                      .setLocation(
                        Coordinate(
                          latitude: lat,
                          longitude: long,
                        ),
                      );

                  context.goNamed(
                    AppRoute.detailMapAv.name,
                    extra: item,
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }

  Future<void> _updateUserLocation() async {
    final userLocation = await ref
        .read(
          userLocationProvider.notifier,
        )
        .updateLocation();

    if (userLocation != null) {
      _mapController.move(userLocation, 10);
    }
  }

  Future<void> _showMapSettings() {
    return showDialog(
      context: context,
      builder: (BuildContext context) => const _MapSettingDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentMapLoc = ref.watch(currentMapLocProvider);
    final showNoDataStations = ref.watch(showNoDataStationSettingsProvider);
    final userLocation = ref.watch(userLocationProvider).asData?.value;
    final showClusterLayer = ref.watch(showClusterLayerSettingsProvider);

    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: userLocation ?? currentMapLoc.toLatLng(),
            initialZoom: 10,
            maxZoom: 16,
            minZoom: 8,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png',
            ),
            const MapLicenceWidget(),
            if (_listStationMarker.isNotEmpty)
              _MakerLayer(
                markers: _listStationMarker,
                color: _stationColor,
                showClusterLayer: showClusterLayer,
              ),
            if (_listStationNoDataMarker.isNotEmpty && showNoDataStations)
              _MakerLayer(
                markers: _listStationNoDataMarker,
                color: _stationNoDataColor,
                showClusterLayer: showClusterLayer,
              ),
            if (_listNivoseMarker.isNotEmpty)
              _MakerLayer(
                markers: _listNivoseMarker,
                color: _nivoseColor,
                showClusterLayer: showClusterLayer,
              ),
            if (_listAvalancheMarker.isNotEmpty)
              _MakerLayer(
                markers: _listAvalancheMarker,
                color: _avalancheColor,
                showClusterLayer: showClusterLayer,
              ),
            if (userLocation != null)
              MarkerLayer(
                markers: [
                  Marker(
                    point: userLocation,
                    child: const Icon(
                      Icons.person_pin,
                      color: Colors.blue,
                      size: 32,
                    ),
                  ),
                ],
              ),
          ],
        ),
        Positioned(
          top: 80,
          right: 20,
          child: FloatingActionButton(
            onPressed: _updateUserLocation,
            child: const Icon(
              Icons.gps_fixed_rounded,
              size: 28,
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 20,
          child: FloatingActionButton(
            onPressed: _showMapSettings,
            child: const Icon(
              Icons.settings_outlined,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }
}

class _MakerLayer extends StatelessWidget {
  const _MakerLayer({
    required this.markers,
    required this.color,
    required this.showClusterLayer,
  });

  final List<Marker> markers;
  final Color color;
  final bool showClusterLayer;

  @override
  Widget build(BuildContext context) {
    return showClusterLayer
        ? MarkerClusterLayerWidget(
            options: MarkerClusterLayerOptions(
              markers: markers,
              polygonOptions: const PolygonOptions(
                borderColor: Colors.transparent,
                color: Colors.transparent,
              ),
              builder: (context, markers) {
                return FloatingActionButton(
                  backgroundColor: color,
                  onPressed: null,
                  child: Text(
                    markers.length.toString(),
                    style: TextStyle(
                      color:
                          ThemeData.estimateBrightnessForColor(color) ==
                              Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                );
              },
            ),
          )
        : MarkerLayer(markers: markers);
  }
}

class _MapSettingDialog extends ConsumerWidget {
  const _MapSettingDialog();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Parmètres de la carte'),
            const SizedBox(height: 12),
            SwitchListTile(
              title: const Text('Afficher les stations sans données: '),
              value: ref.watch(showNoDataStationSettingsProvider),
              onChanged: (_) =>
                  ref.read(showNoDataStationSettingsProvider.notifier).update(),
            ),
            SwitchListTile(
              title: const Text('Regrouper les icones de la carte: '),
              value: ref.watch(showClusterLayerSettingsProvider),
              onChanged: (_) =>
                  ref.read(showClusterLayerSettingsProvider.notifier).update(),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Fermé'),
            ),
          ],
        ),
      ),
    );
  }
}
