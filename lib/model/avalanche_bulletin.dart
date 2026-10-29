import 'package:snow_weather_info/model/mountain.dart';

sealed class AbstractBulletin {
  const new({required this.massifName, required this.mountain});

  final String massifName;
  final Mountain mountain;
}

class AvalancheBulletinFr extends AbstractBulletin {
  const new({
    required super.massifName,
    required this.beraNumber,
    required super.mountain,
  });

  final int beraNumber;
}

class AvalancheBulletinPdf extends AbstractBulletin {
  const new({
    required super.massifName,
    required this.pdfPath,
    required super.mountain,
  });

  final String pdfPath;
}

class AvalancheBulletinAndorre extends AbstractBulletin {
  const new({
    required super.massifName,
    required this.url,
    required super.mountain,
  });

  final String url;
}
