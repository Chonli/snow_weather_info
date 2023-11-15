import 'package:dart_rss/domain/atom_feed.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/sources/avalanche_api.dart';

part 'avalanche.g.dart';

@Riverpod(keepAlive: true)
class AvalancheFeed extends _$AvalancheFeed {
  @override
  FutureOr<AtomFeed?> build() {
    final client = ref.watch(avalancheAPIProvider);
    return client.getAvalanche();
  }
}
