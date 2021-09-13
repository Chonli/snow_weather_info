import 'package:shared_preferences/shared_preferences.dart';

const _lastStationPrefs = 'lastStationPrefs';
const _lastStationDataPrefs = 'lastStationDataPrefs';
const _favoritesStationPrefs = 'favoritesStationPrefs';

class Preferences {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  DateTime get lastStationDataDate =>
      DateTime.parse(_prefs.getString(_lastStationDataPrefs) ?? '19700101');
  DateTime get lastStationDate => DateTime.parse(
      _prefs.getString(_lastStationPrefs) ?? DateTime.now().toString());
  List<String> get favoritesStations =>
      _prefs.getStringList(_favoritesStationPrefs) ?? [];

  void setLastStationDataDate(DateTime lastStationData) {
    _prefs.setString(_lastStationDataPrefs, lastStationData.toString());
  }

  void setLastStationDate(DateTime lastStation) {
    _prefs.setString(_lastStationPrefs, lastStation.toString());
  }

  void updateFavoritesStations(List<String> favorites) {
    _prefs.setStringList(_favoritesStationPrefs, favorites);
  }
}
