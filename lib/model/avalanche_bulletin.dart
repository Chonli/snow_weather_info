import 'package:dart_mappable/dart_mappable.dart';
import 'package:snow_weather_info/model/mountain.dart';

part 'avalanche_bulletin.mapper.dart';

@MappableClass()
class AvalancheBulletin with AvalancheBulletinMappable {
  const AvalancheBulletin({
    required this.massifName,
    required this.beraNumber,
    required this.mountain,
  });

  final String massifName;
  final int beraNumber;
  final Mountain mountain;
}
