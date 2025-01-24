// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'mountain.dart';

class MountainMapper extends EnumMapper<Mountain> {
  MountainMapper._();

  static MountainMapper? _instance;
  static MountainMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MountainMapper._());
    }
    return _instance!;
  }

  static Mountain fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Mountain decode(dynamic value) {
    switch (value) {
      case 'all':
        return Mountain.all;
      case 'alpesNord':
        return Mountain.alpesNord;
      case 'alpesSud':
        return Mountain.alpesSud;
      case 'corse':
        return Mountain.corse;
      case 'jura':
        return Mountain.jura;
      case 'massifCentral':
        return Mountain.massifCentral;
      case 'pyrenees':
        return Mountain.pyrenees;
      case 'vosges':
        return Mountain.vosges;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Mountain self) {
    switch (self) {
      case Mountain.all:
        return 'all';
      case Mountain.alpesNord:
        return 'alpesNord';
      case Mountain.alpesSud:
        return 'alpesSud';
      case Mountain.corse:
        return 'corse';
      case Mountain.jura:
        return 'jura';
      case Mountain.massifCentral:
        return 'massifCentral';
      case Mountain.pyrenees:
        return 'pyrenees';
      case Mountain.vosges:
        return 'vosges';
    }
  }
}

extension MountainMapperExtension on Mountain {
  String toValue() {
    MountainMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Mountain>(this) as String;
  }
}
