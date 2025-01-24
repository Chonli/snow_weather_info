import 'package:dart_mappable/dart_mappable.dart';
import 'package:snow_weather_info/model/coordinate.dart';
import 'package:snow_weather_info/model/mountain.dart';
import 'package:snow_weather_info/model/webcam.dart';

part 'ski_resort.mapper.dart';

@MappableClass()
class SkiResort with SkiResortMappable {
  const SkiResort({
    required this.id,
    required this.name,
    required this.mountain,
    this.position,
    this.description,
    this.webcams = const [],
  });

  final int id;
  final String name;
  final Mountain mountain;
  final Coordinate? position;
  final String? description;
  final List<WebCam> webcams;
}
