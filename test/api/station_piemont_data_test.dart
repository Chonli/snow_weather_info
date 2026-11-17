import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:snow_weather_info/data/sources/api/api_client.dart';
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
      when(() => client.get(any()))
          .thenAnswer((_) async => Response.bytes(responseBody, 200));

      final api = StationPiemontDataApi(ApiClient(client));

      final datas = await api.getStationDatas(
        currentDate: DateTime(2026, 4, 20),
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

  test('Test une requête par station_code (l API ignore les listes)', () async {
    final client = MockClient();
    final responseBody = getTestFile('response_1776859310379.json');

    when(() => client.get(any()))
        .thenAnswer((_) async => Response.bytes(responseBody, 200));

    final api = StationPiemontDataApi(ApiClient(client));

    await api.getStationDatas(
      currentDate: DateTime(2026, 4, 20),
      stationCodes: ['158', '160', '191'],
    );

    final uris = verify(() => client.get(captureAny())).captured.cast<Uri>();
    expect(uris.length, 3);
    expect(uris.map((u) => u.queryParameters['station_code']).toSet(), {
      '158',
      '160',
      '191',
    });
  });

  test('Test une reponse sans data retourne une liste vide', () async {
    final client = MockClient();

    when(() => client.get(any())).thenAnswer(
      (_) async => Response.bytes(
        utf8.encode('{"page":null,"total_pages":0,"data":null}'),
        200,
      ),
    );

    final api = StationPiemontDataApi(ApiClient(client));

    final datas = await api.getStationDatas(
      currentDate: DateTime(2026, 4, 20),
      stationCodes: ['158'],
    );

    expect(datas, isEmpty);
  });
}
