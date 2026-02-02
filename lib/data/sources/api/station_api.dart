import 'dart:convert';
import 'dart:developer' show log;

import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/model/station.dart';

part 'station_api.g.dart';

@Riverpod(keepAlive: true)
StationApi stationApi(Ref ref) {
  return StationApi();
}

class StationApi {
  const StationApi();

  Future<List<Station>> getStations() async {
    final List<Station> stations = [];

    final jsonString = await rootBundle.loadString('assets/postesNivo.json');
    final jsonData = json.decode(jsonString) as List<dynamic>;

    for (final station in jsonData) {
      if (station is Map<String, dynamic>) {
        stations.add(Station.fromRemoteJson(station));
      } else {
        log('Error parsing station $station');
      }
    }
    log('parse station ok');

    return stations;
  }
}
