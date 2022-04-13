import 'package:flutter/material.dart';
import 'package:snow_weather_info/model/station.dart';
import 'package:snow_weather_info/modules/data_station/view.dart';
import 'package:snow_weather_info/ui/nivose_page.dart';

class StationCard extends StatelessWidget {
  const StationCard({
    Key? key,
    required this.station,
  }) : super(key: key);

  final AbstractStation station;

  @override
  Widget build(BuildContext context) {
    var _textStyle = TextStyle(
      color: Theme.of(context).textTheme.bodyText1?.color,
      fontStyle: FontStyle.normal,
    );
    var snowHeigth = '';
    if (station is Station) {
      final st = station as Station;
      snowHeigth = st.hasData
          ? ' ${(st.lastSnowHeight * 100).toStringAsFixed(0)}cm'
          : '';
      final _color = st.hasData
          ? Theme.of(context).textTheme.bodyText2?.color
          : Theme.of(context).disabledColor;
      final _font = st.hasData ? FontStyle.normal : FontStyle.italic;
      _textStyle = TextStyle(color: _color, fontStyle: _font);
    }
    return Card(
      margin: const EdgeInsets.only(
        left: 8,
        bottom: 8,
        top: 8,
        right: 64,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      child: ListTile(
        title: Text(
          station.name,
          style: _textStyle,
        ),
        isThreeLine: true,
        trailing: snowHeigth.isNotEmpty
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.ac_unit),
                  Text(snowHeigth),
                ],
              )
            : null,
        subtitle: Text(
          '${station.altitude}m \nLatLng(${station.position.latitude},${station.position.longitude})',
          style: _textStyle,
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute<Widget>(
            builder: (context) => station is Station
                ? DataStationView(station: station as Station)
                : NivosePage(nivose: station as Nivose),
          ),
        ),
      ),
    );
  }
}
