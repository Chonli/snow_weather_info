import 'package:material_ui/material_ui.dart';

extension SelectedColorExtension on ThemeMode {
  String get displayTitle => switch (this) {
    ThemeMode.system => 'Système',
    ThemeMode.dark => 'Sombre',
    ThemeMode.light => 'Clair',
  };
}
