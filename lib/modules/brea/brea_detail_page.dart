import 'package:flutter/material.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BREADetailPage extends StatelessWidget {
  const BREADetailPage({
    Key key,
    this.avalancheBulletin,
  }) : super(key: key);

  final AvalancheBulletin avalancheBulletin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          avalancheBulletin.massifName,
        ),
      ),
      body: WebView(
        initialUrl: avalancheBulletin.url,
      ),
    );
  }
}
