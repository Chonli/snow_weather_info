// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
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
      case r'all':
        return Mountain.all;
      case r'alpesNord':
        return Mountain.alpesNord;
      case r'alpesSud':
        return Mountain.alpesSud;
      case r'corse':
        return Mountain.corse;
      case r'jura':
        return Mountain.jura;
      case r'massifCentral':
        return Mountain.massifCentral;
      case r'pyrenees':
        return Mountain.pyrenees;
      case r'vosges':
        return Mountain.vosges;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Mountain self) {
    switch (self) {
      case Mountain.all:
        return r'all';
      case Mountain.alpesNord:
        return r'alpesNord';
      case Mountain.alpesSud:
        return r'alpesSud';
      case Mountain.corse:
        return r'corse';
      case Mountain.jura:
        return r'jura';
      case Mountain.massifCentral:
        return r'massifCentral';
      case Mountain.pyrenees:
        return r'pyrenees';
      case Mountain.vosges:
        return r'vosges';
    }
  }
}

extension MountainMapperExtension on Mountain {
  String toValue() {
    MountainMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Mountain>(this) as String;
  }
}

