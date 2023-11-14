import 'dart:developer' show log;

import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/preferences.dart';
import 'package:snow_weather_info/model/data_station.dart';

part 'station_data_api.g.dart';

@Riverpod(keepAlive: true)
StationDataAPI stationDataAPI(StationDataAPIRef ref) {
  final lastDateData = ref.read(lastStationDataSettingsProvider);
  return StationDataAPI(lastDateData);
}

class StationDataAPI {
  StationDataAPI(this.lastDateData);

  final client = http.Client();

  final DateTime lastDateData;

  Future<(DateTime, List<DataStation>)> getData() async {
    final datas = <DataStation>[];
    DateTime dowloadTime = lastDateData;

    log('last data $lastDateData');

    for (int i = 7; i >= 0; --i) {
      final dateTime = DateTime.now().subtract(Duration(days: i));

      if (dateTime.isAfter(lastDateData)) {
        final dateStr = DateFormat('yyyyMMdd').format(dateTime);
        final url = Uri.parse(
          'https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Nivo/nivo.$dateStr.csv',
        );
        final response = await http.get(url);

        if (response.statusCode == 200) {
          datas.addAll(_decodeStationData(response.body));
          dowloadTime = lastDateData;
          // ref.read(lastStationDataSettingsProvider.notifier).updateDate(
          //       dateTime,
          //     );
          log('get data from $dateStr OK');
        }
      }
    }

    return (dowloadTime, datas);
  }

  // Basic method to stub data
  // Future<List<DataStation>> getData()  {
  // {
  //   final datas = rootBundle.loadString('assets/test_data/nivo.202102.txt');
  //   return _decodeStationData(datas);
  // }

  List<DataStation> _decodeStationData(String data) {
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

          // await Future.forEach(listData,
          //     (d) => ref.read(databaseHelperProvider).insertStationData(d));

          return listData;
        }
      }

      return <DataStation>[];
    } on Exception catch (e) {
      log("Parse csv error: $e");

      return <DataStation>[];
    }
  }
}
