import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/ui/data_station_page.dart';
import 'package:snow_weather_info/ui/map_licence_widget.dart';
import 'package:snow_weather_info/ui/nivose_page.dart';

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

  final double _zoom = 10;
  bool onlyOne = true;

  @override
  void initState() {
    super.initState();
    final notifier = context.read<DataNotifier>();
    _mapController = MapController();
    _mapController.onReady.then((_) async {
      if (_mapController != null) {
        final isFristLaunch = notifier.currentUserLoc == null;
        final hasPosition = await notifier.updateLocation();

        if (hasPosition && notifier.currentUserLoc != null) {
          setState(() {
            _listStationMarker.add(
              Marker(
                width: 50,
                height: 50,
                point: notifier.currentUserLoc,
                builder: (ctx) => Icon(
                  Icons.person_pin_circle,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
            if (isFristLaunch) {
              notifier.currentMapLoc = notifier.currentUserLoc;
              _mapController.move(notifier.currentMapLoc, _zoom);
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _mapController = null;
    super.dispose();
  }

  void _initMakerList(DataNotifier notifier) {
    if (onlyOne) {
      onlyOne = false;
      final list = <AbstractStation>[];
      list.addAll(notifier.stations);
      list.addAll(notifier.nivoses);
      for (final st in list) {
        bool hasData = false;
        Color color = Theme.of(context).primaryColor;
        double lastSnowHeight = 0;
        if (st is Station) {
          hasData = st.hasData;
          color = hasData ? Colors.black : Colors.grey;
          lastSnowHeight = st.lastSnowHeight;
        }

        _listStationMarker.add(
          Marker(
            width: 90,
            height: 50,
            point: st.position,
            builder: (ctx) => Stack(
              children: <Widget>[
                Positioned(
                  left: 42.0,
                  bottom: 0.0,
                  child: Visibility(
                      visible: hasData,
                      child: Text(
                        '${(lastSnowHeight * 100).toStringAsFixed(0)}cm',
                        style: const TextStyle(color: Colors.black),
                      )),
                ),
                Positioned(
                  right: 0,
                  bottom: 2,
                  child: IconButton(
                    icon: const Icon(Icons.place),
                    color: color,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute<Widget>(
                        builder: (context) => st is Station
                            ? DataStationPage(st)
                            : NivosePage(st as Nivose),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<DataNotifier>();
    _initMakerList(notifier);

    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            center: notifier.currentMapLoc,
            zoom: _zoom,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: 'https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerLayerOptions(
              markers: _listStationMarker,
            ),
          ],
        ),
        const Positioned(
          bottom: 0,
          right: 0,
          child: MapLicenceWidget(),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Opacity(
            opacity: 0.7,
            child: Container(
              height: 40,
              width: 40,
              color: Theme.of(context).backgroundColor,
              child: IconButton(
                icon: const Icon(Icons.my_location),
                onPressed: () async {
                  final hasPosition = await notifier.updateLocation();

                  if (hasPosition && notifier.currentUserLoc != null) {
                    notifier.currentMapLoc = notifier.currentUserLoc;
                    setState(() {
                      _mapController.move(notifier.currentMapLoc, _zoom);
                    });
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
