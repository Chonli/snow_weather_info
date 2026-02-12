// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'avalanche_bulletin.dart';

class AbstractBulletinMapper extends ClassMapperBase<AbstractBulletin> {
  AbstractBulletinMapper._();

  static AbstractBulletinMapper? _instance;
  static AbstractBulletinMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AbstractBulletinMapper._());
      AvalancheBulletinFrMapper.ensureInitialized();
      AvalancheBulletinPdfMapper.ensureInitialized();
      MountainMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AbstractBulletin';

  static String _$massifName(AbstractBulletin v) => v.massifName;
  static const Field<AbstractBulletin, String> _f$massifName = Field(
    'massifName',
    _$massifName,
  );
  static Mountain _$mountain(AbstractBulletin v) => v.mountain;
  static const Field<AbstractBulletin, Mountain> _f$mountain = Field(
    'mountain',
    _$mountain,
  );

  @override
  final MappableFields<AbstractBulletin> fields = const {
    #massifName: _f$massifName,
    #mountain: _f$mountain,
  };

  static AbstractBulletin _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('AbstractBulletin');
  }

  @override
  final Function instantiate = _instantiate;

  static AbstractBulletin fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AbstractBulletin>(map);
  }

  static AbstractBulletin fromJson(String json) {
    return ensureInitialized().decodeJson<AbstractBulletin>(json);
  }
}

mixin AbstractBulletinMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AbstractBulletinCopyWith<AbstractBulletin, AbstractBulletin, AbstractBulletin>
  get copyWith;
}

abstract class AbstractBulletinCopyWith<$R, $In extends AbstractBulletin, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? massifName, Mountain? mountain});
  AbstractBulletinCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class AvalancheBulletinFrMapper extends ClassMapperBase<AvalancheBulletinFr> {
  AvalancheBulletinFrMapper._();

  static AvalancheBulletinFrMapper? _instance;
  static AvalancheBulletinFrMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AvalancheBulletinFrMapper._());
      AbstractBulletinMapper.ensureInitialized();
      MountainMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AvalancheBulletinFr';

  static String _$massifName(AvalancheBulletinFr v) => v.massifName;
  static const Field<AvalancheBulletinFr, String> _f$massifName = Field(
    'massifName',
    _$massifName,
  );
  static int _$beraNumber(AvalancheBulletinFr v) => v.beraNumber;
  static const Field<AvalancheBulletinFr, int> _f$beraNumber = Field(
    'beraNumber',
    _$beraNumber,
  );
  static Mountain _$mountain(AvalancheBulletinFr v) => v.mountain;
  static const Field<AvalancheBulletinFr, Mountain> _f$mountain = Field(
    'mountain',
    _$mountain,
  );

  @override
  final MappableFields<AvalancheBulletinFr> fields = const {
    #massifName: _f$massifName,
    #beraNumber: _f$beraNumber,
    #mountain: _f$mountain,
  };

  static AvalancheBulletinFr _instantiate(DecodingData data) {
    return AvalancheBulletinFr(
      massifName: data.dec(_f$massifName),
      beraNumber: data.dec(_f$beraNumber),
      mountain: data.dec(_f$mountain),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AvalancheBulletinFr fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AvalancheBulletinFr>(map);
  }

  static AvalancheBulletinFr fromJson(String json) {
    return ensureInitialized().decodeJson<AvalancheBulletinFr>(json);
  }
}

mixin AvalancheBulletinFrMappable {
  String toJson() {
    return AvalancheBulletinFrMapper.ensureInitialized()
        .encodeJson<AvalancheBulletinFr>(this as AvalancheBulletinFr);
  }

  Map<String, dynamic> toMap() {
    return AvalancheBulletinFrMapper.ensureInitialized()
        .encodeMap<AvalancheBulletinFr>(this as AvalancheBulletinFr);
  }

  AvalancheBulletinFrCopyWith<
    AvalancheBulletinFr,
    AvalancheBulletinFr,
    AvalancheBulletinFr
  >
  get copyWith =>
      _AvalancheBulletinFrCopyWithImpl<
        AvalancheBulletinFr,
        AvalancheBulletinFr
      >(this as AvalancheBulletinFr, $identity, $identity);
  @override
  String toString() {
    return AvalancheBulletinFrMapper.ensureInitialized().stringifyValue(
      this as AvalancheBulletinFr,
    );
  }

  @override
  bool operator ==(Object other) {
    return AvalancheBulletinFrMapper.ensureInitialized().equalsValue(
      this as AvalancheBulletinFr,
      other,
    );
  }

  @override
  int get hashCode {
    return AvalancheBulletinFrMapper.ensureInitialized().hashValue(
      this as AvalancheBulletinFr,
    );
  }
}

extension AvalancheBulletinFrValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AvalancheBulletinFr, $Out> {
  AvalancheBulletinFrCopyWith<$R, AvalancheBulletinFr, $Out>
  get $asAvalancheBulletinFr => $base.as(
    (v, t, t2) => _AvalancheBulletinFrCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AvalancheBulletinFrCopyWith<
  $R,
  $In extends AvalancheBulletinFr,
  $Out
>
    implements AbstractBulletinCopyWith<$R, $In, $Out> {
  @override
  $R call({String? massifName, int? beraNumber, Mountain? mountain});
  AvalancheBulletinFrCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AvalancheBulletinFrCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AvalancheBulletinFr, $Out>
    implements AvalancheBulletinFrCopyWith<$R, AvalancheBulletinFr, $Out> {
  _AvalancheBulletinFrCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AvalancheBulletinFr> $mapper =
      AvalancheBulletinFrMapper.ensureInitialized();
  @override
  $R call({String? massifName, int? beraNumber, Mountain? mountain}) => $apply(
    FieldCopyWithData({
      if (massifName != null) #massifName: massifName,
      if (beraNumber != null) #beraNumber: beraNumber,
      if (mountain != null) #mountain: mountain,
    }),
  );
  @override
  AvalancheBulletinFr $make(CopyWithData data) => AvalancheBulletinFr(
    massifName: data.get(#massifName, or: $value.massifName),
    beraNumber: data.get(#beraNumber, or: $value.beraNumber),
    mountain: data.get(#mountain, or: $value.mountain),
  );

  @override
  AvalancheBulletinFrCopyWith<$R2, AvalancheBulletinFr, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AvalancheBulletinFrCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AvalancheBulletinPdfMapper extends ClassMapperBase<AvalancheBulletinPdf> {
  AvalancheBulletinPdfMapper._();

  static AvalancheBulletinPdfMapper? _instance;
  static AvalancheBulletinPdfMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AvalancheBulletinPdfMapper._());
      AbstractBulletinMapper.ensureInitialized();
      MountainMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AvalancheBulletinPdf';

  static String _$massifName(AvalancheBulletinPdf v) => v.massifName;
  static const Field<AvalancheBulletinPdf, String> _f$massifName = Field(
    'massifName',
    _$massifName,
  );
  static String _$pdfPath(AvalancheBulletinPdf v) => v.pdfPath;
  static const Field<AvalancheBulletinPdf, String> _f$pdfPath = Field(
    'pdfPath',
    _$pdfPath,
  );
  static Mountain _$mountain(AvalancheBulletinPdf v) => v.mountain;
  static const Field<AvalancheBulletinPdf, Mountain> _f$mountain = Field(
    'mountain',
    _$mountain,
  );

  @override
  final MappableFields<AvalancheBulletinPdf> fields = const {
    #massifName: _f$massifName,
    #pdfPath: _f$pdfPath,
    #mountain: _f$mountain,
  };

  static AvalancheBulletinPdf _instantiate(DecodingData data) {
    return AvalancheBulletinPdf(
      massifName: data.dec(_f$massifName),
      pdfPath: data.dec(_f$pdfPath),
      mountain: data.dec(_f$mountain),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AvalancheBulletinPdf fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AvalancheBulletinPdf>(map);
  }

  static AvalancheBulletinPdf fromJson(String json) {
    return ensureInitialized().decodeJson<AvalancheBulletinPdf>(json);
  }
}

mixin AvalancheBulletinPdfMappable {
  String toJson() {
    return AvalancheBulletinPdfMapper.ensureInitialized()
        .encodeJson<AvalancheBulletinPdf>(this as AvalancheBulletinPdf);
  }

  Map<String, dynamic> toMap() {
    return AvalancheBulletinPdfMapper.ensureInitialized()
        .encodeMap<AvalancheBulletinPdf>(this as AvalancheBulletinPdf);
  }

  AvalancheBulletinPdfCopyWith<
    AvalancheBulletinPdf,
    AvalancheBulletinPdf,
    AvalancheBulletinPdf
  >
  get copyWith =>
      _AvalancheBulletinPdfCopyWithImpl<
        AvalancheBulletinPdf,
        AvalancheBulletinPdf
      >(this as AvalancheBulletinPdf, $identity, $identity);
  @override
  String toString() {
    return AvalancheBulletinPdfMapper.ensureInitialized().stringifyValue(
      this as AvalancheBulletinPdf,
    );
  }

  @override
  bool operator ==(Object other) {
    return AvalancheBulletinPdfMapper.ensureInitialized().equalsValue(
      this as AvalancheBulletinPdf,
      other,
    );
  }

  @override
  int get hashCode {
    return AvalancheBulletinPdfMapper.ensureInitialized().hashValue(
      this as AvalancheBulletinPdf,
    );
  }
}

extension AvalancheBulletinPdfValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AvalancheBulletinPdf, $Out> {
  AvalancheBulletinPdfCopyWith<$R, AvalancheBulletinPdf, $Out>
  get $asAvalancheBulletinPdf => $base.as(
    (v, t, t2) => _AvalancheBulletinPdfCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AvalancheBulletinPdfCopyWith<
  $R,
  $In extends AvalancheBulletinPdf,
  $Out
>
    implements AbstractBulletinCopyWith<$R, $In, $Out> {
  @override
  $R call({String? massifName, String? pdfPath, Mountain? mountain});
  AvalancheBulletinPdfCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AvalancheBulletinPdfCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AvalancheBulletinPdf, $Out>
    implements AvalancheBulletinPdfCopyWith<$R, AvalancheBulletinPdf, $Out> {
  _AvalancheBulletinPdfCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AvalancheBulletinPdf> $mapper =
      AvalancheBulletinPdfMapper.ensureInitialized();
  @override
  $R call({String? massifName, String? pdfPath, Mountain? mountain}) => $apply(
    FieldCopyWithData({
      if (massifName != null) #massifName: massifName,
      if (pdfPath != null) #pdfPath: pdfPath,
      if (mountain != null) #mountain: mountain,
    }),
  );
  @override
  AvalancheBulletinPdf $make(CopyWithData data) => AvalancheBulletinPdf(
    massifName: data.get(#massifName, or: $value.massifName),
    pdfPath: data.get(#pdfPath, or: $value.pdfPath),
    mountain: data.get(#mountain, or: $value.mountain),
  );

  @override
  AvalancheBulletinPdfCopyWith<$R2, AvalancheBulletinPdf, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AvalancheBulletinPdfCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

