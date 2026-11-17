import 'dart:convert';
import 'dart:developer' show log;

import 'package:flutter/services.dart';
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
  const new(this.apiClient);

  final ApiClient apiClient;

  static const _url =
      'https://gist.githubusercontent.com/Chonli/2997953a7b222cb0b6bf30e2a06652cb/raw/webcams.json';

  Future<List<SkiResort>> getSkiResortsFromAsset() async {
    final jsonString = await rootBundle.loadString('assets/webcams.json');

    return _decodeJson(jsonString);
  }

  Future<List<SkiResort>?> getSkiResorts() async {
    try {
      return await apiClient.get<List<SkiResort>>(
        Uri.parse(_url),
        decode: (response) => _decodeJson(response.body),
      );
    } on Exception catch (error) {
      log('error: donwload webcam failed $error');
      return null;
    }
  }

  List<SkiResort> _decodeJson(String data) {
    final jsonData = json.decode(data) as Map<String, dynamic>;
    return (jsonData['webcamsByResort'] as List<dynamic>)
        .map((e) => SkiResort.fromMap(e as Map<String, dynamic>))
        .toList();
  }
}
