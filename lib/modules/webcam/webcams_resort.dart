import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snow_weather_info/model/ski_resort.dart';
import 'package:snow_weather_info/model/webcam.dart';
import 'package:snow_weather_info/modules/webcam/favorite_notifier.dart';

class WebcamsForResortView extends ConsumerWidget {
  const WebcamsForResortView({required this.resort, super.key});

  final SkiResort resort;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(
      favoriteSkiResortProvider.select(
        (fav) => fav.valueOrNull?.contains(resort) ?? false,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(resort.name),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () => ref
                .read(favoriteSkiResortProvider.notifier)
                .addOrRemoveFavorite(resort),
          ),
        ],
      ),
      body: ListView(
        children: [
          ...resort.webcams.map((webcam) => WebcamCard(webcam: webcam)),
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
            builder: (BuildContext context) =>
                _WebcamDialog(url: webcam.url, name: webcam.name),
            fullscreenDialog: true,
          ),
        ),
        child: Column(
          children: [
            Text(webcam.name),
            const SizedBox(height: 4),
            SizedBox(
              height: 150,
              child: AbsorbPointer(child: _WebMedia(url: webcam.url)),
            ),
          ],
        ),
      ),
    );
  }
}

class _WebcamDialog extends StatelessWidget {
  const _WebcamDialog({required this.url, required this.name});

  final String url;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: _WebMedia(url: url),
    );
  }
}

class _WebMedia extends StatelessWidget {
  const _WebMedia({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    if (url.endsWith('.jpg') || url.endsWith('.png')) {
      return InteractiveViewer(
        minScale: 0.5,
        maxScale: 5,
        clipBehavior: Clip.none,
        child: Center(child: Image.network(url)),
      );
    }

    return InAppWebView(
      initialUrlRequest: URLRequest(url: WebUri(url)),
      initialSettings: InAppWebViewSettings(useShouldOverrideUrlLoading: true),
      shouldOverrideUrlLoading: (controller, navigationAction) async =>
          NavigationActionPolicy.CANCEL,
    );
  }
}
