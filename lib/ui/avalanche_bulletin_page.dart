import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:share/share.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:http/http.dart' as http;

class AvalancheBulletinPage extends StatelessWidget {
  final AvalancheBulletin bulletin;
  const AvalancheBulletinPage(this.bulletin);

  Future<PDFDocument> _loadBulletin() async {
    //download file
    try {
      final response = await http.get(bulletin.url);

      // Write the file
      return PDFDocument.openData(response.bodyBytes);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bulletin.massifName),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () => Share.share(
                  "BERA ${bulletin.massifName} du ${DateFormat('dd-MM-yyyy').format(DateTime.now())} \n${bulletin.url}\n"))
        ],
      ),
      body: Center(
        child: FutureBuilder<PDFDocument>(
          future: _loadBulletin(),
          builder: (BuildContext context, AsyncSnapshot<PDFDocument> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              default:
                if (snapshot.hasError || !snapshot.hasData) {
                  return Text('Erreur de chargement');
                } else {
                  try {
                    return PDFView(document: snapshot.data);
                  } catch (e) {
                    return Text('Erreur de chargement');
                  }
                }
            }
          },
        ),
      ),
    );
  }
}
