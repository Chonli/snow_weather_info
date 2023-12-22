enum Mountain {
  all,
  alpesNord,
  alpesSud,
  corse,
  jura,
  massifCentral,
  pyrenees,
}

extension MountainExtension on Mountain {
  String displayName() {
    return switch (this) {
      Mountain.alpesNord => 'Alpes du Nord',
      Mountain.alpesSud => 'Alpes du Sud',
      Mountain.corse => 'Corse',
      Mountain.jura => 'Jura',
      Mountain.massifCentral => 'Massif Central',
      Mountain.pyrenees => 'Pyrenées',
      _ => 'Tous'
    };
  }
}
