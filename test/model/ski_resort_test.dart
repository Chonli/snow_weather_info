import 'package:flutter_test/flutter_test.dart';
import 'package:snow_weather_info/model/mountain.dart';
import 'package:snow_weather_info/model/ski_resort.dart';

void main() {
  group('SkiResort', () {
    test('fromJson should correctly parse a valid JSON string', () {
      const jsonString = '''
      {
        "id": 1,
            "name": "Aillons Margeriaz",
            "mountain": "alpesNord",
            "webcams": [
                {
                    "name": "Sommet Des Biolles",
                    "url": "https://app.webcam-hd.com/aillons-margeriaz/les-biolles"
                },
                {
                    "name": "Tapis P'TIOU",
                    "url": "https://www.skaping.com/les-aillons/margeriaz"
                },
                {
                    "name": "Centre d'accueil",
                    "url": "https://www.skaping.com/aillons-margeriaz/1000"
                },
                {
                    "name": "Les crêtes",
                    "url": "https://www.skaping.com/aillons-margeriaz/roc-de-margeriaz"
                }
            ]
      }
      ''';

      final skiResort = SkiResort.fromJson(jsonString);

      expect(skiResort.name, 'Aillons Margeriaz');
      expect(skiResort.mountain, Mountain.alpesNord);
      expect(skiResort.webcams.length, 4);
      expect(skiResort.webcams.first.name, 'Sommet Des Biolles');
    });
  });
}
