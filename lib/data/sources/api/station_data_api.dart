import 'dart:convert';
import 'dart:developer' show log;

import 'package:archive/archive.dart';
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

// new link data https://www.data.gouv.fr/api/1/datasets/r/2fc62fab-7379-4bb1-afca-7c52c35d6636

class StationDataApi {
  const StationDataApi(this.client);

  final Client client;

  static const stationDataUrl =
      'https://www.data.gouv.fr/api/1/datasets/r/2fc62fab-7379-4bb1-afca-7c52c35d6636';

  Future<List<DataStation>> getStationDatas({
    int maxDaysFetch = 7,
    DateTime? currentDate,
  }) async {
    final response = await client.get(
      Uri.parse(stationDataUrl),
    );

    if (response.statusCode == 200) {
      // Unzip .gz to extract csv
      final decompressed = GZipDecoder().decodeBytes(response.bodyBytes);
      final csvStr = utf8.decode(decompressed);
      final datas = await csvStr.decodeStationData();
      // limit row at maxDaysFetch
      final now = currentDate ?? DateTime.now();
      final minDate = now.subtract(Duration(days: maxDaysFetch));
      datas.removeWhere((data) => data.date.isBefore(minDate));

      return datas;
    }

    log('Erreur download data station');
    return [];
  }
}

extension _DataStationStringExtension on String {
  Future<List<DataStation>> decodeStationData() async {
    late final List<List<dynamic>> cvsResult;
    try {
      cvsResult = const CsvToListConverter().convert<dynamic>(
        this,
        fieldDelimiter: ';',
        eol: '\n',
        shouldParseNumbers: false,
        allowInvalid: true,
      );
    } on Exception catch (e) {
      log('Parse csv error: $e');

      return <DataStation>[];
    }

    if (cvsResult.length > 1) {
      if (cvsResult[0].length >= 34) {
        // delete header line
        cvsResult.removeAt(0);
        final listData = <DataStation>[];
        for (final line in cvsResult) {
          try {
            listData.add(DataStation.fromList(line));
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
