import 'dart:convert';
import 'dart:developer' show log;
import 'dart:math' show max;

import 'package:flutter/foundation.dart' show compute;
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/api/api_client.dart';
import 'package:snow_weather_info/extensions/date_time.dart';
import 'package:snow_weather_info/extensions/double.dart';
import 'package:snow_weather_info/model/data_station.dart';

part 'station_piemont_data_api.g.dart';

@Riverpod(keepAlive: true)
StationPiemontDataApi stationPiemontDataApi(Ref ref) {
  final client = ref.watch(apiClientProvider);

  return StationPiemontDataApi(client);
}

// Top-level isolate worker: parse raw decoded JSON into `DataStation` list.
List<DataStation> _parseJsonListIsolate(List<dynamic>? decoded) {
  final list = <DataStation>[];

  double? parseNum(Object? v) {
    if (v == null) return null;
    return double.tryParse(v.toString());
  }

  for (final st in decoded ?? []) {
    if (st is Map<String, dynamic>) {
      final stationCode = (st['station_code'])?.toString() ?? '';
      final dateStr = (st['date'])?.toString() ?? '';

      if (dateStr.isEmpty || stationCode.isEmpty) continue;

      final date = DateTime.tryParse(dateStr);
      if (date == null) continue;

      final temp = parseNum(st['air_temperature']);
      double? snow = parseNum(st['snow_height']);
      double? snowNew = parseNum(st['cum_rain_24h']);

      if (snow != null) snow = max(snow, 0.0).fromCm;
      if (snowNew != null) snowNew = max(snowNew, 0.0).fromCm;

      list.add(
        DataStation(
          date: date,
          id: stationCode,
          temperature: temp,
          snowHeight: snow,
          snowNewHeight: snowNew,
        ),
      );
    }
  }

  return list;
}

class StationPiemontDataApi {
  const StationPiemontDataApi(this.client);

  final Client client;

  // Piemonte data endpoint
  static const stationPiemontDataUrl =
      'https://utility.arpa.piemonte.it/api_realtime/data_pie';

  /// Fetch station data for the last [maxDaysFetch] days.
  /// If [stationCodes] is provided, fetches data per station (uses station_code param).
  /// Handles pagination (page, page_size) until no more pages.
  Future<List<DataStation>> getStationDatas({
    DateTime? currentDate,
    List<String> stationCodes = const [],
    int maxDaysFetch = 10,
  }) async {
    final results = <DataStation>[];

    final now = currentDate ?? DateTime.now();
    final dateFrom = now
        .subtract(Duration(days: maxDaysFetch))
        .toApiDateParam();

    for (final code in stationCodes) {
      results.addAll(await _fetchForStation(code, dateFrom));
    }

    return results;
  }

  Future<List<DataStation>> _fetchForStation(
    String stationCode,
    String dateFrom,
  ) async {
    int page = 1;
    const pageSize = 1000;
    final results = <DataStation>[];

    while (true) {
      final params = <String, String>{
        'date_from': dateFrom,
        'page': page.toString(),
        'page_size': pageSize.toString(),
        'station_code': stationCode,
      };

      final uri = Uri.parse(
        stationPiemontDataUrl,
      ).replace(queryParameters: params);
      final response = await client.get(uri);

      if (response.statusCode != 200) {
        log(
          'Erreur download piemont data (code ${response.statusCode}) for station ${stationCode} page $page',
        );
        break;
      }

      try {
        final decodedBody = json.decode(utf8.decode(response.bodyBytes));
        List<dynamic>? dataList;
        if (decodedBody is Map<String, dynamic> &&
            decodedBody['data'] is List) {
          dataList = decodedBody['data'] as List<dynamic>;
        } else {
          break;
        }

        if (dataList.isNotEmpty) {
          final parsed = await compute<List<dynamic>?, List<DataStation>>(
            _parseJsonListIsolate,
            dataList,
          );
          if (parsed.isEmpty) {
            break;
          }

          results.addAll(parsed);

          // Manage pagination
          if (parsed.length < pageSize) {
            break;
          }
          page++;

          if (page >
              (int.tryParse(decodedBody['total_pages']?.toString() ?? '0') ??
                  0)) {
            break;
          }
        }
      } catch (_) {
        break;
      }
    }

    return results;
  }
}
