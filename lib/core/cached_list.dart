import 'dart:developer' show log;

import 'package:flutter/foundation.dart' show listEquals;
import 'package:snow_weather_info/core/local_data_metadata.dart';
import 'package:snow_weather_info/core/local_database.dart';
import 'package:snow_weather_info/core/meta_store.dart';
import 'package:snow_weather_info/data/sources/data/data_station_cache.dart';

/// Mode de rafraîchissement d'une [CachedList].
enum RefreshMode {
  /// Retourne le cache s'il est assez récent, sinon télécharge.
  ifStale,

  /// Retourne le cache immédiatement s'il existe et télécharge en
  /// arrière-plan (stale-while-revalidate).
  staleWhileRevalidate,

  /// Télécharge toujours.
  always,
}

/// Liste d'entités mise en cache dans un [LocalData] (blob sembast) avec
/// métadonnées de fraîcheur : cache si récent, fallback en cas d'échec
/// réseau, déduplication des appels concurrents et version incrémentée à
/// chaque changement (pour revalider les providers dépendants).
///
/// Utilisé par les collections remplaçables d'un coup (stations, stations de
/// ski) ; les mesures horaires par station utilisent [DataStationCache], une
/// persistance par entrée qui limite les écritures au delta.
class CachedList<T> {
  new({required this._localData, required this._maxAge, this.onError})
    : _meta = MetaStore(_localData.dataBase, _localData.storeKey);

  final LocalData<List<T>> _localData;
  final MetaStore _meta;
  final Duration _maxAge;

  /// Valeur de dernier recours quand le cache est vide et le réseau en échec.
  final Future<List<T>> Function()? onError;

  List<T>? _items;
  Future<List<T>>? _inFlight;
  int _version = 0;

  /// Incrémentée à chaque modification du cache ; permet aux providers de
  /// détecter les rafraîchissements en arrière-plan.
  int get version => _version;

  LocalDataMetadata get metadata => _meta.read();

  List<T> get cached => _items ??= _localData.read();

  bool isStale({DateTime? now}) =>
      metadata.isStale(maxAge: _maxAge, now: now ?? DateTime.now());

  /// Sert le cache ou rafraîchit depuis la source distante via [fetch].
  /// Un résultat null (échec réseau) conserve le cache ; si le cache est vide,
  /// [onError] sert de dernier recours.
  Future<List<T>> refresh({
    required Future<List<T>?> Function() fetch,
    RefreshMode mode = RefreshMode.ifStale,
    DateTime? now,
  }) async {
    final cached = this.cached;
    final stale = isStale(now: now);

    if (cached.isNotEmpty && !stale && mode != RefreshMode.always) {
      return cached;
    }

    final inFlight = _inFlight;
    if (inFlight != null) return await inFlight;

    final future = _fetch(fetch);
    _inFlight = future;
    try {
      final result = await future;
      if (mode == RefreshMode.staleWhileRevalidate &&
          stale &&
          cached.isNotEmpty) {
        // en mode stale-while-revalidate on sert le cache ; le résultat frais
        // sera vu par les listeners grâce à la version incrémentée.
        return cached;
      }

      return result;
    } on Exception {
      // en arrière-plan ou en mode stale, un échec de revalidation sert le cache
      if (cached.isNotEmpty) return cached;
      rethrow;
    } finally {
      _inFlight = null;
    }
  }

  Future<List<T>> _fetch(Future<List<T>?> Function() fetch) async {
    List<T>? items;
    try {
      items = await fetch();
    } on Exception catch (e) {
      log('CachedList fetch error: $e');
    }

    if (items != null) {
      if (!listEquals(cached, items)) {
        await _localData.save(items);
        _items = items;
        _version++;
      }
      await _meta.save(metadata.copyWith(lastSync: DateTime.now()));

      return items;
    }

    // échec réseau : on garde le cache, sinon le fallback
    final current = cached;
    if (current.isNotEmpty) return current;
    final fallback = await onError?.call();
    if (fallback != null && fallback.isNotEmpty) {
      await _localData.save(fallback);
      _items = fallback;
      _version++;
    }

    return _items ?? const [];
  }
}
