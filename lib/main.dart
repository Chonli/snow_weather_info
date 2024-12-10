import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snow_weather_info/core/const.dart';
import 'package:snow_weather_info/data/sources/data/preferences.dart';
import 'package:snow_weather_info/router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: AppConst.title,
      theme: ThemeData(
        colorSchemeSeed: Colors.blueAccent,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue.shade800,
        brightness: Brightness.dark,
      ),
      themeMode: ref.watch(themeModeSettingsProvider),
      routerConfig: ref.watch(routerProvider),
    );
  }
}
