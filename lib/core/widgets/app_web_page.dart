import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart' as web;
import 'package:webview_flutter/webview_flutter.dart';

class AppWebPage extends StatelessWidget {
  const AppWebPage({
    Key? key,
    required this.title,
    required this.url,
    this.canIsOpen = false,
    this.canShare = false,
  }) : super(key: key);

  final String title;
  final String url;
  final bool canIsOpen;
  final bool canShare;

  @override
  Widget build(BuildContext context) {
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
                if (await web.canLaunch(url)) {
                  web.launch(url);
                }
              },
            ),
          if (canShare)
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () => Share.share(url),
            ),
        ],
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
