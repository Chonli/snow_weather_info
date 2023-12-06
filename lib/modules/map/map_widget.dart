import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/core/notifier/location.dart';
import 'package:snow_weather_info/core/widgets/app_web_page.dart';
import 'package:snow_weather_info/data/constant_data_list.dart';
import 'package:snow_weather_info/data/sources/avalanche_api.dart';
import 'package:snow_weather_info/data/sources/preferences.dart';
import 'package:snow_weather_info/extensions/atom_item.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/modules/data_station/view.dart';
import 'package:snow_weather_info/modules/map/map_licence_widget.dart';
import 'package:snow_weather_info/modules/map/map_maker.dart';
import 'package:snow_weather_info/modules/nivose/nivose_page.dart';
import 'package:snow_weather_info/provider/station_data.dart';
import 'package:snow_weather_info/provider/stations.dart';

part 'map_widget.g.dart';

final _nivoseColor = Colors.blue.shade900;
const _stationColor = Colors.black;
const _stationNoDataColor = Colors.grey;
const _avalancheColor = Colors.orange;

@riverpod
class CurrentMapLoc extends _$CurrentMapLoc {
  @override
  LatLng build() {
    return const LatLng(45.05, 6.3);
  }

  void setLocation(LatLng value) {
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

    for (var nivose in nivoses) {
      _listNivoseMarker.add(
        Marker(
          width: 90,
          height: 50,
          point: nivose.position,
          child: MapMaker(
            icon: const Icon(Icons.place),
            color: _nivoseColor,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<Widget>(
                builder: (context) => NivosePage(nivose: nivose),
              ),
            ),
          ),
        ),
      );
    }

    for (var station in widget.stations) {
      final dataProvider = ref.read(stationDataProvider.notifier);
      final hasData = dataProvider.hasData(
        station.id,
      );

      if (hasData) {
        _listStationMarker.add(
          Marker(
            width: 90,
            height: 50,
            point: station.position,
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

                  Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(
                      builder: (context) => DataStationView(station: station),
                    ),
                  );
                }),
          ),
        );
      } else {
        _listStationNoDataMarker.add(
          Marker(
            width: 90,
            height: 50,
            point: station.position,
            child: const MapMaker(
              icon: Icon(Icons.place),
              color: _stationNoDataColor,
            ),
          ),
        );
      }
    }

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
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute<Widget>(
                    builder: (context) => AppWebPage(
                      title: item.shortTitle,
                      url: item.url,
                      canIsOpen: true,
                    ),
                  ),
                ),
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
            initialCenter: userLocation ?? currentMapLoc,
            initialZoom: 10,
            maxZoom: 16,
            minZoom: 8,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png',
              subdomains: const ['a', 'b', 'c'],
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
          top: 20,
          right: 20,
          child: FloatingActionButton(
            backgroundColor: Colors.grey,
            onPressed: () => _updateUserLocation(),
            child: const Icon(
              Icons.gps_fixed_rounded,
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
                      color: ThemeData.estimateBrightnessForColor(color) ==
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
