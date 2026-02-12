// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'station.dart';

class AbstractStationMapper extends ClassMapperBase<AbstractStation> {
  AbstractStationMapper._();

  static AbstractStationMapper? _instance;
  static AbstractStationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AbstractStationMapper._());
      StationMapper.ensureInitialized();
      NivoseMapper.ensureInitialized();
      CoordinateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AbstractStation';

  static String _$name(AbstractStation v) => v.name;
  static const Field<AbstractStation, String> _f$name = Field('name', _$name);
  static Coordinate _$position(AbstractStation v) => v.position;
  static const Field<AbstractStation, Coordinate> _f$position = Field(
    'position',
    _$position,
  );
  static int _$altitude(AbstractStation v) => v.altitude;
  static const Field<AbstractStation, int> _f$altitude = Field(
    'altitude',
    _$altitude,
  );

  @override
  final MappableFields<AbstractStation> fields = const {
    #name: _f$name,
    #position: _f$position,
    #altitude: _f$altitude,
  };

  static AbstractStation _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('AbstractStation');
  }

  @override
  final Function instantiate = _instantiate;

  static AbstractStation fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AbstractStation>(map);
  }

  static AbstractStation fromJson(String json) {
    return ensureInitialized().decodeJson<AbstractStation>(json);
  }
}

mixin AbstractStationMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AbstractStationCopyWith<AbstractStation, AbstractStation, AbstractStation>
  get copyWith;
}

abstract class AbstractStationCopyWith<$R, $In extends AbstractStation, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  CoordinateCopyWith<$R, Coordinate, Coordinate> get position;
  $R call({String? name, Coordinate? position, int? altitude});
  AbstractStationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class StationMapper extends ClassMapperBase<Station> {
  StationMapper._();

  static StationMapper? _instance;
  static StationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StationMapper._());
      AbstractStationMapper.ensureInitialized();
      CoordinateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Station';

  static int _$id(Station v) => v.id;
  static const Field<Station, int> _f$id = Field('id', _$id);
  static String _$name(Station v) => v.name;
  static const Field<Station, String> _f$name = Field('name', _$name);
  static Coordinate _$position(Station v) => v.position;
  static const Field<Station, Coordinate> _f$position = Field(
    'position',
    _$position,
  );
  static int _$altitude(Station v) => v.altitude;
  static const Field<Station, int> _f$altitude = Field('altitude', _$altitude);

  @override
  final MappableFields<Station> fields = const {
    #id: _f$id,
    #name: _f$name,
    #position: _f$position,
    #altitude: _f$altitude,
  };

  static Station _instantiate(DecodingData data) {
    return Station(
      data.dec(_f$id),
      data.dec(_f$name),
      data.dec(_f$position),
      data.dec(_f$altitude),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Station fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Station>(map);
  }

  static Station fromJson(String json) {
    return ensureInitialized().decodeJson<Station>(json);
  }
}

mixin StationMappable {
  String toJson() {
    return StationMapper.ensureInitialized().encodeJson<Station>(
      this as Station,
    );
  }

  Map<String, dynamic> toMap() {
    return StationMapper.ensureInitialized().encodeMap<Station>(
      this as Station,
    );
  }

  StationCopyWith<Station, Station, Station> get copyWith =>
      _StationCopyWithImpl<Station, Station>(
        this as Station,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return StationMapper.ensureInitialized().stringifyValue(this as Station);
  }

  @override
  bool operator ==(Object other) {
    return StationMapper.ensureInitialized().equalsValue(
      this as Station,
      other,
    );
  }

  @override
  int get hashCode {
    return StationMapper.ensureInitialized().hashValue(this as Station);
  }
}

extension StationValueCopy<$R, $Out> on ObjectCopyWith<$R, Station, $Out> {
  StationCopyWith<$R, Station, $Out> get $asStation =>
      $base.as((v, t, t2) => _StationCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StationCopyWith<$R, $In extends Station, $Out>
    implements AbstractStationCopyWith<$R, $In, $Out> {
  @override
  CoordinateCopyWith<$R, Coordinate, Coordinate> get position;
  @override
  $R call({int? id, String? name, Coordinate? position, int? altitude});
  StationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Station, $Out>
    implements StationCopyWith<$R, Station, $Out> {
  _StationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Station> $mapper =
      StationMapper.ensureInitialized();
  @override
  CoordinateCopyWith<$R, Coordinate, Coordinate> get position =>
      $value.position.copyWith.$chain((v) => call(position: v));
  @override
  $R call({int? id, String? name, Coordinate? position, int? altitude}) =>
      $apply(
        FieldCopyWithData({
          if (id != null) #id: id,
          if (name != null) #name: name,
          if (position != null) #position: position,
          if (altitude != null) #altitude: altitude,
        }),
      );
  @override
  Station $make(CopyWithData data) => Station(
    data.get(#id, or: $value.id),
    data.get(#name, or: $value.name),
    data.get(#position, or: $value.position),
    data.get(#altitude, or: $value.altitude),
  );

  @override
  StationCopyWith<$R2, Station, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _StationCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class NivoseMapper extends ClassMapperBase<Nivose> {
  NivoseMapper._();

  static NivoseMapper? _instance;
  static NivoseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NivoseMapper._());
      AbstractStationMapper.ensureInitialized();
      CoordinateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Nivose';

  static String _$name(Nivose v) => v.name;
  static const Field<Nivose, String> _f$name = Field('name', _$name);
  static Coordinate _$position(Nivose v) => v.position;
  static const Field<Nivose, Coordinate> _f$position = Field(
    'position',
    _$position,
  );
  static int _$altitude(Nivose v) => v.altitude;
  static const Field<Nivose, int> _f$altitude = Field('altitude', _$altitude);
  static String _$codeMF(Nivose v) => v.codeMF;
  static const Field<Nivose, String> _f$codeMF = Field('codeMF', _$codeMF);

  @override
  final MappableFields<Nivose> fields = const {
    #name: _f$name,
    #position: _f$position,
    #altitude: _f$altitude,
    #codeMF: _f$codeMF,
  };

  static Nivose _instantiate(DecodingData data) {
    return Nivose(
      data.dec(_f$name),
      data.dec(_f$position),
      data.dec(_f$altitude),
      data.dec(_f$codeMF),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Nivose fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Nivose>(map);
  }

  static Nivose fromJson(String json) {
    return ensureInitialized().decodeJson<Nivose>(json);
  }
}

mixin NivoseMappable {
  String toJson() {
    return NivoseMapper.ensureInitialized().encodeJson<Nivose>(this as Nivose);
  }

  Map<String, dynamic> toMap() {
    return NivoseMapper.ensureInitialized().encodeMap<Nivose>(this as Nivose);
  }

  NivoseCopyWith<Nivose, Nivose, Nivose> get copyWith =>
      _NivoseCopyWithImpl<Nivose, Nivose>(this as Nivose, $identity, $identity);
  @override
  String toString() {
    return NivoseMapper.ensureInitialized().stringifyValue(this as Nivose);
  }

  @override
  bool operator ==(Object other) {
    return NivoseMapper.ensureInitialized().equalsValue(this as Nivose, other);
  }

  @override
  int get hashCode {
    return NivoseMapper.ensureInitialized().hashValue(this as Nivose);
  }
}

extension NivoseValueCopy<$R, $Out> on ObjectCopyWith<$R, Nivose, $Out> {
  NivoseCopyWith<$R, Nivose, $Out> get $asNivose =>
      $base.as((v, t, t2) => _NivoseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NivoseCopyWith<$R, $In extends Nivose, $Out>
    implements AbstractStationCopyWith<$R, $In, $Out> {
  @override
  CoordinateCopyWith<$R, Coordinate, Coordinate> get position;
  @override
  $R call({String? name, Coordinate? position, int? altitude, String? codeMF});
  NivoseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NivoseCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Nivose, $Out>
    implements NivoseCopyWith<$R, Nivose, $Out> {
  _NivoseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Nivose> $mapper = NivoseMapper.ensureInitialized();
  @override
  CoordinateCopyWith<$R, Coordinate, Coordinate> get position =>
      $value.position.copyWith.$chain((v) => call(position: v));
  @override
  $R call({
    String? name,
    Coordinate? position,
    int? altitude,
    String? codeMF,
  }) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (position != null) #position: position,
      if (altitude != null) #altitude: altitude,
      if (codeMF != null) #codeMF: codeMF,
    }),
  );
  @override
  Nivose $make(CopyWithData data) => Nivose(
    data.get(#name, or: $value.name),
    data.get(#position, or: $value.position),
    data.get(#altitude, or: $value.altitude),
    data.get(#codeMF, or: $value.codeMF),
  );

  @override
  NivoseCopyWith<$R2, Nivose, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _NivoseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

