import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snow_weather_info/core/notifier/preference.dart';
import 'package:snow_weather_info/core/theme/app_theme.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/data/repositories/stations.dart';
import 'package:snow_weather_info/data/sources/avalanche_api.dart';
import 'package:snow_weather_info/data/sources/database_helper.dart';
import 'package:snow_weather_info/data/sources/preferences.dart';
import 'package:snow_weather_info/data/sources/station_api.dart';
import 'package:snow_weather_info/ui/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(MyApp(
    preferences: prefs,
  ));
}

const _title = 'Info Neige';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.preferences,
  }) : super(key: key);

  final SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DatabaseHelper>(create: (_) => DatabaseHelper()),
        Provider<AvalancheAPI>(create: (_) => AvalancheAPI()),
        Provider<Preferences>(create: (_) => Preferences(preferences)),
        Provider<StationAPI>(create: (_) => StationAPI()),
        ProxyProvider0<StationsRepository>(
          update: (context, old) => StationsRepository.update(
            context.watch<StationAPI>(),
            context.watch<DatabaseHelper>(),
            context.watch<Preferences>(),
            old,
          ),
        ),
        ChangeNotifierProxyProvider0<PreferenceNotifier>(
          create: (_) => PreferenceNotifier(),
          update: (context, old) => old!
            ..preferences = context.watch<Preferences>()
            ..init(),
        ),
        ChangeNotifierProxyProvider0<DataNotifier>(
          create: (_) => DataNotifier(),
          update: (context, old) => old!
            ..avalancheAPI = context.watch<AvalancheAPI>()
            ..stationAPI = context.watch<StationAPI>()
            ..preferences = context.watch<Preferences>()
            ..databaseHelper = context.watch<DatabaseHelper>()
            ..stationsRepository = context.watch<StationsRepository>()
            ..initData(),
        ),
      ],
      child: Consumer<PreferenceNotifier>(
        builder: (context, PreferenceNotifier notifier, child) {
          return MaterialApp(
            title: _title,
            theme: AppTheme.ligthTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: notifier.themeMode,
            home: const MyHomePage(title: _title),
          );
        },
      ),
    );
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
