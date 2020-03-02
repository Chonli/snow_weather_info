import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/repository.dart';
import 'package:snow_weather_info/ui/avalanche_bulletin_page.dart';

class AvalancheMassifPage extends StatelessWidget {
  const AvalancheMassifPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Repository repository = Provider.of<Repository>(context);
    final list = repository.getAllAvalancheBulletin();
    return Scaffold(
      appBar: AppBar(
        title: Text("Bulletins Avalanche"),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 5.0,
            child: ListTile(
              title: Text(list[index].massifName),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AvalancheBulletinPage(list[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
