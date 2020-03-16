import 'package:flutter/material.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/ui/data_station_page.dart';
import 'package:snow_weather_info/ui/nivose_page.dart';

class StationCard extends StatelessWidget {
  final AbstractStation _station;

  StationCard(this._station);

  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle = TextStyle(
        color: Theme.of(context).textTheme.body2.color,
        fontStyle: FontStyle.normal);
    var snowHeigth = "";
    if (_station is Station) {
      final st = _station as Station;
      snowHeigth = st.hasData
          ? " ${(st.lastSnowHeight * 100).toStringAsFixed(0)}cm"
          : "";
      Color _color = st.hasData
          ? Theme.of(context).textTheme.body1.color
          : Theme.of(context).disabledColor;
      FontStyle _font = st.hasData ? FontStyle.normal : FontStyle.italic;
      _textStyle = TextStyle(color: _color, fontStyle: _font);
    }
    return Card(
      margin: EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0, right: 64.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5.0,
      child: ListTile(
        title: Text(
          _station.name,
          style: _textStyle,
        ),
        isThreeLine: true,
        trailing: Visibility(
            visible: snowHeigth.isNotEmpty,
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [Icon(Icons.ac_unit), Text(snowHeigth)])),
        subtitle: Text(
          '${_station.altitude}m \nLatLng(${_station.position.latitude},${_station.position.longitude})',
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
