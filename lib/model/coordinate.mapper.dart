// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'coordinate.dart';

class CoordinateMapper extends ClassMapperBase<Coordinate> {
  CoordinateMapper._();

  static CoordinateMapper? _instance;
  static CoordinateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CoordinateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Coordinate';

  static double _$latitude(Coordinate v) => v.latitude;
  static const Field<Coordinate, double> _f$latitude = Field(
    'latitude',
    _$latitude,
  );
  static double _$longitude(Coordinate v) => v.longitude;
  static const Field<Coordinate, double> _f$longitude = Field(
    'longitude',
    _$longitude,
  );

  @override
  final MappableFields<Coordinate> fields = const {
    #latitude: _f$latitude,
    #longitude: _f$longitude,
  };

  static Coordinate _instantiate(DecodingData data) {
    return Coordinate(
      latitude: data.dec(_f$latitude),
      longitude: data.dec(_f$longitude),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Coordinate fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Coordinate>(map);
  }

  static Coordinate fromJson(String json) {
    return ensureInitialized().decodeJson<Coordinate>(json);
  }
}

mixin CoordinateMappable {
  String toJson() {
    return CoordinateMapper.ensureInitialized().encodeJson<Coordinate>(
      this as Coordinate,
    );
  }

  Map<String, dynamic> toMap() {
    return CoordinateMapper.ensureInitialized().encodeMap<Coordinate>(
      this as Coordinate,
    );
  }

  CoordinateCopyWith<Coordinate, Coordinate, Coordinate> get copyWith =>
      _CoordinateCopyWithImpl<Coordinate, Coordinate>(
        this as Coordinate,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CoordinateMapper.ensureInitialized().stringifyValue(
      this as Coordinate,
    );
  }

  @override
  bool operator ==(Object other) {
    return CoordinateMapper.ensureInitialized().equalsValue(
      this as Coordinate,
      other,
    );
  }

  @override
  int get hashCode {
    return CoordinateMapper.ensureInitialized().hashValue(this as Coordinate);
  }
}

extension CoordinateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Coordinate, $Out> {
  CoordinateCopyWith<$R, Coordinate, $Out> get $asCoordinate =>
      $base.as((v, t, t2) => _CoordinateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CoordinateCopyWith<$R, $In extends Coordinate, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({double? latitude, double? longitude});
  CoordinateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CoordinateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Coordinate, $Out>
    implements CoordinateCopyWith<$R, Coordinate, $Out> {
  _CoordinateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Coordinate> $mapper =
      CoordinateMapper.ensureInitialized();
  @override
  $R call({double? latitude, double? longitude}) => $apply(
    FieldCopyWithData({
      if (latitude != null) #latitude: latitude,
      if (longitude != null) #longitude: longitude,
    }),
  );
  @override
  Coordinate $make(CopyWithData data) => Coordinate(
    latitude: data.get(#latitude, or: $value.latitude),
    longitude: data.get(#longitude, or: $value.longitude),
  );

  @override
  CoordinateCopyWith<$R2, Coordinate, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CoordinateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

