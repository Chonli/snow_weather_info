extension StringNullExtension on String? {
  double? parseDouble({double? addValue}) {
    double? data;
    if (this != null && this != 'mq') {
      data = double.tryParse(this!);
      if (addValue != null && data != null) {
        data += addValue;
      }
    }

    return data;
  }
}
