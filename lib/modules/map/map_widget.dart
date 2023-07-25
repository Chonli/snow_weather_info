// import 'package:user_location/user_location.dart';
//import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snow_weather_info/core/notifier/location.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/data/sources/preferences.dart';
import 'package:snow_weather_info/modules/data_station/view.dart';
import 'package:snow_weather_info/modules/map/map_licence_widget.dart';
import 'package:snow_weather_info/modules/map/map_maker.dart';
import 'package:snow_weather_info/ui/nivose_page.dart';

final nivoseColor = Colors.blue.shade900;
const stationColor = Colors.black;
const stationNoDataColor = Colors.grey;
const avalancheColor = Colors.orange;

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
    _updateUserLocation();
    _initMakerList();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  void _initMakerList() {
    final nivoses = ref.read(dataNotifier).nivoses;

    for (var nivose in nivoses) {
      _listNivoseMarker.add(
        Marker(
          width: 90,
          height: 50,
          point: nivose.position,
          builder: (ctx) => MapMaker(
            icon: const Icon(Icons.place),
            color: nivoseColor,
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

    final stations = ref.read(dataNotifier).stations;
    for (var station in stations) {
      if (station.hasData) {
        _listStationMarker.add(
          Marker(
            width: 90,
            height: 50,
            point: station.position,
            builder: (ctx) => MapMaker(
              icon: const Icon(Icons.place),
              color: stationColor,
              lastSnowHeight: station.lastSnowHeight,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute<Widget>(
                  builder: (context) => DataStationView(station: station),
                ),
              ),
            ),
          ),
        );
      } else {
        _listStationNoDataMarker.add(
          Marker(
            width: 90,
            height: 50,
            point: station.position,
            builder: (ctx) => const MapMaker(
              icon: Icon(Icons.place),
              color: stationNoDataColor,
            ),
          ),
        );
      }
    }

    // TODO(APA): migrate
    //   final feed = ref.read(dataNotifier).avalancheFeed;
    //   feed?.items.forEach(
    //     (AtomItem item) {
    //       if (item.geo != null) {
    //         _listAvalancheMarker.add(
    //           Marker(
    //             width: 90,
    //             height: 50,
    //             point: LatLng(item.geo?.lat ?? 0, item.geo?.long ?? 0),
    //             builder: (ctx) => MapMaker(
    //               icon: const Icon(Icons.ac_unit),
    //               color: avalancheColor,
    //               onPressed: () => Navigator.push(
    //                 context,
    //                 MaterialPageRoute<Widget>(
    //                   builder: (context) => AppWebPage(
    //                     title: item.shortTitle,
    //                     url: item.url,
    //                     canIsOpen: true,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         );
    //       }
    //     },
    //   );
  }

  Future<void> _updateUserLocation() async {
    final notifier = ref.read(locationNotifier);
    await notifier.updateLocation();
    final userLocation = notifier.userLocation;
    if (userLocation != null) {
      _mapController.move(userLocation, 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentMapLoc = ref.watch(
      dataNotifier.select(
        (n) => n.currentMapLoc,
      ),
    );
    final showNoDataStations = ref.watch(showNoDataStationSettingsProvider);

    final userLocation = ref.watch(
      locationNotifier.select(
        (n) => n.userLocation,
      ),
    );

    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            center: userLocation ?? currentMapLoc,
            zoom: 10,
            maxZoom: 16,
            minZoom: 8,
          ),
          nonRotatedChildren: <Widget>[
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
            AttributionWidget(
              attributionBuilder: (context) => const MapLicenceWidget(),
            ),
          ],
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png',
              subdomains: const ['a', 'b', 'c'],
            ),
            if (_listStationMarker.isNotEmpty)
              _MakerLayer(
                markers: _listStationMarker,
                color: stationColor,
              ),
            if (_listStationNoDataMarker.isNotEmpty && showNoDataStations)
              _MakerLayer(
                markers: _listStationNoDataMarker,
                color: stationNoDataColor,
              ),
            if (_listNivoseMarker.isNotEmpty)
              _MakerLayer(
                markers: _listNivoseMarker,
                color: nivoseColor,
              ),
            if (_listAvalancheMarker.isNotEmpty)
              _MakerLayer(
                markers: _listAvalancheMarker,
                color: avalancheColor,
              ),
            if (userLocation != null)
              MarkerLayer(
                markers: [
                  Marker(
                    point: userLocation,
                    builder: (context) => const Icon(
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
