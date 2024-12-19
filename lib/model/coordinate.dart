import 'package:dart_mappable/dart_mappable.dart';
import 'package:latlong2/latlong.dart';

part 'coordinate.mapper.dart';

@MappableClass()
class Coordinate with CoordinateMappable {
  const Coordinate({required this.latitude, required this.longitude});

  final double latitude;
  final double longitude;
}

extension CoordinateExt on Coordinate {
  LatLng toLatLng() => LatLng(latitude, longitude);
}
