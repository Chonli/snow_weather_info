import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/model/ski_resort.dart';

part 'ski_resort.g.dart';

@Riverpod(keepAlive: true)
SkiResortApi skiResortApi(Ref ref) {
  return SkiResortApi();
}

class SkiResortApi {
  const SkiResortApi();

  Future<List<SkiResort>> getSkiResortsFromAsset() async {
    final jsonString = await rootBundle.loadString('assets/webcams.json');
    final jsonData = json.decode(jsonString) as Map<String, dynamic>;

    return (jsonData['webcamsByResort'] as List<dynamic>)
        .map((e) => SkiResort.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<SkiResort>> getSkiResorts() async {
    // TODO(apa): implement with read github gist value
    return [];
  }
}
