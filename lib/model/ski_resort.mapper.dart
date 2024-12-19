// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'ski_resort.dart';

class SkiResortMapper extends ClassMapperBase<SkiResort> {
  SkiResortMapper._();

  static SkiResortMapper? _instance;
  static SkiResortMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SkiResortMapper._());
      MountainMapper.ensureInitialized();
      CoordinateMapper.ensureInitialized();
      WebCamMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SkiResort';

  static int _$id(SkiResort v) => v.id;
  static const Field<SkiResort, int> _f$id = Field('id', _$id);
  static String _$name(SkiResort v) => v.name;
  static const Field<SkiResort, String> _f$name = Field('name', _$name);
  static Mountain _$mountain(SkiResort v) => v.mountain;
  static const Field<SkiResort, Mountain> _f$mountain =
      Field('mountain', _$mountain);
  static Coordinate? _$position(SkiResort v) => v.position;
  static const Field<SkiResort, Coordinate> _f$position =
      Field('position', _$position, opt: true);
  static String? _$description(SkiResort v) => v.description;
  static const Field<SkiResort, String> _f$description =
      Field('description', _$description, opt: true);
  static List<WebCam> _$webcams(SkiResort v) => v.webcams;
  static const Field<SkiResort, List<WebCam>> _f$webcams =
      Field('webcams', _$webcams, opt: true, def: const []);

  @override
  final MappableFields<SkiResort> fields = const {
    #id: _f$id,
    #name: _f$name,
    #mountain: _f$mountain,
    #position: _f$position,
    #description: _f$description,
    #webcams: _f$webcams,
  };

  static SkiResort _instantiate(DecodingData data) {
    return SkiResort(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        mountain: data.dec(_f$mountain),
        position: data.dec(_f$position),
        description: data.dec(_f$description),
        webcams: data.dec(_f$webcams));
  }

  @override
  final Function instantiate = _instantiate;

  static SkiResort fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SkiResort>(map);
  }

  static SkiResort fromJson(String json) {
    return ensureInitialized().decodeJson<SkiResort>(json);
  }
}

mixin SkiResortMappable {
  String toJson() {
    return SkiResortMapper.ensureInitialized()
        .encodeJson<SkiResort>(this as SkiResort);
  }

  Map<String, dynamic> toMap() {
    return SkiResortMapper.ensureInitialized()
        .encodeMap<SkiResort>(this as SkiResort);
  }

  SkiResortCopyWith<SkiResort, SkiResort, SkiResort> get copyWith =>
      _SkiResortCopyWithImpl(this as SkiResort, $identity, $identity);
  @override
  String toString() {
    return SkiResortMapper.ensureInitialized()
        .stringifyValue(this as SkiResort);
  }

  @override
  bool operator ==(Object other) {
    return SkiResortMapper.ensureInitialized()
        .equalsValue(this as SkiResort, other);
  }

  @override
  int get hashCode {
    return SkiResortMapper.ensureInitialized().hashValue(this as SkiResort);
  }
}

extension SkiResortValueCopy<$R, $Out> on ObjectCopyWith<$R, SkiResort, $Out> {
  SkiResortCopyWith<$R, SkiResort, $Out> get $asSkiResort =>
      $base.as((v, t, t2) => _SkiResortCopyWithImpl(v, t, t2));
}

abstract class SkiResortCopyWith<$R, $In extends SkiResort, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  CoordinateCopyWith<$R, Coordinate, Coordinate>? get position;
  ListCopyWith<$R, WebCam, WebCamCopyWith<$R, WebCam, WebCam>> get webcams;
  $R call(
      {int? id,
      String? name,
      Mountain? mountain,
      Coordinate? position,
      String? description,
      List<WebCam>? webcams});
  SkiResortCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SkiResortCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SkiResort, $Out>
    implements SkiResortCopyWith<$R, SkiResort, $Out> {
  _SkiResortCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SkiResort> $mapper =
      SkiResortMapper.ensureInitialized();
  @override
  CoordinateCopyWith<$R, Coordinate, Coordinate>? get position =>
      $value.position?.copyWith.$chain((v) => call(position: v));
  @override
  ListCopyWith<$R, WebCam, WebCamCopyWith<$R, WebCam, WebCam>> get webcams =>
      ListCopyWith($value.webcams, (v, t) => v.copyWith.$chain(t),
          (v) => call(webcams: v));
  @override
  $R call(
          {int? id,
          String? name,
          Mountain? mountain,
          Object? position = $none,
          Object? description = $none,
          List<WebCam>? webcams}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (mountain != null) #mountain: mountain,
        if (position != $none) #position: position,
        if (description != $none) #description: description,
        if (webcams != null) #webcams: webcams
      }));
  @override
  SkiResort $make(CopyWithData data) => SkiResort(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      mountain: data.get(#mountain, or: $value.mountain),
      position: data.get(#position, or: $value.position),
      description: data.get(#description, or: $value.description),
      webcams: data.get(#webcams, or: $value.webcams));

  @override
  SkiResortCopyWith<$R2, SkiResort, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SkiResortCopyWithImpl($value, $cast, t);
}
