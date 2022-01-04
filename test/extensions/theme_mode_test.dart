import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snow_weather_info/extensions/theme_mode.dart';

void main() {
  test('Theme mode extensions, verifiy title', () {
    const thDark = ThemeMode.dark;
    expect(thDark.displayTitle, 'Sombre');
    const thLight = ThemeMode.light;
    expect(thLight.displayTitle, 'Clair');
    const thSystem = ThemeMode.system;
    expect(thSystem.displayTitle, 'Système');
  });
}
