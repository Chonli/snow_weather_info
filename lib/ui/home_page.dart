import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/repository.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/ui/station_card.dart';
import 'package:url_launcher/url_launcher.dart';

import 'detail_station_page.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MapController _mapController;
  List<Marker> _listStationMarker;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _listStationMarker = List<Marker>();
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
            zoom: 10.0,
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
          child: Container(
            color: Colors.white,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'donnée carte: © ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'OpenStreetMap',
                    style: TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        await launch('https://www.openstreetmap.org/copyright');
                      },
                  ),
                  TextSpan(
                    text: 'contributors\nstyle carte: ©',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: ' opentopomap.org',
                    style: TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launch('https://opentopomap.org');
                      },
                  ),
                  TextSpan(
                    text: ' (CC-BY-SA)',
                    style: TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launch(
                            'https://creativecommons.org/licenses/by-sa/3.0/');
                      },
                  ),
                ],
              ),
            ),
          ),
        ),
        Text("  SRTM | map style: ©  (CC-BY-SA)")
      ],
    );
  }

  void _initMakerList(List<Station> list) {
    if (list == null) return;

    for (var st in list) {
      _listStationMarker.add(Marker(
          width: 80.0,
          height: 80.0,
          point: st.position,
          builder: (ctx) => IconButton(
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
              )));
    }
  }
}
