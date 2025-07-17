import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:snow_weather_info/data/sources/api/station_api.dart';

import '../common/io.dart';
import '../common/mock.dart';

void main() {
  test('Test la récuperation des station', () async {
    // Créer une instance de MockClient
    final client = MockClient();
    final responseBody = getJson('postesNivo.json');

    // Définir le comportement du mock
    when(
      () => client.get(Uri.parse(StationApi.stationUrl)),
    ).thenAnswer((_) async => Response(responseBody, 200));

    final apiStation = StationApi(client);
    // Appeler la méthode à tester
    final stations = await apiStation.getStations();

    // Vérifier le résultat
    expect(stations.length, 200);
  });
}
