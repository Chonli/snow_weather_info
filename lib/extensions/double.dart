extension DoubleExtension on double {
  String toStringSnowHeigth() {
    return '${(this * 100).toStringAsFixed(1)}cm';
  }

  String toStringTemperature() {
    return '${toStringAsFixed(1)}°C';
  }
}
