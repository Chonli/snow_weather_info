import 'package:flutter/material.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/ui/detail_station_page.dart';

class StationCard extends StatelessWidget {
  final Station _station;

  StationCard(this._station);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5.0,
      child: ListTile(
        title: Text(_station.name),
        subtitle: Text('${_station.altitude}m \n${_station.position}'),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailStationPage(
                  _station.id,
                ),
              ));
        },
      ),
    );
  }
}
