import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snow_weather_info/data/repository.dart';
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
          Provider<Repository>(create: (_) => Repository()),
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
            textTheme: TextTheme(
              title: TextStyle(color: Colors.white),
              body1: TextStyle(color: Colors.black),
              body2: TextStyle(color: Colors.blue),
              subhead: TextStyle(color: Colors.black),
              subtitle: TextStyle(color: Colors.black),
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
              title: TextStyle(color: Colors.white),
              body1: TextStyle(color: Colors.white70),
              body2: TextStyle(color: Colors.blue.shade300),
              subhead: TextStyle(color: Colors.white),
              subtitle: TextStyle(color: Colors.white),
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
    Repository repository = Provider.of<Repository>(context);
    return FutureBuilder(
        future: repository.initData(),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Scaffold(
                appBar: AppBar(
                  title: Text(title),
                ),
                body: Center(
                    child: Text('Initialisation erreur: ${snapshot.error}')));
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Scaffold(
                  appBar: AppBar(
                    title: Text(title),
                  ),
                  body: Center(child: CircularProgressIndicator()));
            default:
              return HomePage(
                title: title,
                repository: repository,
              );
          }
        });
  }
}
