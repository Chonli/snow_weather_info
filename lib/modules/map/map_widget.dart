import 'package:dart_rss/dart_rss.dart';
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

class MapWidget extends ConsumerStatefulWidget {
  const MapWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends ConsumerState<MapWidget> {
  final _mapController = MapController();
  final _listStationMarker = <Marker>[];
  final _listNivoseMarker = <Marker>[];
  final _listAvalancheMarker = <Marker>[];
  final _listStationNoDataMarker = <Marker>[];

  @override
  void initState() {
    super.initState();
    _initMakerList();
    ServicesBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _updateUserLocation();
      }
    });
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  void _initMakerList() {
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

    final stations = ref.read(stationsProvider).asData?.value ?? [];
    for (var station in stations) {
      final hasData = ref.watch(stationDataProvider.notifier).hasData(
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
                lastSnowHeight: station.lastSnowHeight,
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

    final feed = ref.read(apiAvalancheProvider).asData?.value;
    feed?.items.forEach(
      (AtomItem item) {
        if (item.geo != null) {
          _listAvalancheMarker.add(
            Marker(
              width: 90,
              height: 50,
              point: LatLng(item.geo?.lat ?? 0, item.geo?.long ?? 0),
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
            const MapLicenceWidget(),
            TileLayer(
              urlTemplate: 'https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png',
              subdomains: const ['a', 'b', 'c'],
            ),
            if (_listStationMarker.isNotEmpty)
              _MakerLayer(
                markers: _listStationMarker,
                color: _stationColor,
              ),
            if (_listStationNoDataMarker.isNotEmpty && showNoDataStations)
              _MakerLayer(
                markers: _listStationNoDataMarker,
                color: _stationNoDataColor,
              ),
            if (_listNivoseMarker.isNotEmpty)
              _MakerLayer(
                markers: _listNivoseMarker,
                color: _nivoseColor,
              ),
            if (_listAvalancheMarker.isNotEmpty)
              _MakerLayer(
                markers: _listAvalancheMarker,
                color: _avalancheColor,
              ),
            MarkerLayer(
              markers: [
                if (userLocation != null)
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
        const Positioned(
          bottom: 0,
          right: 0,
          child: MapLicenceWidget(),
        ),
      ],
    );
  }
}

class _MakerLayer extends ConsumerWidget {
  const _MakerLayer({
    required this.markers,
    required this.color,
  });

  final List<Marker> markers;
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showClusterLayer = ref.watch(showClusterLayerSettingsProvider);

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
