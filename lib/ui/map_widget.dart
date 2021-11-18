// import 'package:user_location/user_location.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/core/notifier/preference.dart';
import 'package:snow_weather_info/core/widgets/app_web_page.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/extensions/atom_item.dart';
import 'package:snow_weather_info/modules/data_station/view.dart';
import 'package:snow_weather_info/ui/map_licence_widget.dart';
import 'package:snow_weather_info/ui/map_maker.dart';
import 'package:snow_weather_info/ui/nivose_page.dart';

final nivoseColor = Colors.blue.shade900;
const stationColor = Colors.black;
const stationNoDataColor = Colors.grey;
const avalancheColor = Colors.orange;

class MapWidget extends StatefulWidget {
  const MapWidget({
    Key? key,
  }) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late MapController _mapController;
  final _listStationMarker = <Marker>[];
  final _listNivoseMarker = <Marker>[];
  final _listAvalancheMarker = <Marker>[];
  final _listStationNoDataMarker = <Marker>[];
  // UserLocationOptions _userLocationOptions;
  //final _userMarkers = <Marker>[];

  @override
  void initState() {
    super.initState();

    _mapController = MapController();
    // _userLocationOptions = UserLocationOptions(
    //   context: context,
    //   mapController: _mapController,
    //   markers: _userMarkers,
    //   fabBottom: 40,
    //   defaultZoom: 12,
    //   onLocationUpdate: (pos) =>
    //       context.read<DataNotifier>().currentMapLoc = pos,
    //   updateMapLocationOnPositionChange: false,
    //   showHeading: false,
    // );
    _initMakerList(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _initMakerList(BuildContext context) {
    final nivoses = context.read<DataNotifier>().nivoses;

    nivoses.forEach(
      (nivose) {
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
      },
    );

    final stations = context.read<DataNotifier>().stations;
    stations.forEach(
      (station) {
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
      },
    );

    final feed = context.read<DataNotifier>().avalancheFeed;
    feed?.items.forEach(
      (AtomItem item) {
        if (item.geo != null) {
          _listAvalancheMarker.add(
            Marker(
              width: 90,
              height: 50,
              point: LatLng(item.geo?.lat ?? 0, item.geo?.long ?? 0),
              builder: (ctx) => MapMaker(
                icon: const Icon(Icons.ac_unit),
                color: avalancheColor,
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

  @override
  Widget build(BuildContext context) {
    final currentMapLoc = context.select<DataNotifier, LatLng>(
      (n) => n.currentMapLoc,
    );
    final showNoDataStations = context.select<PreferenceNotifier, bool>(
      (n) => n.viewNoDataStation,
    );

    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            center: currentMapLoc,
            zoom: 10,
            maxZoom: 16,
            minZoom: 8,
            plugins: [
              // UserLocationPlugin(),
              MarkerClusterPlugin(),
            ],
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: 'https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
            if (_listStationMarker.isNotEmpty)
              MarkerClusterLayerOptions(
                markers: _listStationMarker,
                polygonOptions: const PolygonOptions(
                  borderColor: stationColor,
                  color: stationColor,
                  borderStrokeWidth: 3,
                ),
                builder: (context, markers) {
                  return FloatingActionButton(
                    backgroundColor: stationColor,
                    onPressed: null,
                    child: Text(markers.length.toString()),
                  );
                },
              ),
            if (_listStationNoDataMarker.isNotEmpty && showNoDataStations)
              MarkerClusterLayerOptions(
                markers: _listStationNoDataMarker,
                polygonOptions: const PolygonOptions(
                  borderColor: stationNoDataColor,
                  color: stationNoDataColor,
                  borderStrokeWidth: 3,
                ),
                builder: (context, markers) {
                  return FloatingActionButton(
                    backgroundColor: stationNoDataColor,
                    onPressed: null,
                    child: Text(markers.length.toString()),
                  );
                },
              ),
            if (_listNivoseMarker.isNotEmpty)
              MarkerClusterLayerOptions(
                markers: _listNivoseMarker,
                polygonOptions: PolygonOptions(
                  borderColor: nivoseColor,
                  color: nivoseColor,
                  borderStrokeWidth: 3,
                ),
                builder: (context, markers) {
                  return FloatingActionButton(
                    backgroundColor: nivoseColor,
                    onPressed: null,
                    child: Text(markers.length.toString()),
                  );
                },
              ),
            if (_listAvalancheMarker.isNotEmpty)
              MarkerClusterLayerOptions(
                markers: _listAvalancheMarker,
                polygonOptions: const PolygonOptions(
                  borderColor: avalancheColor,
                  color: avalancheColor,
                  borderStrokeWidth: 2,
                ),
                builder: (context, markers) {
                  return FloatingActionButton(
                    backgroundColor: avalancheColor,
                    onPressed: null,
                    child: Text(markers.length.toString()),
                  );
                },
              ),
            //user location
            // MarkerLayerOptions(markers: _userMarkers),
            // _userLocationOptions,
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
