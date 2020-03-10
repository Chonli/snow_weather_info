import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/repository.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/ui/data_station_page.dart';
import 'package:snow_weather_info/ui/map_licence_widget.dart';
import 'package:snow_weather_info/ui/nivose_page.dart';

class MapWidget extends StatefulWidget {
  final Repository repository;
  MapWidget(this.repository);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final MapController _mapController = MapController();
  final List<Marker> _listStationMarker = List<Marker>();
  Repository get repository => widget.repository;

  final double _zoom = 10.0;
  bool onlyOne = true;

  @override
  void initState() {
    _mapController.onReady.then((result) async {
      var isFristLaunch = repository.currentUserLoc == null;
      var hasPosition = await repository.updateLocation();

      if (hasPosition && repository.currentUserLoc != null) {
        setState(() {
          _listStationMarker.add(Marker(
              width: 50.0,
              height: 50.0,
              point: repository.currentUserLoc,
              builder: (ctx) => Icon(
                    Icons.person_pin_circle,
                    color: Colors.blueAccent,
                  )));
          if (isFristLaunch) {
            repository.currentMapLoc = repository.currentUserLoc;
            _mapController.move(repository.currentMapLoc, _zoom);
          }
        });
      }
    });
    super.initState();
  }

  void _initMakerList() {
    if (onlyOne) {
      onlyOne = false;
      Repository repository = Provider.of<Repository>(context);
      List<AbstractStation> list = List<AbstractStation>();
      list.addAll(repository.stations);
      list.addAll(repository.nivoses);
      for (var st in list) {
        bool hasData = false;
        Color color = Colors.blue.shade900;
        double lastSnowHeight = 0.0;
        if (st is Station) {
          hasData = st.hasData;
          color = hasData ? Colors.black : Colors.grey;
          lastSnowHeight = st.lastSnowHeight;
        }

        _listStationMarker.add(
          Marker(
            width: 90.0,
            height: 50.0,
            point: st.position,
            builder: (ctx) => Stack(
              children: <Widget>[
                Positioned(
                  left: 40.0,
                  bottom: 0.0,
                  child: hasData
                      ? Text("${(lastSnowHeight * 100).toStringAsFixed(0)}cm")
                      : Container(),
                ),
                Positioned(
                  right: 0.0,
                  bottom: 2.0,
                  child: IconButton(
                    icon: Icon(Icons.place),
                    color: color,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        if (st is Station) {
                          return DataStationPage(
                            st,
                          );
                        } else {
                          return NivosePage(
                            st as Nivose,
                          );
                        }
                      }),
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
    _initMakerList();

    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            center: repository.currentMapLoc,
            zoom: _zoom,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png",
              subdomains: ["a", "b", "c"],
            ),
            MarkerLayerOptions(
              markers: _listStationMarker,
            ),
          ],
        ),
        Positioned(
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
              color: Colors.grey.shade200,
              child: IconButton(
                icon: Icon(Icons.my_location),
                onPressed: () async {
                  var hasPosition = await repository.updateLocation();

                  if (hasPosition && repository.currentUserLoc != null) {
                    repository.currentMapLoc = repository.currentUserLoc;
                    setState(() {
                      _mapController.move(repository.currentMapLoc, _zoom);
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
