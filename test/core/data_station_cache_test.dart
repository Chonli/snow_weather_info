import 'package:flutter_test/flutter_test.dart';
import 'package:sembast/sembast_memory.dart';
import 'package:snow_weather_info/core/local_database.dart';
import 'package:snow_weather_info/data/sources/data/data_station_cache.dart';
import 'package:snow_weather_info/model/data_station.dart';

class _TestContainer extends LocalDataContainer {
  const new(super.database);

  @override
  String get name => 'station_data_box';

  LocalData<List<DataStation>> get allDataStations => load(
    key: 'all_station_data',
    serialize: (stations) => stations.map((e) => e.toJson()).toList(),
    deserialize: (json) => (json as List<dynamic>)
        .map((e) => DataStation.fromJson(e as String))
        .toList(),
    defaultValue: [],
  );
}

DataStation _data(String id, DateTime date, {double? snow}) =>
    DataStation(id: id, date: date, snowHeight: snow);

int dbCounter = 0;

void main() {
  late Database db;
  late DataStationCache cache;
  final day0 = DateTime(2026, 11);

  setUp(() async {
    db = await databaseFactoryMemory.openDatabase('db${dbCounter++}');
    cache = DataStationCache(
      _TestContainer(db).allDataStations,
      source: 'test',
    );
  });

  test('merge écrit les nouvelles mesures et les relit', () async {
    final written = await cache.merge([
      _data('1', day0, snow: 10),
      _data('1', day0.add(const Duration(hours: 1)), snow: 11),
      _data('2', day0, snow: 20),
    ]);

    expect(written, 3);
    final all = await cache.read();
    expect(all.length, 3);
    expect(all.every((d) => d.snowHeight != null), isTrue);
  });

  test('merge ne réécrit pas les mesures identiques (delta)', () async {
    final items = [_data('1', day0, snow: 10), _data('2', day0, snow: 20)];
    await cache.merge(items);

    final second = await cache.merge(items);
    expect(second, 0);

    // une mesure modifiée est réécrite
    final third = await cache.merge([_data('1', day0, snow: 12)]);
    expect(third, 1);
    final all = await cache.read(from: day0, onlyIds: {'1'});
    expect(single(all).snowHeight, 12);
  });

  test('lastDatePerStation donne la dernière mesure par station', () async {
    await cache.merge([
      _data('1', day0),
      _data('1', day0.add(const Duration(hours: 5))),
      _data('2', day0.subtract(const Duration(days: 1))),
    ]);

    final last = await cache.lastDatePerStation();

    expect(last['1']!.compareTo(day0.add(const Duration(hours: 5))), 0);
    expect(last['2']!.compareTo(day0.subtract(const Duration(days: 1))), 0);
  });

  test('read filtre sur la fenêtre de dates et les stations', () async {
    await cache.merge([
      _data('1', day0),
      _data('1', day0.add(const Duration(days: 3))),
      _data('2', day0.add(const Duration(days: 1))),
    ]);

    final window = await cache.read(
      from: day0.add(const Duration(days: 1)),
      to: day0.add(const Duration(days: 2)),
    );
    expect(window.length, 1);
    expect(single(window).id, '2');

    final onlyOne = await cache.read(onlyIds: {'1'});
    expect(onlyOne.length, 2);
  });

  test('merge avec pruneBefore supprime les mesures trop anciennes', () async {
    await cache.merge([
      _data('1', day0.subtract(const Duration(days: 20))),
      _data('1', day0),
    ]);

    await cache.merge([
      _data('1', day0.add(const Duration(hours: 1))),
    ], pruneBefore: day0.subtract(const Duration(days: 10)));

    final all = await cache.read();
    expect(all.length, 2);
    expect(all.any((d) => d.date.compareTo(day0) == 0), isTrue);
    expect(
      all.any((d) => d.date.isBefore(day0.subtract(const Duration(days: 10)))),
      isFalse,
    );
  });

  test('migration du blob existant vers le stockage par entrée', () async {
    final legacy = _TestContainer(db).allDataStations;
    await legacy.save([_data('9', day0, snow: 5)]);

    final migrated = await cache.read();
    expect(migrated.length, 1);
    expect(single(migrated).snowHeight, 5);

    // l'ancien blob est vidé
    expect(legacy.read(), isEmpty);

    // une nouvelle instance ne re-migre pas et conserve les données
    final cache2 = DataStationCache(
      _TestContainer(db).allDataStations,
      source: 'test',
    );
    await cache2.merge([_data('9', day0.add(const Duration(hours: 1)))]);
    expect((await cache2.read()).length, 2);
  });
}

DataStation single(List<DataStation> list) {
  expect(list.length, 1);

  return list.first;
}
