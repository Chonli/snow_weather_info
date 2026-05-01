import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:snow_weather_info/data/sources/api/station_piemont_data_api.dart';
import 'package:snow_weather_info/extensions/double.dart';

import '../common/io.dart';
import '../common/mock.dart';

void main() {
  setUpAll(() {
    // register a fallback Uri for mocktail when using `any()` on Uri parameters
    registerFallbackValue(Uri());
  });

  test(
    'Test la récupération des données Piemonte (mocked API response)',
    () async {
      final client = MockClient();
      final responseBody = getTestFile('response_1776859310379.json');

      // Mock any GET request to return the test JSON
      when(
        () => client.get(any()),
      ).thenAnswer((_) async => Response.bytes(responseBody, 200));

      final api = StationPiemontDataApi(client);

      final datas = await api.getStationDatas(
        currentDate: DateTime(2026, 4, 20),
        maxDaysFetch: 10,
        stationCodes: ['158'],
      );

      // The test sample contains 73 items
      expect(datas.length, 73);

      // Basic sanity checks on the first item
      final first = datas.first;
      expect(first.id, isNotEmpty);
      expect(first.date, isA<DateTime>());
      // snowHeight should be parsed from "snow_height"
      expect(first.snowHeight!.toCm, 13);
    },
  );
}
