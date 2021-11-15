import 'package:flutter/material.dart';

extension SelectedColorExtension on ThemeMode {
  String get displayTitle {
    switch (this) {
      case ThemeMode.system:
        return 'Système';
      case ThemeMode.dark:
        return 'Sombre';
      case ThemeMode.light:
        return 'Clair';
      default:
        return 'Inconnue';
    }
  }
}
