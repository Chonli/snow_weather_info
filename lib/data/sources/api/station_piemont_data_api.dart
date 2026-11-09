// ignore_for_file: prefer_int_literals

import 'dart:async';
import 'dart:convert';
import 'dart:developer' show log;
import 'dart:math' show max;

import 'package:flutter/foundation.dart' show compute;
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
      final stationCode = st['station_code']?.toString() ?? '';
      final dateStr = st['date']?.toString() ?? '';

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
  const new(this.apiClient);

  final ApiClient apiClient;

  // Piemonte data endpoint
  static const stationPiemontDataUrl =
      'https://utility.arpa.piemonte.it/api_realtime/data_pie';

  static const _maxConcurrentRequests = 6;

  /// Récupère les mesures des stations [stationCodes] depuis la date la plus
  /// ancienne nécessaire. [dateFromPerStation] permet de n'exiger qu'un delta
  /// par station (dernière mesure connue en cache) : les stations partageant
  /// la même date de début sont regroupées en un même lot, paginé station
  /// par station.
  Future<List<DataStation>> getStationDatas({
    DateTime? currentDate,
    List<String> stationCodes = const [],
    Map<String, DateTime> dateFromPerStation = const {},
    int maxDaysFetch = 10,
  }) async {
    if (stationCodes.isEmpty) return [];

    final now = currentDate ?? DateTime.now();
    final globalMinDate = now.subtract(Duration(days: maxDaysFetch));

    // Regrouper les stations par date_from arrondi à l'heure (clés identiques
    // -> une seule requête multi-stations).
    final batches = <DateTime, List<String>>{};
    for (final code in stationCodes) {
      final last = dateFromPerStation[code];
      var from = last == null || last.isBefore(globalMinDate)
          ? globalMinDate
          : last;
      if (from.isAfter(now)) from = now;
      final key = DateTime(from.year, from.month, from.day, from.hour);
      batches.putIfAbsent(key, () => []).add(code);
    }

    final results = <DataStation>[];
    final semaphore = _Semaphore(_maxConcurrentRequests);
    await Future.wait(
      batches.entries.map((batch) async {
        await semaphore.acquire();
        try {
          results.addAll(
            await _fetchBatch(
              stationCodes: batch.value,
              dateFrom: batch.key.toApiDateParam(),
            ),
          );
        } finally {
          semaphore.release();
        }
      }),
    );

    return results;
  }

  /// L'API ne renvoie des données que pour un `station_code` unique par
  /// requête : les listes (séparées par des virgules ou en paramètres
  /// répétés) sont ignorées ou limitées à la dernière valeur. Une requête
  /// paginée est donc émise par station.
  Future<List<DataStation>> _fetchBatch({
    required List<String> stationCodes,
    required String dateFrom,
  }) async {
    final results = <DataStation>[];
    const pageSize = 1000;

    for (final stationCode in stationCodes) {
      int page = 1;

      while (true) {
        final params = <String, String>{
          'date_from': dateFrom,
          'page': page.toString(),
          'page_size': pageSize.toString(),
          'station_code': stationCode,
        };

        final uri = Uri.parse(stationPiemontDataUrl)
            .replace(queryParameters: params);
        final response = await apiClient.client.get(uri);

        if (response.statusCode != 200) {
          log(
            'Erreur download piemont data (code ${response.statusCode}) '
            'for station $stationCode page $page',
          );
          break;
        }

        try {
          final decodedBody = json.decode(utf8.decode(response.bodyBytes));
          if (decodedBody is! Map<String, dynamic> ||
              decodedBody['data'] is! List) {
            log(
              'Erreur download piemont data (data absente) '
              'for station $stationCode page $page',
            );
            break;
          }
          final dataList = decodedBody['data'] as List<dynamic>;
          if (dataList.isEmpty) break;

          final parsed = await compute<List<dynamic>?, List<DataStation>>(
            _parseJsonListIsolate,
            dataList,
          );
          results.addAll(parsed);

          if (parsed.length < pageSize) break;
          page++;

          if (page >
              (int.tryParse(decodedBody['total_pages']?.toString() ?? '0') ??
                  0)) {
            break;
          }
        } on Exception catch (error) {
          log(
            'Erreur download piemont data (exception $error) '
            'for station $stationCode page $page',
          );
          break;
        }
      }
    }

    return results;
  }
}

/// Limiteur de requêtes HTTP simultanées.
class _Semaphore {
  new(this._max);

  final int _max;
  int _active = 0;
  final _waiters = <Completer<void>>[];

  Future<void> acquire() async {
    if (_active < _max) {
      _active++;
      return;
    }
    final completer = Completer<void>();
    _waiters.add(completer);
    await completer.future;
  }

  void release() {
    if (_waiters.isNotEmpty) {
      _waiters.removeAt(0).complete();
    } else {
      _active--;
    }
  }
}
