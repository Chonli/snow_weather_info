import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class LocationNotifier extends ChangeNotifier {
  final _location = Location();

  LatLng? _userLocation;
  LatLng? get userLocation => _userLocation;
  set userLocation(LatLng? value) {
    if (_userLocation != value) {
      print('userLocation');
      _userLocation = value;
      notifyListeners();
    }
  }

  Future<void> updateLocation() async {
    print('updateLocation');
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    PermissionStatus permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.deniedForever) {
      return;
    }

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final locationData = await _location.getLocation();
    final safeLatitude = locationData.latitude;
    final safeLongitude = locationData.longitude;
    if (safeLatitude != null && safeLongitude != null) {
      userLocation = LatLng(safeLatitude, safeLongitude);
    }
  }
}
