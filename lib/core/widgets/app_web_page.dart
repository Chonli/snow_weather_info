import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as web;

class AppWebPage extends StatelessWidget {
  const AppWebPage({
    Key? key,
    required this.title,
    required this.url,
    this.canIsOpen = false,
  }) : super(key: key);

  final String title;
  final String url;
  final bool canIsOpen;

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
        ],
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}