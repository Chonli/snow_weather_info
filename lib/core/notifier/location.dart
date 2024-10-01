import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location.g.dart';

@riverpod
class UserLocation extends _$UserLocation {
  @override
  FutureOr<LatLng?> build() {
    return updateLocation();
  }

  FutureOr<LatLng?> updateLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      state = const AsyncData(null);
      return null;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        state = const AsyncData(null);
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      state = const AsyncData(null);
      return null;
    }

    final locationData = await Geolocator.getCurrentPosition();
    final location = LatLng(locationData.latitude, locationData.longitude);
    state = AsyncData(location);
    return location;
  }
}
