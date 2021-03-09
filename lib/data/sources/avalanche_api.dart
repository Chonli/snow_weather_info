import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

class AvalancheAPI {
  final client = http.Client();

  Future<AtomFeed> getAvalanche() async {
    AtomFeed feed;
    try {
      final response = await client.get('http://www.data-avalanche.org/feed');
      feed = AtomFeed.parse(utf8.decode(response.bodyBytes));
    } catch (e) {
      print("feed error : " + e.toString());
    }
    return feed;
  }
}
