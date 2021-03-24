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
        break;
      case Mountain.alpesSud:
        return 'Alpes du Sud';
        break;
      case Mountain.corse:
        return 'Corse';
        break;
      case Mountain.pyrennee:
        return 'Pyrennée';
        break;
      default:
        return 'Tous';
        break;
    }
  }
}
