import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart' as web;

class AppWebPage extends StatelessWidget {
  const AppWebPage({
    required this.title,
    required this.url,
    this.canIsOpen = false,
    this.canShare = false,
    this.isFavorite = false,
    this.onFavorite,
    super.key,
  });

  final String title;
  final String url;
  final bool canIsOpen;
  final bool canShare;
  final bool isFavorite;
  final VoidCallback? onFavorite;

  @override
  Widget build(BuildContext context) {
    final safeOnFavorite = onFavorite;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
        actions: [
          if (canIsOpen)
            IconButton(
              icon: const Icon(Icons.open_in_browser),
              onPressed: () async {
                final uri = Uri.parse(url);
                if (await web.canLaunchUrl(uri)) {
                  await web.launchUrl(
                    uri,
                    mode: web.LaunchMode.externalApplication,
                  );
                }
              },
            ),
          if (canShare)
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () => SharePlus.instance.share(
                ShareParams(text: url),
              ),
            ),
          if (safeOnFavorite != null)
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              onPressed: safeOnFavorite,
            ),
        ],
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(url),
        ),
      ),
    );
  }
}
