import 'dart:convert';
import 'dart:developer' show log;

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/api/api_client.dart';
import 'package:snow_weather_info/model/ski_resort.dart';

part 'ski_resort.g.dart';

@Riverpod(keepAlive: true)
SkiResortApi skiResortApi(Ref ref) {
  final client = ref.watch(apiClientProvider);

  return SkiResortApi(client);
}

class SkiResortApi {
  const SkiResortApi(this.client);

  final Client client;

  Future<List<SkiResort>> getSkiResortsFromAsset() async {
    final jsonString = await rootBundle.loadString('assets/webcams.json');

    return _decodeJson(jsonString);
  }

  Future<List<SkiResort>> getSkiResorts() async {
    try {
      final response = await client.get(
        Uri.parse(
          'https://gist.githubusercontent.com/Chonli/2997953a7b222cb0b6bf30e2a06652cb/raw/webcams.json',
        ),
      );

      if (response.statusCode == 200) {
        return _decodeJson(response.body);
      } else {
        log('error: donwload webcam failed ${response.statusCode}');
        return [];
      }
    } on Exception catch (error) {
      log('error: donwload webcam failed $error');
      return [];
    }
  }

  List<SkiResort> _decodeJson(String data) {
    final jsonData = json.decode(data) as Map<String, dynamic>;
    return (jsonData['webcamsByResort'] as List<dynamic>)
        .map((e) => SkiResort.fromMap(e as Map<String, dynamic>))
        .toList();
  }
}
