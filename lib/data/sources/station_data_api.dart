import 'dart:developer' show log;

import 'package:csv/csv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/model/data_station.dart';

part 'station_data_api.g.dart';

@Riverpod(keepAlive: true)
Future<List<DataStation>> apiStationData(
  Ref ref,
) async {
  final datas = <DataStation>[];

  for (int i = 7; i >= 0; --i) {
    final dateTime = DateTime.now().subtract(Duration(days: i));

    final dateStr = DateFormat('yyyyMMdd').format(dateTime);
    final url = Uri.parse(
      'https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/nivo.$dateStr.csv',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      datas.addAll(await _decodeStationData(response.body, ref));
      log('get data from $dateStr OK');
    }
  }

  log('donwload data station ok');

  return datas;
}

// Basic method to stub data
// Future<List<DataStation>> getData()  {
// {
//   final datas = rootBundle.loadString('assets/test_data/nivo.202102.txt');
//   return _decodeStationData(datas);
// }

Future<List<DataStation>> _decodeStationData(String data, Ref ref) async {
  try {
    final cvsResult = const CsvToListConverter().convert<dynamic>(
      data,
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
