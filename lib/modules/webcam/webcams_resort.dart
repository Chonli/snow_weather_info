import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:snow_weather_info/model/ski_resort.dart';
import 'package:snow_weather_info/model/webcam.dart';

class WebcamsForResortView extends StatelessWidget {
  const WebcamsForResortView({
    required this.resort,
    super.key,
  });

  final SkiResort resort;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          resort.name,
        ),
      ),
      body: ListView(
        children: [
          ...resort.webcams.map(
            (webcam) => WebcamCard(
              webcam: webcam,
            ),
          ),
        ],
      ),
    );
  }
}

class WebcamCard extends StatelessWidget {
  const WebcamCard({required this.webcam, super.key});

  final WebCam webcam;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => _WebcamDialog(
              url: webcam.url,
              name: webcam.name,
            ),
            fullscreenDialog: true,
          ),
        ),
        child: Column(
          children: [
            Text(webcam.name),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              height: 150,
              child: AbsorbPointer(
                child: _WebMedia(
                  url: webcam.url,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WebcamDialog extends StatelessWidget {
  const _WebcamDialog({
    required this.url,
    required this.name,
    super.key,
  });

  final String url;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
        ),
      ),
      body: Center(
        child: _WebMedia(url: url),
      ),
    );
  }
}

class _WebMedia extends StatelessWidget {
  const _WebMedia({
    required this.url,
    super.key,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    if (url.endsWith('.jpg')) {
      return InteractiveViewer(
        minScale: 0.5,
        maxScale: 5,
        child: Image.network(url),
      );
    }

    return InAppWebView(
      initialUrlRequest: URLRequest(
        url: WebUri(
          url,
        ),
      ),
      initialSettings: InAppWebViewSettings(
        useShouldOverrideUrlLoading: true,
      ),
      shouldOverrideUrlLoading: (controller, navigationAction) async =>
          NavigationActionPolicy.CANCEL,
    );
  }
}
