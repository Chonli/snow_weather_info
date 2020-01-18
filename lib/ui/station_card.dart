import 'package:flutter/material.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/ui/detail_station_page.dart';

class StationCard extends StatelessWidget {
  final Station _station;

  StationCard(this._station);

  @override
  Widget build(BuildContext context) {
    Color _color = _station.hasData ? Colors.black : Colors.grey;
    FontStyle _font = _station.hasData ? FontStyle.normal : FontStyle.italic;
    var _textStyle = TextStyle(color: _color, fontStyle: _font);
    return Card(
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5.0,
      child: ListTile(
        title: Text(
          _station.name,
          style: _textStyle,
        ),
        subtitle: Text(
          '${_station.altitude}m \n${_station.position}',
          style: _textStyle,
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailStationPage(
                _station,
              ),
            )),
      ),
    );
  }
}
