import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/modules/data_station/view.dart';
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

  @override
  void initState() {
    super.initState();

    _initMakerList(context);
    _mapController = MapController();
    _mapController.onReady.then((_) async {
      if (_mapController != null) {
        final notifier = context.read<DataNotifier>();
        final isFristLaunch = notifier.currentUserLoc == null;
        final hasPosition = await notifier.updateLocation();

        if (hasPosition &&
            notifier.currentUserLoc != null &&
            _mapController != null) {
          setState(() {
            _listStationMarker.add(
              Marker(
                width: 50,
                height: 50,
                point: notifier.currentUserLoc,
                builder: (ctx) => const Icon(
                  Icons.person_pin_circle,
                  color: Colors.blueAccent,
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

  void _initMakerList(BuildContext context) {
    final list = context.read<DataNotifier>().allStations;
    list?.forEach(
      (st) {
        bool hasData = false;
        Color color = Colors.blue[900];
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
                if (hasData)
                  Positioned(
                    left: 42,
                    bottom: 0,
                    child: Text(
                      '${(lastSnowHeight * 100).toStringAsFixed(0)}cm',
                      style: const TextStyle(color: Colors.black),
                    ),
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
                            ? DataStationView(station: st)
                            : NivosePage(st as Nivose),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // TODO(team): Add avalanche marker (webfeed need evol)
//             <entry>
//     <title>Avalanche le 11/02/2021 : Alpes GrÃ©es, secteur Ouille Allegra, Clapier Vert</title>
//     <link rel="alternate" href="http://www.data-avalanche.org/avalanche/1613053579538" />
//     <author>
//       <name />
//     </author>
//     <updated>2021-02-11T14:27:25Z</updated>
//     <published>2021-02-11T14:27:25Z</published>
//     <summary type="html">DÃ©clenchement Ã  distance, on montait 20m Ã  droite, j'ai sondÃ© au bÃ¢ton (50cm) avant que parte la plaque, il doit y avoir un peu plus Ã  la cassure.&#xD;
// Le vent fort a couvert le bruit de l'avalanche, je m'en suis rendu compte qu'en me retournant.&#xD;
// Juste avant un groupe a avait dÃ©clenchÃ© une plaque 50m sur la droite.</summary>
//     <dc:date>2021-02-11T14:27:25Z</dc:date>
//     <geo:lat>45.33333606721882</geo:lat>
//     <geo:long>7.051350187981403</geo:long>
//     <avalanche:orientation>SW</avalanche:orientation>
//     <avalanche:date_event>2021-02-10T23:00:00Z</avalanche:date_event>
//     <avalanche:altitude_start>2940</avalanche:altitude_start>
//     <avalanche:altitude_stop>2800</avalanche:altitude_stop>
//   </entry>

  @override
  Widget build(BuildContext context) {
    final currentMapLoc =
        context.select<DataNotifier, LatLng>((n) => n.currentMapLoc);

    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            center: currentMapLoc,
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
                  final notifier = context.read<DataNotifier>();
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
