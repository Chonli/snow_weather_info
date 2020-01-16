import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/repository.dart';
import 'package:snow_weather_info/ui/home_page.dart';

import 'data/repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<Repository>(create: (_) => Repository()),
        ],
        child: MaterialApp(
          title: 'Info Station Météo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Info Station Météo'),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Repository repository = Provider.of<Repository>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: FutureBuilder(
            future: repository.initData(),
            builder: (context, snapshot) {
              if (snapshot.hasError)
                return Center(
                    child: Text('Initialisation erreur: ${snapshot.error}'));
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  return HomePage();
              }
            }));
  }
}
