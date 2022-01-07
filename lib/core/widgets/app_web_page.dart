import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart' as web;
import 'package:webview_flutter/webview_flutter.dart';

class AppWebPage extends StatefulWidget {
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
  State<AppWebPage> createState() => _AppWebPageState();
}

class _AppWebPageState extends State<AppWebPage> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
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
                if (await web.canLaunch(widget.url)) {
                  web.launch(widget.url);
                }
              },
            ),
          if (widget.canShare)
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () => Share.share(widget.url),
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
            Stack(),
        ],
      ),
    );
  }
}
