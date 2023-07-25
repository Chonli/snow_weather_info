  // TODO(APA): migrate
// import 'package:dart_rss/dart_rss.dart';

// extension AtomItemExtension on AtomItem {
//   String get shortTitle {
//     final safetitle = title;

//     return safetitle != null && safetitle.contains(',')
//         ? safetitle.replaceFirst(RegExp('.*, '), '')
//         : 'Avalanche';
//   }

//   String get date => title?.substring(13, 23) ?? '';

//   String get massif =>
//       title
//           ?.replaceFirst(RegExp('.* : '), '')
//           .replaceFirst(RegExp(', .*'), '') ??
//       '';

//   String get url => links.first.href ?? '';
// }
