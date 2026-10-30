import 'dart:convert';
import 'dart:developer' show log;

import 'package:csv/csv.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/api/api_client.dart';
import 'package:snow_weather_info/model/data_station.dart';

part 'station_data_api.g.dart';

@Riverpod(keepAlive: true)
StationDataApi stationDataApi(Ref ref) {
  final client = ref.watch(apiClientProvider);

  return StationDataApi(client);
}

class StationDataApi {
  const new(this.client);

  final Client client;

  static const stationDataUrl =
      'https://tabular-api.data.gouv.fr/api/resources/1e4c56ff-dce5-4db7-b013-29ecbce16e2c/data/csv/';

  Future<List<DataStation>> getStationDatas({
    int maxDaysFetch = 7,
    DateTime? currentDate,
  }) async {
    final response = await client.get(Uri.parse(stationDataUrl));

    if (response.statusCode == 200) {
      final csvStr = utf8.decode(response.bodyBytes);
      final datas = await csvStr.decodeStationData();
      // limit row at maxDaysFetch
      final now = currentDate ?? DateTime.now();
      final minDate = now.subtract(const Duration(days: 30));
      datas.removeWhere((data) => data.date.isBefore(minDate));

      return datas;
    }

    log('Erreur download data station');
    return [];
  }
}

extension _DataStationStringExtension on String {
  static const _requiredColumns = ['geo_id_wmo', 'validity_time'];

  Future<List<DataStation>> decodeStationData() async {
    late final List<List<dynamic>> cvsResult;
    try {
      final myCodec = Csv(lineDelimiter: '\n', quoteMode: QuoteMode.strings);

      cvsResult = myCodec.decode(this);
    } on Exception catch (e) {
      log('Parse csv error: $e');

      return <DataStation>[];
    }

    if (cvsResult.length > 1) {
      // map column names to indexes, the api can reorder columns
      final header = cvsResult
          .removeAt(0)
          .map((column) => column?.toString() ?? '')
          .toList();
      if (_requiredColumns.every(header.contains)) {
        final indexes = {
          for (var i = 0; i < header.length; i++)
            if (header[i].isNotEmpty) header[i]: i,
        };
        final listData = <DataStation>[];
        for (final line in cvsResult) {
          try {
            final row = indexes.map(
              (name, index) => MapEntry(
                name,
                index < line.length ? line[index]?.toString() : null,
              ),
            );
            listData.add(DataStation.fromCsvRow(row));
          } on Exception catch (e) {
            log('Parse csv line error: $e');
          }
        }

        return listData;
      }
    }
    log('Parse csv error: empty');

    return <DataStation>[];
  }
}
