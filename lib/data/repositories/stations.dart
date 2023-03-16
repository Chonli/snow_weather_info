import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/database_helper.dart';
import 'package:snow_weather_info/data/sources/preferences.dart';
import 'package:snow_weather_info/data/sources/station_api.dart';
import 'package:snow_weather_info/model/station.dart';

part 'stations.g.dart';

@Riverpod(keepAlive: true)
StationsRepository stationsRepository(StationsRepositoryRef ref) {
  return StationsRepository.update(
    ref.watch(stationAPIProvider),
    ref.watch(databaseHelperProvider),
    ref.watch(preferencesProvider),
    null,
  );
}

@immutable
class StationsRepository {
  /// Creates a [AreasRepository].
  const StationsRepository({
    required StationAPI apiClient,
    required DatabaseHelper databaseHelper,
    required Preferences preferences,
  })  : _apiClient = apiClient,
        _preferences = preferences,
        _databaseHelper = databaseHelper;

  factory StationsRepository.update(
    StationAPI apiClient,
    DatabaseHelper databaseHelper,
    Preferences preferences,
    StationsRepository? old,
  ) {
    return old == null ||
            apiClient != old._apiClient ||
            databaseHelper != old._databaseHelper ||
            preferences != old._preferences
        ? StationsRepository(
            apiClient: apiClient,
            databaseHelper: databaseHelper,
            preferences: preferences,
          )
        : old;
  }

  final StationAPI _apiClient;
  final DatabaseHelper _databaseHelper;
  final Preferences _preferences;

  Future<List<Station>> getStations({bool forceUpdate = false}) async {
    final stationUpdateDate = _preferences.lastStationDate;
    List<Station> stations = await _databaseHelper.getAllStation();
    if (forceUpdate ||
        stations.isEmpty ||
        stationUpdateDate.difference(DateTime.now()) >
            const Duration(days: 15)) {
      stations = await _apiClient.getStation();
      stations.forEach((s) => _databaseHelper.insertStation(s));

      _preferences.setLastStationDate(DateTime.now());
    }

    return stations;
  }
}
