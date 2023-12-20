// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'avalanche_bulletin.freezed.dart';

@freezed
abstract class AvalancheBulletin with _$AvalancheBulletin {
  const factory AvalancheBulletin({
    required String massifName,
    required String url,
    required Mountain mountain,
  }) = _AvalancheBulletin;
}

enum Mountain {
  all,
  alpesNord,
  alpesSud,
  corse,
  pyrenees,
}

extension MountainExtension on Mountain {
  String displayName() {
    return switch (this) {
      Mountain.alpesNord => 'Alpes du Nord',
      Mountain.alpesSud => 'Alpes du Sud',
      Mountain.corse => 'Corse',
      Mountain.pyrenees => 'Pyrenées',
      _ => 'Tous'
    };
  }
}
