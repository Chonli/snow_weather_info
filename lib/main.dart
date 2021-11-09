import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/data/sources/avalanche_api.dart';
import 'package:snow_weather_info/data/sources/data_api.dart';
import 'package:snow_weather_info/data/sources/database_helper.dart';
import 'package:snow_weather_info/data/sources/preferences.dart';
import 'package:snow_weather_info/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

const _title = 'Info Neige';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<DatabaseHelper>(create: (_) => DatabaseHelper()),
          Provider<AvalancheAPI>(create: (_) => AvalancheAPI()),
          Provider<Preferences>(create: (_) => Preferences()),
          Provider<DataAPI>(create: (_) => DataAPI()),
          ChangeNotifierProxyProvider0<DataNotifier>(
            create: (_) => DataNotifier(),
            update: (context, old) => old!
              ..avalancheAPI = context.watch<AvalancheAPI>()
              ..dataAPI = context.watch<DataAPI>()
              ..preferences = context.watch<Preferences>()
              ..databaseHelper = context.watch<DatabaseHelper>()
              ..initData(),
          ),
        ],
        child: MaterialApp(
          title: _title,
          theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: 'Helvetica',
            primaryColor: Colors.blueAccent,
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
          home: const MyHomePage(title: _title),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final loading = context.select<DataNotifier, bool>((n) => n.loading);
    return loading
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icon/icon.png',
                    fit: BoxFit.contain,
                    height: 128,
                    width: 128,
                  ),
                  const Padding(padding: EdgeInsets.all(20)),
                  const CircularProgressIndicator(),
                ],
              ),
            ),
          )
        : HomePage(title: title);
  }
}
