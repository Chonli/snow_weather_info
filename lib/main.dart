import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snow_weather_info/core/const.dart';
import 'package:snow_weather_info/core/local_database.dart';
import 'package:snow_weather_info/data/sources/data/preferences.dart';
import 'package:snow_weather_info/router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  // Init Database
  final dir = await getApplicationSupportDirectory();
  // build the database path
  final dbPath = join(dir.path, 'my_database.db');
  final dataBase = await databaseFactoryIo.openDatabase(
    dbPath,
    version: 1,
  );

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        dataBaseProvider.overrideWith(
          (_) => dataBase,
        ),
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
