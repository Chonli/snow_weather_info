import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/repository.dart';
import 'package:snow_weather_info/ui/station_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Repository repository = Provider.of<Repository>(context);
    return FutureBuilder(
        future: repository.getStations(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            default:
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) =>
                    StationCard(snapshot.data[index]),
              );
          }
        });
  }
}
