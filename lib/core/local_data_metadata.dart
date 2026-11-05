import 'package:flutter/foundation.dart' show immutable;

/// Métadonnées de synchronisation d'une collection mise en cache.
@immutable
class LocalDataMetadata {
  const new({required this.lastSync, this.etag});

  factory fromMap(Map<String, Object?> map) {
    return LocalDataMetadata(
      lastSync: switch (map['last_sync']) {
        final String value => DateTime.tryParse(value),
        _ => null,
      },
      etag: map['etag'] as String?,
    );
  }

  static const empty = LocalDataMetadata(lastSync: null);

  /// Date de dernière synchronisation avec la source distante, null si jamais
  /// synchronisé.
  final DateTime? lastSync;

  /// ETag renvoyé par la source distante pour les requêtes conditionnelles
  /// (`If-None-Match`), null si non fourni.
  final String? etag;

  bool isStale({required Duration maxAge, required DateTime now}) {
    final last = lastSync;
    return last == null || now.difference(last) >= maxAge;
  }

  LocalDataMetadata copyWith({DateTime? lastSync, String? etag}) {
    return LocalDataMetadata(
      lastSync: lastSync ?? this.lastSync,
      etag: etag ?? this.etag,
    );
  }

  Map<String, Object?> toMap() {
    return {
      if (lastSync != null) 'last_sync': lastSync!.toIso8601String(),
      if (etag != null) 'etag': etag,
    };
  }

  @override
  bool operator ==(Object other) =>
      other is LocalDataMetadata &&
      other.lastSync == lastSync &&
      other.etag == etag;

  @override
  int get hashCode => Object.hash(lastSync, etag);

  @override
  String toString() => 'LocalDataMetadata(lastSync: $lastSync, etag: $etag)';
}
