import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:http/http.dart' as http;

class AvalancheBulletinPage extends StatelessWidget {
  final AvalancheBulletin bulletin;
  const AvalancheBulletinPage(this.bulletin);

  Future<Uint8List> _loadBulletin() async {
    //download file
    try {
      final response = await http.get(bulletin.url);

      // Write the file
      return response.bodyBytes;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bulletin.massifName),
      ),
      body: Center(
        child: FutureBuilder<Uint8List>(
            future: _loadBulletin(),
            builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:
                  if (snapshot.hasError || !snapshot.hasData) {
                    return Text('Erreur de chargement');
                  } else {
                    try {
                      return PdfDocumentLoader(
                        data: snapshot.data,
                        pageNumber: 1,
                        calculateSize: (pageWidth, pageHeight, aspectRatio) =>
                            Size(pageWidth * aspectRatio,
                                pageHeight * aspectRatio),
                      );
                    } catch (e) {
                      return Text('Erreur de chargement');
                    }
                  }
              }
            }),
      ),
    );
  }
}
