import 'package:flutter/foundation.dart';

class DataStationNotifier extends ChangeNotifier {
  int get currentIndex => _currentIndex;
  int _currentIndex = 0;
  set currentIndex(int value) {
    if (_currentIndex != value) {
      _currentIndex = value;
      notifyListeners();
    }
  }
}
