import 'package:flutter/foundation.dart' show immutable;

/// Métadonnées de synchronisation d'une collection mise en cache.
@immutable
class LocalDataMetadata {
  const new({required this.lastSync});

  factory fromMap(Map<String, Object?> map) {
    return LocalDataMetadata(
      lastSync: switch (map['last_sync']) {
        final String value => DateTime.tryParse(value),
        _ => null,
      },
    );
  }

  static const empty = LocalDataMetadata(lastSync: null);

  /// Date de dernière synchronisation avec la source distante, null si jamais
  /// synchronisé.
  final DateTime? lastSync;

  bool isStale({required Duration maxAge, required DateTime now}) {
    final last = lastSync;
    return last == null || now.difference(last) >= maxAge;
  }

  LocalDataMetadata copyWith({DateTime? lastSync}) {
    return LocalDataMetadata(lastSync: lastSync ?? this.lastSync);
  }

  Map<String, Object?> toMap() {
    return {if (lastSync != null) 'last_sync': lastSync!.toIso8601String()};
  }

  @override
  bool operator ==(Object other) =>
      other is LocalDataMetadata && other.lastSync == lastSync;

  @override
  int get hashCode => lastSync.hashCode;

  @override
  String toString() => 'LocalDataMetadata(lastSync: $lastSync)';
}
