// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'avalanche_bulletin.dart';

class AvalancheBulletinMapper extends ClassMapperBase<AvalancheBulletin> {
  AvalancheBulletinMapper._();

  static AvalancheBulletinMapper? _instance;
  static AvalancheBulletinMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AvalancheBulletinMapper._());
      MountainMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AvalancheBulletin';

  static String _$massifName(AvalancheBulletin v) => v.massifName;
  static const Field<AvalancheBulletin, String> _f$massifName = Field(
    'massifName',
    _$massifName,
  );
  static int _$beraNumber(AvalancheBulletin v) => v.beraNumber;
  static const Field<AvalancheBulletin, int> _f$beraNumber = Field(
    'beraNumber',
    _$beraNumber,
  );
  static Mountain _$mountain(AvalancheBulletin v) => v.mountain;
  static const Field<AvalancheBulletin, Mountain> _f$mountain = Field(
    'mountain',
    _$mountain,
  );

  @override
  final MappableFields<AvalancheBulletin> fields = const {
    #massifName: _f$massifName,
    #beraNumber: _f$beraNumber,
    #mountain: _f$mountain,
  };

  static AvalancheBulletin _instantiate(DecodingData data) {
    return AvalancheBulletin(
      massifName: data.dec(_f$massifName),
      beraNumber: data.dec(_f$beraNumber),
      mountain: data.dec(_f$mountain),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AvalancheBulletin fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AvalancheBulletin>(map);
  }

  static AvalancheBulletin fromJson(String json) {
    return ensureInitialized().decodeJson<AvalancheBulletin>(json);
  }
}

mixin AvalancheBulletinMappable {
  String toJson() {
    return AvalancheBulletinMapper.ensureInitialized()
        .encodeJson<AvalancheBulletin>(this as AvalancheBulletin);
  }

  Map<String, dynamic> toMap() {
    return AvalancheBulletinMapper.ensureInitialized()
        .encodeMap<AvalancheBulletin>(this as AvalancheBulletin);
  }

  AvalancheBulletinCopyWith<
    AvalancheBulletin,
    AvalancheBulletin,
    AvalancheBulletin
  >
  get copyWith =>
      _AvalancheBulletinCopyWithImpl<AvalancheBulletin, AvalancheBulletin>(
        this as AvalancheBulletin,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AvalancheBulletinMapper.ensureInitialized().stringifyValue(
      this as AvalancheBulletin,
    );
  }

  @override
  bool operator ==(Object other) {
    return AvalancheBulletinMapper.ensureInitialized().equalsValue(
      this as AvalancheBulletin,
      other,
    );
  }

  @override
  int get hashCode {
    return AvalancheBulletinMapper.ensureInitialized().hashValue(
      this as AvalancheBulletin,
    );
  }
}

extension AvalancheBulletinValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AvalancheBulletin, $Out> {
  AvalancheBulletinCopyWith<$R, AvalancheBulletin, $Out>
  get $asAvalancheBulletin => $base.as(
    (v, t, t2) => _AvalancheBulletinCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AvalancheBulletinCopyWith<
  $R,
  $In extends AvalancheBulletin,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? massifName, int? beraNumber, Mountain? mountain});
  AvalancheBulletinCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AvalancheBulletinCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AvalancheBulletin, $Out>
    implements AvalancheBulletinCopyWith<$R, AvalancheBulletin, $Out> {
  _AvalancheBulletinCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AvalancheBulletin> $mapper =
      AvalancheBulletinMapper.ensureInitialized();
  @override
  $R call({String? massifName, int? beraNumber, Mountain? mountain}) => $apply(
    FieldCopyWithData({
      if (massifName != null) #massifName: massifName,
      if (beraNumber != null) #beraNumber: beraNumber,
      if (mountain != null) #mountain: mountain,
    }),
  );
  @override
  AvalancheBulletin $make(CopyWithData data) => AvalancheBulletin(
    massifName: data.get(#massifName, or: $value.massifName),
    beraNumber: data.get(#beraNumber, or: $value.beraNumber),
    mountain: data.get(#mountain, or: $value.mountain),
  );

  @override
  AvalancheBulletinCopyWith<$R2, AvalancheBulletin, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AvalancheBulletinCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

