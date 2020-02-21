import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/repository.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/ui/map_licence_widget.dart';
import 'package:snow_weather_info/ui/station_card.dart';
import 'package:snow_weather_info/ui/detail_station_page.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MapController _mapController = MapController();
  final List<Marker> _listStationMarker = List<Marker>();
  final Location _location = Location();
  final double _zoom = 10.0;

  @override
  void initState() {
    print(_listStationMarker.length);
    _mapController.onReady.then((result) {
      _getLocation();
    });

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

  @override
  Widget build(BuildContext context) {
    final Repository repository = Provider.of<Repository>(context);
    var list = repository.getStations();
    _initMakerList(list);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            tabs: [
              Tab(text: "Liste", icon: Icon(Icons.list)),
              Tab(text: "Carte", icon: Icon(Icons.map)),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            _listBody(list),
            _mapBody(list),
          ],
        ),
      ),
    );
  }

  Widget _listBody(List<Station> list) {
    if (list == null) return Container();
    return ListView.builder(
      key: PageStorageKey("station_list_key"),
      itemCount: list.length,
      itemBuilder: (context, index) => StationCard(list[index]),
    );
  }

  Widget _mapBody(List<Station> list) {
    if (list == null) return Container();

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
}
