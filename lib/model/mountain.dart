enum Mountain {
  all,
  alpesNord,
  alpesSud,
  corse,
  pyrenees,
  massifCentral,
}

extension MountainExtension on Mountain {
  String displayName() {
    return switch (this) {
      Mountain.alpesNord => 'Alpes du Nord',
      Mountain.alpesSud => 'Alpes du Sud',
      Mountain.corse => 'Corse',
      Mountain.pyrenees => 'Pyrenées',
      Mountain.massifCentral => 'Massif Central',
      _ => 'Tous'
    };
  }
}
