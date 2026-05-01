import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String get toLocalData => toIso8601String();

  /// Format as `YYYY-MM-DDTHH:MM` (no seconds) for the Piemonte API.
  String toApiDateParam() => DateFormat("yyyy-MM-dd'T'HH:mm").format(this);
}
