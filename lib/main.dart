import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/station.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Info Station Météo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Info Station Météo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/nivo.20200114.csv
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: MaterialButton(
          child: Text('Test'),
          onPressed: () async {
            final response = await http.get(
                'https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/postesNivo.json');

            if (response.statusCode == 200) {
              print(response.body);
              var data = json.decode(response.body);
              var rest = data["features"] as List;
              print(rest);
              var list = rest
                  .map<Station>((json) => Station.fromJson(json["properties"]))
                  .toList();
              print(list);
            } else {
              throw Exception('Failed to load post');
            }
          },
        ),
      ),
    );
  }
}
