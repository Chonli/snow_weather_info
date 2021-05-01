import 'dart:convert';
import 'dart:developer' show log;

import 'package:http/http.dart' as http;
import 'package:dart_rss/dart_rss.dart';

class AvalancheAPI {
  final client = http.Client();

  Future<AtomFeed> getAvalanche() async {
    AtomFeed feed;
    try {
      final response =
          await client.get(Uri.parse('http://www.data-avalanche.org/feed'));
      feed = AtomFeed.parse(utf8.decode(response.bodyBytes));
    } catch (e) {
      log('feed error : $e');
    }
    return feed;
  }
}
