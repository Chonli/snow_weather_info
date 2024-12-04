import 'package:dart_mappable/dart_mappable.dart';

part 'mountain.mapper.dart';

@MappableEnum()
enum Mountain {
  all,
  alpesNord,
  alpesSud,
  corse,
  jura,
  massifCentral,
  pyrenees,
  vosges,
}

extension MountainExtension on Mountain {
  String get displayName {
    return switch (this) {
      Mountain.alpesNord => 'Alpes du Nord',
      Mountain.alpesSud => 'Alpes du Sud',
      Mountain.corse => 'Corse',
      Mountain.jura => 'Jura',
      Mountain.massifCentral => 'Massif Central',
      Mountain.pyrenees => 'Pyrenées',
      Mountain.vosges => 'Vosges',
      _ => 'Tous'
    };
  }
}
