import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location.g.dart';

@riverpod
class UserLocation extends _$UserLocation {
  final _location = Location();

  @override
  FutureOr<LatLng?> build() {
    return updateLocation();
  }

  Future<LatLng?> updateLocation() async {
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    PermissionStatus permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.deniedForever) {
      return null;
    }

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    final locationData = await _location.getLocation();
    final safeLatitude = locationData.latitude;
    final safeLongitude = locationData.longitude;
    if (safeLatitude != null && safeLongitude != null) {
      return LatLng(safeLatitude, safeLongitude);
    }

    return null;
  }
}
