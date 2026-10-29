import 'package:flutter_test/flutter_test.dart';
import 'package:snow_weather_info/extensions/stations_data.dart';
import 'package:snow_weather_info/model/data_station.dart';

DataStation _data(String id, DateTime date) =>
    DataStation(id: id, date: date);

void main() {
  group('onePerSlot', () {
    test('garde une mesure toutes les 4h par station', () {
      // 24 mesures horaires d'une meme station
      final hourly = [
        for (var h = 0; h < 24; h++) _data('158', DateTime(2026, 4, 20, h)),
      ];

      final filtered = hourly.onePerSlot(intervalHours: 4);

      expect(filtered.length, 6);
      expect(
        filtered.map((d) => d.date.hour).toList(),
        [20, 16, 12, 8, 4, 0], // tri par date decroissante
      );
      expect(filtered.every((d) => d.date.hour % 4 == 0), isTrue);
    });

    test('ne melange pas les stations', () {
      final hourly = [
        for (var h = 8; h < 12; h++) ...[_data('1', DateTime(2026, 4, 20, h)), _data('2', DateTime(2026, 4, 20, h))],
      ];

      final filtered = hourly.onePerSlot(intervalHours: 4);

      expect(filtered.length, 2);
      expect(filtered.map((d) => d.id).toSet(), {'1', '2'});
      expect(filtered.every((d) => d.date.hour == 8), isTrue);
    });

    test('garde la mesure la plus proche du debut de creneau si les heures pile manquent', () {
      final datas = [
        _data('1', DateTime(2026, 4, 20, 9, 30)),
        _data('1', DateTime(2026, 4, 20, 10)),
        _data('1', DateTime(2026, 4, 20, 11)),
      ];

      final filtered = datas.onePerSlot(intervalHours: 4);

      expect(filtered.length, 1);
      expect(filtered.single.date, DateTime(2026, 4, 20, 9, 30));
    });

    test('list vide', () {
      expect(<DataStation>[].onePerSlot(intervalHours: 4), isEmpty);
    });
  });
}
