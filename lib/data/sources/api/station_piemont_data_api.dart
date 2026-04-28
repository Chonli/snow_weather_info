import 'dart:convert';
import 'dart:developer' show log;
import 'dart:math' show max;

import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/api/api_client.dart';
import 'package:snow_weather_info/extensions/double.dart';
import 'package:snow_weather_info/model/data_station.dart';

part 'station_piemont_data_api.g.dart';

@Riverpod(keepAlive: true)
StationPiemontDataApi stationPiemontDataApi(Ref ref) {
  final client = ref.watch(apiClientProvider);

  return StationPiemontDataApi(client);
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
    int pageSize = 1000,
  }) async {
    final results = <DataStation>[];
    final now = currentDate ?? DateTime.now();
    final dateFrom = _formatDateParam(
      now.subtract(Duration(days: maxDaysFetch)),
    );

    // Helper to fetch pages for a given optional stationCode
    Future<void> _fetchForStation(String? stationCode) async {
      int page = 1;
      while (true) {
        final params = <String, String>{
          'date_from': dateFrom,
          'page': page.toString(),
          'page_size': pageSize.toString(),
        };
        if (stationCode != null && stationCode.isNotEmpty) {
          params['station_code'] = stationCode;
        }

        final uri = Uri.parse(
          stationPiemontDataUrl,
        ).replace(queryParameters: params);
        final response = await client.get(uri);

        if (response.statusCode != 200) {
          log(
            'Erreur download piemont data (code ${response.statusCode}) for station ${stationCode ?? 'ALL'} page $page',
          );
          break;
        }

        try {
          final decodedBody = json.decode(utf8.decode(response.bodyBytes));
          List<dynamic>? dataList;
          if (decodedBody is Map<String, dynamic> &&
              decodedBody['data'] is List) {
            dataList = decodedBody['data'] as List<dynamic>;
          } else if (decodedBody is List) {
            dataList = decodedBody;
          }

          if (dataList != null && dataList.isNotEmpty) {
            final parsed = _parseJsonList(dataList, now);
            if (parsed.isEmpty) break;
            // filter by date
            parsed.removeWhere(
              (DataStation d) =>
                  d.date.isBefore(now.subtract(Duration(days: maxDaysFetch))),
            );
            results.addAll(parsed);
            if (parsed.length < pageSize) break;
            page++;

            if (page >
                (int.tryParse(decodedBody['total_pages']?.toString() ?? '0') ??
                    0))
              break;
            else // safety check to avoid infinite loop
              continue;
          }
        } catch (_) {}
        break;
      }
    }

    if (stationCodes.isNotEmpty) {
      for (final code in stationCodes) {
        await _fetchForStation(code);
      }
    }

    return results;
  }

  static String _formatTwo(int v) => v.toString().padLeft(2, '0');

  static String _formatDateParam(DateTime dt) {
    // format: YYYY-MM-DDTHH:MM (no seconds)
    return '${dt.year}-${_formatTwo(dt.month)}-${_formatTwo(dt.day)}T${_formatTwo(dt.hour)}:${_formatTwo(dt.minute)}';
  }

  List<DataStation> _parseJsonList(List<dynamic> decoded, DateTime now) {
    final list = <DataStation>[];

    double? parseNum(Object? v) {
      if (v == null) return null;
      return double.tryParse(v.toString());
    }

    for (final e in decoded) {
      if (e is Map<String, dynamic>) {
        // heuristics based on available keys in doc
        final stationCode = (e['station_code'])?.toString() ?? '';
        final dateStr = (e['date'])?.toString() ?? '';

        if (dateStr.isEmpty || stationCode.isEmpty) {
          continue;
        }

        final date = DateTime.tryParse(dateStr);
        if (date == null) {
          continue;
        }

        final temp = parseNum(e['air_temperature']);
        double? snow = parseNum(e['snow_height']);
        double? snowNew = parseNum(e['cum_rain_24h']);

        // protect against negative values which can be present in the data and are not relevant for our use case
        if (snow != null) {
          snow = max(snow, 0.0).fromCm;
        }
        if (snowNew != null) {
          snowNew = max(snowNew, 0.0).fromCm;
        }

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
}
