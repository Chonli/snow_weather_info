import 'package:flutter_test/flutter_test.dart';
import 'package:snow_weather_info/extensions/string.dart';

void main() {
  test('String extensions, verifiy parseDouble for cvs file', () {
    //nominal case
    final htSnow = '3.123456'.parseDouble();
    expect(htSnow, 3.123456);

    //invalid number
    final htSnow2 = '3.adf'.parseDouble();
    expect(htSnow2, null);
    final htSnow3 = 'mq'.parseDouble();
    expect(htSnow3, null);

    //Add value
    final htSnow4 = '3.123456'.parseDouble(addValue: 12.34);
    expect(htSnow4, 12.34 + 3.123456);
  });
}
