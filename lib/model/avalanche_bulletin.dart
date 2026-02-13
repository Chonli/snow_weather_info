import 'package:dart_mappable/dart_mappable.dart';
import 'package:snow_weather_info/model/mountain.dart';

part 'avalanche_bulletin.mapper.dart';

@MappableClass()
sealed class AbstractBulletin with AbstractBulletinMappable {
  const AbstractBulletin({
    required this.massifName,
    required this.mountain,
  });

  final String massifName;
  final Mountain mountain;
}

@MappableClass()
class AvalancheBulletinFr extends AbstractBulletin
    with AvalancheBulletinFrMappable {
  const AvalancheBulletinFr({
    required super.massifName,
    required this.beraNumber,
    required super.mountain,
  });

  final int beraNumber;
}

@MappableClass()
class AvalancheBulletinPdf extends AbstractBulletin
    with AvalancheBulletinPdfMappable {
  const AvalancheBulletinPdf({
    required super.massifName,
    required this.pdfPath,
    required super.mountain,
  });

  final String pdfPath;
}

@MappableClass()
class AvalancheBulletinAndorre extends AbstractBulletin
    with AvalancheBulletinAndorreMappable {
  const AvalancheBulletinAndorre({
    required super.massifName,
    required this.url,
    required super.mountain,
  });

  final String url;
}
