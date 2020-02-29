import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:http/http.dart' as http;

class AvalancheBulletinPage extends StatelessWidget {
  final AvalancheBulletin bulletin;
  const AvalancheBulletinPage(this.bulletin);

  Future<String> _loadBulletin() async {
    final directory = await getTemporaryDirectory();
    final path = '${directory.path}/${bulletin.massifName}.pdf';
    final file = File(path);

    if (file.existsSync()) {
      file.deleteSync();
    }
    //download file
    final response = await http.get(bulletin.url);

    // Write the file
    await file.writeAsBytes(response.bodyBytes);
    print("path");
    return file.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bulletin.massifName),
      ),
      body: FutureBuilder<String>(
          future: _loadBulletin(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError || !snapshot.hasData) {
                  return Center(child: Text('Erreur de chargement'));
                } else {
                  return PdfViewer(
                    filePath: snapshot.data,
                  );
                }
            }
          }),
    );
  }
}
