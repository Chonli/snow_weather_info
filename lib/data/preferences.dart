import 'package:shared_preferences/shared_preferences.dart';

final String _lastStationPrefs = "lastStationPrefs";
final String _lastStationDataPrefs = "lastStationDataPrefs";

class Preferences {
  SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  T getEnumFromString<T>(Iterable<T> values, String value) {
    return values.firstWhere((type) => type.toString().split(".").last == value,
        orElse: () => null);
  }

  DateTime get lastStationDataDate =>
      DateTime.parse(_prefs.getString(_lastStationDataPrefs) ?? "19700101");
  DateTime get lastStationDate => DateTime.parse(
      _prefs.getString(_lastStationPrefs) ?? DateTime.now().toString());

  void setLastStationDataDate(DateTime lastStationData) {
    _prefs.setString(_lastStationDataPrefs, lastStationData.toString());
  }

  void setLastStationDate(DateTime lastStation) {
    _prefs.setString(_lastStationPrefs, lastStation.toString());
  }
}
