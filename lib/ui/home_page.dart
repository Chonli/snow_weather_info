import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/repository.dart';
import 'package:snow_weather_info/ui/station_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Repository repository = Provider.of<Repository>(context);
    var list = repository.getStations();
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => StationCard(list[index]),
    );
  }
}
