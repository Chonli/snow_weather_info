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
