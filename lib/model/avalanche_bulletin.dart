class AvalancheBulletin {
  String massifName;
  String url;
  Mountain mountain;

  AvalancheBulletin(this.massifName, this.url, this.mountain);
}

enum Mountain { all, alpes_nord, alpes_sud, corse, pyrennee }
