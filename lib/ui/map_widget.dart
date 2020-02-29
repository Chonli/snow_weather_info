import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import 'package:snow_weather_info/data/repository.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/ui/detail_station_page.dart';
import 'package:snow_weather_info/ui/map_licence_widget.dart';

class MapWidget extends StatefulWidget {
  final Repository repository;
  const MapWidget(this.repository);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final MapController _mapController = MapController();
  final List<Marker> _listStationMarker = List<Marker>();
  final Location _location = Location();
  final double _zoom = 10.0;
  List<Station> _listStation;

  Repository get repository => widget.repository;

  @override
  void initState() {
    _mapController.onReady.then((result) {
      _getLocation();
    });
    _listStation = repository.stations;
    super.initState();
  }

  _getLocation() async {
    var hasPermission = await _location.hasPermission();
    if (!hasPermission) {
      hasPermission = await _location.requestPermission();
    }

    if (hasPermission) {
      var loc = await _location.getLocation();
      var currentLocation = LatLng(loc.latitude, loc.longitude);

      setState(() {
        _listStationMarker.add(Marker(
            width: 50.0,
            height: 50.0,
            point: currentLocation,
            builder: (ctx) => Icon(
                  Icons.person_pin_circle,
                  color: Colors.blueAccent,
                )));

        _mapController.move(currentLocation, _zoom);
      });
    }
  }

  void _initMakerList(List<Station> list) {
    if (list == null) return;
    for (var st in list) {
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
                child: st.hasData
                    ? Text("${(st.lastSnowHeight * 100).toStringAsFixed(0)}cm")
                    : Container(),
              ),
              Positioned(
                right: 0.0,
                bottom: 2.0,
                child: IconButton(
                  icon: Icon(Icons.place),
                  color: st.hasData ? Colors.black : Colors.grey,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailStationPage(
                        st,
                      ),
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

  @override
  Widget build(BuildContext context) {
    _initMakerList(_listStation);

    if (_listStation == null) return Container();

    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            center: LatLng(45.05, 6.3),
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
                  onPressed: () async => await _getLocation()),
            ),
          ),
        ),
      ],
    );
  }
}
