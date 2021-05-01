import 'package:dart_rss/dart_rss.dart';

extension AtomItemExtension on AtomItem {
  String get shortTitle => title.contains(',')
      ? title.replaceFirst(RegExp('.*, '), '')
      : 'Avalanche';

  String get date => title.substring(13, 23);

  String get massif =>
      title.replaceFirst(RegExp('.* : '), '').replaceFirst(RegExp(', .*'), '');

  String get url => links?.first?.href;
}
