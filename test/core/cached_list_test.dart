import 'package:flutter_test/flutter_test.dart';
import 'package:sembast/sembast_memory.dart';
import 'package:snow_weather_info/core/cached_list.dart';
import 'package:snow_weather_info/core/local_database.dart';

class _TestContainer extends LocalDataContainer {
  const new(super.database);

  @override
  String get name => 'test_box';

  LocalData<List<String>> get items => load(
    key: 'items',
    serialize: (list) => list,
    deserialize: (json) => (json as List<dynamic>).cast<String>(),
    defaultValue: [],
  );
}

int dbCounter = 0;

void main() {
  late Database db;
  late CachedList<String> cache;

  setUp(() async {
    db = await databaseFactoryMemory.openDatabase('db${dbCounter++}');
    cache = CachedList<String>(
      localData: _TestContainer(db).items,
      maxAge: const Duration(hours: 1),
    );
  });

  test('cache vide : télécharge et persiste', () async {
    final items = await cache.refresh(fetch: () async => ['a', 'b']);

    expect(items, ['a', 'b']);
    expect(cache.metadata.lastSync, isNotNull);
    // persisté dans le blob
    expect(_TestContainer(db).items.read(), ['a', 'b']);
  });

  test('cache frais : pas de téléchargement', () async {
    var calls = 0;
    Future<List<String>?> f() async {
      calls++;

      return ['x'];
    }

    await cache.refresh(fetch: f);
    final second = await cache.refresh(fetch: f);

    expect(calls, 1);
    expect(second, ['x']);
  });

  test('cache périmé : re-téléchargement', () async {
    var calls = 0;
    Future<List<String>?> f() async {
      calls++;

      return ['x$calls'];
    }

    await cache.refresh(fetch: f);
    final future = DateTime.now().add(const Duration(days: 2));
    final second = await cache.refresh(fetch: f, now: future);

    expect(calls, 2);
    expect(second, ['x2']);
  });

  test('appels concurrents : une seule fetch', () async {
    var calls = 0;
    Future<List<String>?> f() async {
      calls++;
      await Future<void>.delayed(const Duration(milliseconds: 20));

      return ['a'];
    }

    final results = await Future.wait([
      cache.refresh(fetch: f),
      cache.refresh(fetch: f),
    ]);

    expect(calls, 1);
    expect(results.first, results.last);
  });

  test('données inchangées : version non incrémentée', () async {
    await cache.refresh(fetch: () async => ['a']);
    final version = cache.version;

    await cache.refresh(
      fetch: () async => ['a'],
      now: DateTime.now().add(const Duration(days: 2)),
    );

    expect(cache.version, version);
  });

  test('données modifiées : version incrémentée', () async {
    await cache.refresh(fetch: () async => ['a']);
    final version = cache.version;

    final items = await cache.refresh(
      fetch: () async => ['b'],
      now: DateTime.now().add(const Duration(days: 2)),
    );

    expect(items, ['b']);
    expect(cache.version, version + 1);
  });

  test('échec réseau sans cache : fallback onError', () async {
    final cacheWithError = CachedList<String>(
      localData: _TestContainer(db).items,
      maxAge: const Duration(hours: 1),
      onError: () async => ['fallback'],
    );

    final items = await cacheWithError.refresh(fetch: () async => null);

    expect(items, ['fallback']);
  });

  test('échec réseau avec cache : le cache est conservé', () async {
    await cache.refresh(fetch: () async => ['a']);

    final items = await cache.refresh(
      fetch: () async => null,
      now: DateTime.now().add(const Duration(days: 2)),
    );

    expect(items, ['a']);
  });
}
