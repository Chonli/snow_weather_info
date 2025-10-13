import 'dart:developer' show log;

import 'package:csv/csv.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
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
  const StationDataApi(this.client);

  final Client client;

  Future<List<DataStation>> getStationDatas({int maxDaysFetch = 7}) async {
    final datas = <DataStation>[];
    final now = DateTime.now();

    for (int i = 0; i <= maxDaysFetch; ++i) {
      final dateTime = now.subtract(Duration(days: i));

      final dateStr = DateFormat('yyyyMMdd').format(dateTime);
      final url = Uri.parse(
        'https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/nivo.$dateStr.csv',
      );
      final response = await client.get(url);

      if (response.statusCode == 200) {
        datas.addAll(await response.body.decodeStationData());
        log('get data from $dateStr OK');
      }
    }

    log('donwload data station ok');

    return datas;
  }
}

// Basic method to stub data
// Future<List<DataStation>> getData()  {
// {
//   final datas = rootBundle.loadString('assets/test_data/nivo.202102.txt');
//   return _decodeStationData(datas);
// }

extension _DataStationStringExtension on String {
  Future<List<DataStation>> decodeStationData() async {
    try {
      final cvsResult = const CsvToListConverter().convert<dynamic>(
        this,
        fieldDelimiter: ';',
        eol: '\n',
        shouldParseNumbers: false,
      );

      if (cvsResult.length > 1) {
        if (cvsResult[0].length > 2) {
          cvsResult.removeAt(0);
          final listData = cvsResult.map<DataStation>(
            (line) {
              return DataStation.fromList(line);
            },
          ).toList();

          return listData;
        }
      }

      return <DataStation>[];
    } on Exception catch (e) {
      log('Parse csv error: $e');

      return <DataStation>[];
    }
  }
}
