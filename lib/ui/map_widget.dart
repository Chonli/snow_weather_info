import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/model/extensions.dart';
import 'package:snow_weather_info/modules/data_station/view.dart';
import 'package:snow_weather_info/ui/map_licence_widget.dart';
import 'package:snow_weather_info/ui/nivose_page.dart';
import 'package:url_launcher/url_launcher.dart' as url;
import 'package:user_location/user_location.dart';
import 'package:webfeed/webfeed.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    Key key,
  }) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  MapController _mapController;
  final _listStationMarker = <Marker>[];
  final _listNivoseMarker = <Marker>[];
  final _listAvalancheMarker = <Marker>[];
  UserLocationOptions _userLocationOptions;
  final _userMarkers = <Marker>[];

  @override
  void initState() {
    super.initState();

    _mapController = MapController();
    _userLocationOptions = UserLocationOptions(
      context: context,
      mapController: _mapController,
      markers: _userMarkers,
      fabBottom: 40,
      defaultZoom: 12,
      onLocationUpdate: (pos) =>
          context.read<DataNotifier>().currentMapLoc = pos,
      updateMapLocationOnPositionChange: false,
      showHeading: false,
    );
    _initMakerList(context);
  }

  @override
  void dispose() {
    _mapController = null;
    super.dispose();
  }

  void _initMakerList(BuildContext context) {
    final nivoses = context.read<DataNotifier>().nivoses;

    nivoses?.forEach(
      (nivose) {
        _listNivoseMarker.add(
          Marker(
            width: 90,
            height: 50,
            point: nivose.position,
            builder: (ctx) => IconButton(
              icon: const Icon(Icons.place),
              color: Colors.blue[900],
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute<Widget>(
                  builder: (context) => NivosePage(nivose),
                ),
              ),
            ),
          ),
        );
      },
    );

    final stations = context.read<DataNotifier>().stations;
    stations?.forEach(
      (station) {
        final color = station.hasData ? Colors.black : Colors.grey;
        _listStationMarker.add(
          Marker(
            width: 90,
            height: 50,
            point: station.position,
            builder: (ctx) => Stack(
              children: <Widget>[
                if (station.hasData)
                  Positioned(
                    left: 42,
                    bottom: 0,
                    child: Text(
                      '${(station.lastSnowHeight * 100).toStringAsFixed(0)}cm',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                Positioned(
                  right: 0,
                  bottom: 2,
                  child: IconButton(
                    icon: const Icon(Icons.place),
                    color: color,
                    onPressed: () => station.hasData
                        ? Navigator.push(
                            context,
                            MaterialPageRoute<Widget>(
                              builder: (context) =>
                                  DataStationView(station: station),
                            ),
                          )
                        : null,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    final feed = context.read<DataNotifier>().avalancheFeed;
    feed?.items?.forEach(
      (AtomItem item) {
        if (item.geo != null) {
          _listAvalancheMarker.add(
            Marker(
              width: 90,
              height: 50,
              point: LatLng(item.geo.lat, item.geo.long),
              builder: (ctx) => IconButton(
                icon: const Icon(Icons.ac_unit),
                color: Colors.orange,
                onPressed: () async {
                  if (item.url != null && await url.canLaunch(item.url)) {
                    url.launch(item.url);
                  }
                },
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
              UserLocationPlugin(),
            ],
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: 'https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
            if (_listStationMarker.isNotEmpty)
              MarkerLayerOptions(
                markers: _listStationMarker,
              ),
            if (_listNivoseMarker.isNotEmpty)
              MarkerLayerOptions(
                markers: _listNivoseMarker,
              ),
            if (_listAvalancheMarker.isNotEmpty)
              MarkerLayerOptions(
                markers: _listAvalancheMarker,
              ),
            //user location
            MarkerLayerOptions(markers: _userMarkers),
            _userLocationOptions,
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
