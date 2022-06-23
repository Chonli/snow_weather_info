import 'package:flutter_test/flutter_test.dart';
import 'package:snow_weather_info/extensions/double.dart';

void main() {
  test(
    'Double extensions, verifiy toStringSnowHeigth and toStringTemperature',
    () {
      const htSnow = 3.123456;
      expect(htSnow.toStringSnowHeigth(), '312.3cm');
      const temp = 3.123;
      expect(temp.toStringTemperature(), '3.1°C');
    },
  );
}
