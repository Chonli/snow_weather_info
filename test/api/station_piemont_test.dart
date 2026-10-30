import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:snow_weather_info/data/sources/api/station_piemont_api.dart';

import '../common/io.dart';
import '../common/mock.dart';

void main() {
  test('Test la récuperation des station', () async {
    final client = MockClient();
    final responseBody = getTestFile('response_station_piemont.json');

    // Définir le comportement du mock
    when(
      () => client.get(Uri.parse(StationPiemontApi.stationPiemontUrl)),
    ).thenAnswer((_) async => Response.bytes(responseBody, 200));

    final apiStation = StationPiemontApi(client);

    final datas = await apiStation.getStations();

    expect(datas.length, 77);
  });
}
