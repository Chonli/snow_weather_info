import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snow_weather_info/core/theme/app_theme.dart';
import 'package:snow_weather_info/data/sources/preferences.dart';
import 'package:snow_weather_info/modules/home/home_page.dart';
import 'package:snow_weather_info/provider/station_data.dart';

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
    final loading = ref.watch(stationDataProvider.select((n) => n.isLoading));

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
