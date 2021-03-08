import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/sources/avalanche_api.dart';
import 'package:snow_weather_info/data/sources/data_api.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/ui/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String _title = 'Info Neige';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AvalancheAPI>(create: (_) => AvalancheAPI()),
          Provider<DataAPI>(create: (_) => DataAPI()),
          ChangeNotifierProxyProvider2<AvalancheAPI, DataAPI, DataNotifier>(
            create: (_) => DataNotifier(),
            update: (_, avalancheAPI, dataAPI, old) => old
              ..avalancheAPI = avalancheAPI
              ..dataAPI = dataAPI
              ..initData(),
          ),
        ],
        child: MaterialApp(
          title: _title,
          theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: 'Helvetica',
            primaryColor: Colors.blueAccent,
            accentColor: Colors.blueAccent,
            backgroundColor: Colors.white,
            disabledColor: Colors.grey,
            textTheme: const TextTheme(
              headline6: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.black),
              bodyText1: TextStyle(color: Colors.blue),
              subtitle1: TextStyle(color: Colors.black),
              subtitle2: TextStyle(color: Colors.black),
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Helvetica',
            primaryColor: Colors.blueAccent.shade400,
            accentColor: Colors.blueAccent.shade400,
            backgroundColor: Colors.grey.shade800,
            disabledColor: Colors.grey.shade900,
            textTheme: TextTheme(
              headline6: const TextStyle(color: Colors.white),
              bodyText2: const TextStyle(color: Colors.white70),
              bodyText1: TextStyle(color: Colors.blue.shade300),
              subtitle1: const TextStyle(color: Colors.white),
              subtitle2: const TextStyle(color: Colors.white),
            ),
          ),
          themeMode: ThemeMode.system,
          home: MyHomePage(title: _title),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final loading = context.select<DataNotifier, bool>((n) => n.loading);
    return loading
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    "assets/icon/icon.png",
                    fit: BoxFit.contain,
                    height: 128,
                    width: 128,
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          )
        : HomePage(title: title);
  }
}
