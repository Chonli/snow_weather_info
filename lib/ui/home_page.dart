import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/repository.dart';
import 'package:snow_weather_info/ui/avalanche_massif_page.dart';
import 'package:snow_weather_info/ui/list_station_widget.dart';
import 'package:snow_weather_info/ui/map_widget.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Repository repository = Provider.of<Repository>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.ac_unit),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AvalancheMassifPage(),
                ),
              ),
            )
          ],
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
            ListStationWidget(),
            MapWidget(repository),
          ],
        ),
      ),
    );
  }
}
