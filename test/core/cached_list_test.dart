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
    final items = await cache.refresh(
      fetch: (etag) async => const RemoteResult(['a', 'b'], etag: 'v1'),
    );

    expect(items, ['a', 'b']);
    expect(cache.metadata.lastSync, isNotNull);
    expect(cache.metadata.etag, 'v1');
    // persisté dans le blob
    expect(_TestContainer(db).items.read(), ['a', 'b']);
  });

  test('cache frais : pas de téléchargement', () async {
    var calls = 0;
    Future<RemoteResult<List<String>>?> f(String? etag) async {
      calls++;

      return const RemoteResult(['x']);
    }

    await cache.refresh(fetch: f);
    final second = await cache.refresh(fetch: f);

    expect(calls, 1);
    expect(second, ['x']);
  });

  test('cache périmé : re-téléchargement', () async {
    var calls = 0;
    Future<RemoteResult<List<String>>?> f(String? etag) async {
      calls++;

      return RemoteResult(['x$calls']);
    }

    await cache.refresh(fetch: f);
    final future = DateTime.now().add(const Duration(days: 2));
    final second = await cache.refresh(fetch: f, now: future);

    expect(calls, 2);
    expect(second, ['x2']);
  });

  test('appels concurrents : une seule fetch', () async {
    var calls = 0;
    Future<RemoteResult<List<String>>?> f(String? etag) async {
      calls++;
      await Future<void>.delayed(const Duration(milliseconds: 20));

      return const RemoteResult(['a']);
    }

    final results = await Future.wait([
      cache.refresh(fetch: f),
      cache.refresh(fetch: f),
    ]);

    expect(calls, 1);
    expect(results.first, results.last);
  });

  test('304 : le cache est conservé et lastSync rafraîchi', () async {
    await cache.refresh(
      fetch: (etag) async => const RemoteResult(['a'], etag: 'v1'),
    );
    final firstSync = cache.metadata.lastSync;

    final items = await cache.refresh(
      fetch: (etag) async {
        expect(etag, 'v1');

        return const RemoteResult.notModified();
      },
      now: DateTime.now().add(const Duration(days: 2)),
    );

    expect(items, ['a']);
    expect(cache.metadata.etag, 'v1');
    expect(
      cache.metadata.lastSync!.isAfter(firstSync!) ||
          cache.metadata.lastSync == firstSync,
      isTrue,
    );
  });

  test('échec réseau sans cache : fallback onError', () async {
    final cacheWithError = CachedList<String>(
      localData: _TestContainer(db).items,
      maxAge: const Duration(hours: 1),
      onError: () async => ['fallback'],
    );

    final items = await cacheWithError.refresh(fetch: (etag) async => null);

    expect(items, ['fallback']);
  });

  test('échec réseau avec cache : le cache est servi', () async {
    await cache.refresh(fetch: (etag) async => const RemoteResult(['a']));

    final items = await cache.refresh(
      fetch: (etag) async => null,
      now: DateTime.now().add(const Duration(days: 2)),
    );

    expect(items, ['a']);
  });
}
