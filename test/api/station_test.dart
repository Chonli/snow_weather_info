import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snow_weather_info/data/sources/api/station_api.dart';

void main() {
  test('Test la récuperation des station', () async {
    WidgetsFlutterBinding.ensureInitialized();
    final apiStation = StationApi();

    final stations = await apiStation.getStations();

    expect(stations.length, 124);
  });
}
