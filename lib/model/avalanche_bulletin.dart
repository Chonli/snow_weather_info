class AvalancheBulletin {
  const AvalancheBulletin(this.massifName, this.url, this.mountain);

  final String massifName;
  final String url;
  final Mountain mountain;
}

enum Mountain {
  all,
  alpesNord,
  alpesSud,
  corse,
  pyrennee,
}

extension MountainExtension on Mountain {
  String displayName() {
    switch (this) {
      case Mountain.alpesNord:
        return 'Alpes du Nord';

      case Mountain.alpesSud:
        return 'Alpes du Sud';

      case Mountain.corse:
        return 'Corse';

      case Mountain.pyrennee:
        return 'Pyrennée';

      default:
        return 'Tous';
    }
  }
}
