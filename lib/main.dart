import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snow_weather_info/core/theme/app_theme.dart';
import 'package:snow_weather_info/data/data_notifier.dart';
import 'package:snow_weather_info/data/sources/preferences.dart';
import 'package:snow_weather_info/ui/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
    ],
    child: const MyApp(),
  ));
}

const _title = 'Info Neige';

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*return MultiProvider(
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
        ChangeNotifierProvider<LocationNotifier>(
          create: (_) => LocationNotifier(),
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
        builder: (context, PreferenceNotifier notifier, child) {*/

    return MaterialApp(
      title: _title,
      theme: AppTheme.ligthTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ref.watch(themeModeSettingsProvider),
      home: const MyHomePage(title: _title),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(dataNotifier.select((n) => n.loading));

    return loading ? const _LoadingPage() : HomePage(title: title);
  }
}

class _LoadingPage extends StatelessWidget {
  const _LoadingPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
