import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String get toStringSnowHeigth => '${toCm.toStringAsFixed(1)}cm';

  String get toStringTemperature => '${toStringAsFixed(1)}°C';

  double get toCm => this * 100;

  String get toDate => DateFormat.Md().format(
    DateTime.fromMillisecondsSinceEpoch(
      toInt(),
    ),
  );
}
