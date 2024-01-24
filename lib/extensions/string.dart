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

  bool safeSearch(String search) {
    return switch (this) {
      final String value => value.toLowerCase().contains(
            search.toLowerCase(),
          ),
      _ => false,
    };
  }
}
