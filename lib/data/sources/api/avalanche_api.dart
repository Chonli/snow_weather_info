import 'dart:convert';
import 'dart:developer' show log;

import 'package:dart_rss/dart_rss.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/api/api_client.dart';

part 'avalanche_api.g.dart';

@Riverpod(keepAlive: true)
Future<AtomFeed?> apiAvalanche(Ref ref) async {
  AtomFeed? feed;

  try {
    final client = ref.watch(apiClientProvider);
    final response = await client.get(
      Uri.parse('http://www.data-avalanche.org/feed'),
    );
    feed = AtomFeed.parse(utf8.decode(response.bodyBytes));
  } on Exception catch (e) {
    log('feed error : $e');
    throw Exception(e);
  }

  log('donwload avalanche ok');

  return feed;
}
