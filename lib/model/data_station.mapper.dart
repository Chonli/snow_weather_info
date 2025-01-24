// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'data_station.dart';

class DataStationMapper extends ClassMapperBase<DataStation> {
  DataStationMapper._();

  static DataStationMapper? _instance;
  static DataStationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DataStationMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DataStation';

  static DateTime _$date(DataStation v) => v.date;
  static const Field<DataStation, DateTime> _f$date = Field('date', _$date);
  static int _$id(DataStation v) => v.id;
  static const Field<DataStation, int> _f$id =
      Field('id', _$id, opt: true, def: 0);
  static double? _$temperature(DataStation v) => v.temperature;
  static const Field<DataStation, double> _f$temperature =
      Field('temperature', _$temperature, opt: true);
  static double? _$temperatureMin24(DataStation v) => v.temperatureMin24;
  static const Field<DataStation, double> _f$temperatureMin24 =
      Field('temperatureMin24', _$temperatureMin24, opt: true);
  static double? _$temperatureMax24(DataStation v) => v.temperatureMax24;
  static const Field<DataStation, double> _f$temperatureMax24 =
      Field('temperatureMax24', _$temperatureMax24, opt: true);
  static double? _$temperatureSnow(DataStation v) => v.temperatureSnow;
  static const Field<DataStation, double> _f$temperatureSnow =
      Field('temperatureSnow', _$temperatureSnow, opt: true);
  static double? _$speedWind(DataStation v) => v.speedWind;
  static const Field<DataStation, double> _f$speedWind =
      Field('speedWind', _$speedWind, opt: true);
  static double? _$directionWind(DataStation v) => v.directionWind;
  static const Field<DataStation, double> _f$directionWind =
      Field('directionWind', _$directionWind, opt: true);
  static double? _$snowHeight(DataStation v) => v.snowHeight;
  static const Field<DataStation, double> _f$snowHeight =
      Field('snowHeight', _$snowHeight, opt: true);
  static double? _$snowNewHeight(DataStation v) => v.snowNewHeight;
  static const Field<DataStation, double> _f$snowNewHeight =
      Field('snowNewHeight', _$snowNewHeight, opt: true);

  @override
  final MappableFields<DataStation> fields = const {
    #date: _f$date,
    #id: _f$id,
    #temperature: _f$temperature,
    #temperatureMin24: _f$temperatureMin24,
    #temperatureMax24: _f$temperatureMax24,
    #temperatureSnow: _f$temperatureSnow,
    #speedWind: _f$speedWind,
    #directionWind: _f$directionWind,
    #snowHeight: _f$snowHeight,
    #snowNewHeight: _f$snowNewHeight,
  };

  static DataStation _instantiate(DecodingData data) {
    return DataStation(
        date: data.dec(_f$date),
        id: data.dec(_f$id),
        temperature: data.dec(_f$temperature),
        temperatureMin24: data.dec(_f$temperatureMin24),
        temperatureMax24: data.dec(_f$temperatureMax24),
        temperatureSnow: data.dec(_f$temperatureSnow),
        speedWind: data.dec(_f$speedWind),
        directionWind: data.dec(_f$directionWind),
        snowHeight: data.dec(_f$snowHeight),
        snowNewHeight: data.dec(_f$snowNewHeight));
  }

  @override
  final Function instantiate = _instantiate;

  static DataStation fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DataStation>(map);
  }

  static DataStation fromJson(String json) {
    return ensureInitialized().decodeJson<DataStation>(json);
  }
}

mixin DataStationMappable {
  String toJson() {
    return DataStationMapper.ensureInitialized()
        .encodeJson<DataStation>(this as DataStation);
  }

  Map<String, dynamic> toMap() {
    return DataStationMapper.ensureInitialized()
        .encodeMap<DataStation>(this as DataStation);
  }

  DataStationCopyWith<DataStation, DataStation, DataStation> get copyWith =>
      _DataStationCopyWithImpl(this as DataStation, $identity, $identity);
  @override
  String toString() {
    return DataStationMapper.ensureInitialized()
        .stringifyValue(this as DataStation);
  }

  @override
  bool operator ==(Object other) {
    return DataStationMapper.ensureInitialized()
        .equalsValue(this as DataStation, other);
  }

  @override
  int get hashCode {
    return DataStationMapper.ensureInitialized().hashValue(this as DataStation);
  }
}

extension DataStationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DataStation, $Out> {
  DataStationCopyWith<$R, DataStation, $Out> get $asDataStation =>
      $base.as((v, t, t2) => _DataStationCopyWithImpl(v, t, t2));
}

abstract class DataStationCopyWith<$R, $In extends DataStation, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {DateTime? date,
      int? id,
      double? temperature,
      double? temperatureMin24,
      double? temperatureMax24,
      double? temperatureSnow,
      double? speedWind,
      double? directionWind,
      double? snowHeight,
      double? snowNewHeight});
  DataStationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DataStationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DataStation, $Out>
    implements DataStationCopyWith<$R, DataStation, $Out> {
  _DataStationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DataStation> $mapper =
      DataStationMapper.ensureInitialized();
  @override
  $R call(
          {DateTime? date,
          int? id,
          Object? temperature = $none,
          Object? temperatureMin24 = $none,
          Object? temperatureMax24 = $none,
          Object? temperatureSnow = $none,
          Object? speedWind = $none,
          Object? directionWind = $none,
          Object? snowHeight = $none,
          Object? snowNewHeight = $none}) =>
      $apply(FieldCopyWithData({
        if (date != null) #date: date,
        if (id != null) #id: id,
        if (temperature != $none) #temperature: temperature,
        if (temperatureMin24 != $none) #temperatureMin24: temperatureMin24,
        if (temperatureMax24 != $none) #temperatureMax24: temperatureMax24,
        if (temperatureSnow != $none) #temperatureSnow: temperatureSnow,
        if (speedWind != $none) #speedWind: speedWind,
        if (directionWind != $none) #directionWind: directionWind,
        if (snowHeight != $none) #snowHeight: snowHeight,
        if (snowNewHeight != $none) #snowNewHeight: snowNewHeight
      }));
  @override
  DataStation $make(CopyWithData data) => DataStation(
      date: data.get(#date, or: $value.date),
      id: data.get(#id, or: $value.id),
      temperature: data.get(#temperature, or: $value.temperature),
      temperatureMin24:
          data.get(#temperatureMin24, or: $value.temperatureMin24),
      temperatureMax24:
          data.get(#temperatureMax24, or: $value.temperatureMax24),
      temperatureSnow: data.get(#temperatureSnow, or: $value.temperatureSnow),
      speedWind: data.get(#speedWind, or: $value.speedWind),
      directionWind: data.get(#directionWind, or: $value.directionWind),
      snowHeight: data.get(#snowHeight, or: $value.snowHeight),
      snowNewHeight: data.get(#snowNewHeight, or: $value.snowNewHeight));

  @override
  DataStationCopyWith<$R2, DataStation, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DataStationCopyWithImpl($value, $cast, t);
}
