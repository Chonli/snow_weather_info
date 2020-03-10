import 'package:flutter/material.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/ui/data_station_page.dart';
import 'package:snow_weather_info/ui/nivose_page.dart';

class StationCard extends StatelessWidget {
  final AbstractStation _station;

  StationCard(this._station);

  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle =
        TextStyle(color: Colors.blue.shade900, fontStyle: FontStyle.normal);
    if (_station is Station) {
      final st = _station as Station;
      Color _color = st.hasData ? Colors.black : Colors.grey;
      FontStyle _font = st.hasData ? FontStyle.normal : FontStyle.italic;
      _textStyle = TextStyle(color: _color, fontStyle: _font);
    }
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
          MaterialPageRoute(builder: (context) {
            if (_station is Station) {
              return DataStationPage(
                (_station as Station),
              );
            } else {
              return NivosePage(
                (_station as Nivose),
              );
            }
          }),
        ),
      ),
    );
  }
}
