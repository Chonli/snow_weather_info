import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:snow_weather_info/data/sources/api/station_data_api.dart';

import '../common/io.dart';
import '../common/mock.dart';

void main() {
  test('Test la récuperation des station', () async {
    final client = MockClient();
    final responseBody = getTestFile('nivo_2026.csv.gz');

    // Définir le comportement du mock
    when(
      () => client.get(Uri.parse(StationDataApi.stationDataUrl)),
    ).thenAnswer((_) async => Response.bytes(responseBody, 200));

    final apiStation = StationDataApi(client);

    final datas = await apiStation.getStationDatas(
      currentDate: DateTime(2026, 2, 1),
      maxDaysFetch: 10,
    );

    expect(datas.length, 941);
  });
}
