import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart' as web;
import 'package:webview_flutter/webview_flutter.dart';

class AppWebPage extends StatefulWidget {
  const AppWebPage({
    super.key,
    required this.title,
    required this.url,
    this.canIsOpen = false,
    this.canShare = false,
    this.isFavorite = false,
    this.onFavorite,
  });

  final String title;
  final String url;
  final bool canIsOpen;
  final bool canShare;
  final bool isFavorite;
  final VoidCallback? onFavorite;

  @override
  State<AppWebPage> createState() => _AppWebPageState();
}

class _AppWebPageState extends State<AppWebPage> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final safeOnFavorite = widget.onFavorite;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        actions: [
          if (widget.canIsOpen)
            IconButton(
              icon: const Icon(Icons.open_in_browser),
              onPressed: () async {
                final uri = Uri.parse(widget.url);
                if (await web.canLaunchUrl(uri)) {
                  web.launchUrl(uri);
                }
              },
            ),
          if (widget.canShare)
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () => Share.share(widget.url),
            ),
          if (safeOnFavorite != null)
            IconButton(
              icon: Icon(
                widget.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              onPressed: safeOnFavorite,
            ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (_) => setState(() {
              isLoading = false;
            }),
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }
}
