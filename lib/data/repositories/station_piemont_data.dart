import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/repositories/data_station_cache.dart';
import 'package:snow_weather_info/data/repositories/station_piemont.dart';
import 'package:snow_weather_info/data/sources/api/station_piemont_data_api.dart';
import 'package:snow_weather_info/data/sources/data/data_station_cache.dart';
import 'package:snow_weather_info/extensions/stations_data.dart';
import 'package:snow_weather_info/model/data_station.dart';

part 'station_piemont_data.g.dart';

@Riverpod(keepAlive: true)
StationPiemontDataRepository stationPiemontDataRepository(Ref ref) {
  final api = ref.watch(stationPiemontDataApiProvider);
  final stationRepo = ref.watch(stationPiemontRepositoryProvider);
  final cache = ref.watch(piemontDataStationCacheProvider);

  return StationPiemontDataRepository(api, stationRepo, cache);
}

class StationPiemontDataRepository {
  const new(this.stationPiemontDataApi, this.stationPiemontRepo, this.cache);

  final StationPiemontDataApi stationPiemontDataApi;
  final StationPiemontRepository stationPiemontRepo;
  final DataStationCache cache;

  static const maxDaysFetch = 10;

  /// Les données Piemonte sont publiées chaque heure ; on ne garde qu'une
  /// mesure toutes les [dataIntervalHours] heures pour limiter les données
  /// stockées/affichées.
  static const dataIntervalHours = 6;

  /// Fenêtre de remontée maximale en cas de trou de synchronisation.
  static const _resyncAfter = Duration(hours: 5);

  Future<List<DataStation>> getDataStation({DateTime? currentDate}) async {
    final now = currentDate ?? DateTime.now();
    final windowStart = now.subtract(const Duration(days: maxDaysFetch));

    final stations = await stationPiemontRepo.getStations(currentDate: now);
    final stationCodes = stations.map((s) => s.id).toList();

    // Delta : pour chaque station, reprendre à sa dernière mesure connue
    // (moins une marge de sécurité), dans la limite de la fenêtre.
    final lastDates = await cache.lastDatePerStation();
    final dateFromPerStation = <String, DateTime>{};
    final staleIds = <String>[];
    for (final code in stationCodes) {
      final last = lastDates[code];
      if (last == null || now.difference(last) >= _resyncAfter) {
        staleIds.add(code);
        continue;
      }
      dateFromPerStation[code] = last.subtract(const Duration(hours: 1));
    }

    // Stations sans cache ou en retard : fenêtre complète, rafraîchies en
    // priorité ; stations à jour : delta uniquement.
    final fetched = <DataStation>[];
    if (staleIds.isNotEmpty) {
      fetched.addAll(
        await stationPiemontDataApi.getStationDatas(
          currentDate: now,
          stationCodes: staleIds,
        ),
      );
    }
    if (dateFromPerStation.isNotEmpty) {
      fetched.addAll(
        await stationPiemontDataApi.getStationDatas(
          currentDate: now,
          stationCodes: dateFromPerStation.keys.toList(),
          dateFromPerStation: dateFromPerStation,
        ),
      );
    }

    if (fetched.isNotEmpty) {
      await cache.merge(
        fetched.onePerSlot(intervalHours: dataIntervalHours),
        pruneBefore: windowStart,
      );
      await cache.saveMetadata(cache.metadata.copyWith(lastSync: now));
    }

    final cached = await cache.read(from: windowStart);
    return cached.onePerSlot(intervalHours: dataIntervalHours);
  }
}
