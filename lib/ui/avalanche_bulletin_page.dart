import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:share/share.dart';
import 'package:snow_weather_info/model/avalanche_bulletin.dart';
import 'package:http/http.dart' as http;

class AvalancheBulletinPage extends StatelessWidget {
  final AvalancheBulletin bulletin;
  const AvalancheBulletinPage(this.bulletin);

  Future<PdfDocument> _loadBulletin() async {
    //download file
    try {
      final response = await http.get(bulletin.url);

      // Write the file
      return PdfDocument.openData(response.bodyBytes);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _pdfController = PdfController(document: _loadBulletin());

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
        child: _pdfController.document != null
            ? InteractiveViewer(
                child: PdfView(
                  controller: _pdfController,
                  documentLoader: Center(child: CircularProgressIndicator()),
                  errorBuilder: (error) => Text('Erreur de chargement'),
                ),
              )
            : Text('Pas de bulletin disponible'),
      ),
    );
  }
}
