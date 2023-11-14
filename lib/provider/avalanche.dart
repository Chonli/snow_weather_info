import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'avalanche.g.dart';

@Riverpod(keepAlive: true)
class AvalancheFeed extends _$AvalancheFeed {
  @override
  FutureOr<int> build() {
    return 0;
  }
}


  // TODO(APA): migrate
  // AtomFeed? get avalancheFeed => _avalancheFeed;
  // AtomFeed? _avalancheFeed;
  // @protected
  // set avalancheFeed(AtomFeed? value) {
  //   if (_avalancheFeed != value) {
  //     _avalancheFeed = value;
  //     notifyListeners();
  //   }
  // }