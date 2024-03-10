// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'avalanche_bulletin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AvalancheBulletin {
  String get massifName => throw _privateConstructorUsedError;
  int get beraNumber => throw _privateConstructorUsedError;
  Mountain get mountain => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AvalancheBulletinCopyWith<AvalancheBulletin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvalancheBulletinCopyWith<$Res> {
  factory $AvalancheBulletinCopyWith(
          AvalancheBulletin value, $Res Function(AvalancheBulletin) then) =
      _$AvalancheBulletinCopyWithImpl<$Res, AvalancheBulletin>;
  @useResult
  $Res call({String massifName, int beraNumber, Mountain mountain});
}

/// @nodoc
class _$AvalancheBulletinCopyWithImpl<$Res, $Val extends AvalancheBulletin>
    implements $AvalancheBulletinCopyWith<$Res> {
  _$AvalancheBulletinCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? massifName = null,
    Object? beraNumber = null,
    Object? mountain = null,
  }) {
    return _then(_value.copyWith(
      massifName: null == massifName
          ? _value.massifName
          : massifName // ignore: cast_nullable_to_non_nullable
              as String,
      beraNumber: null == beraNumber
          ? _value.beraNumber
          : beraNumber // ignore: cast_nullable_to_non_nullable
              as int,
      mountain: null == mountain
          ? _value.mountain
          : mountain // ignore: cast_nullable_to_non_nullable
              as Mountain,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvalancheBulletinImplCopyWith<$Res>
    implements $AvalancheBulletinCopyWith<$Res> {
  factory _$$AvalancheBulletinImplCopyWith(_$AvalancheBulletinImpl value,
          $Res Function(_$AvalancheBulletinImpl) then) =
      __$$AvalancheBulletinImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String massifName, int beraNumber, Mountain mountain});
}

/// @nodoc
class __$$AvalancheBulletinImplCopyWithImpl<$Res>
    extends _$AvalancheBulletinCopyWithImpl<$Res, _$AvalancheBulletinImpl>
    implements _$$AvalancheBulletinImplCopyWith<$Res> {
  __$$AvalancheBulletinImplCopyWithImpl(_$AvalancheBulletinImpl _value,
      $Res Function(_$AvalancheBulletinImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? massifName = null,
    Object? beraNumber = null,
    Object? mountain = null,
  }) {
    return _then(_$AvalancheBulletinImpl(
      massifName: null == massifName
          ? _value.massifName
          : massifName // ignore: cast_nullable_to_non_nullable
              as String,
      beraNumber: null == beraNumber
          ? _value.beraNumber
          : beraNumber // ignore: cast_nullable_to_non_nullable
              as int,
      mountain: null == mountain
          ? _value.mountain
          : mountain // ignore: cast_nullable_to_non_nullable
              as Mountain,
    ));
  }
}

/// @nodoc

class _$AvalancheBulletinImpl implements _AvalancheBulletin {
  const _$AvalancheBulletinImpl(
      {required this.massifName,
      required this.beraNumber,
      required this.mountain});

  @override
  final String massifName;
  @override
  final int beraNumber;
  @override
  final Mountain mountain;

  @override
  String toString() {
    return 'AvalancheBulletin(massifName: $massifName, beraNumber: $beraNumber, mountain: $mountain)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvalancheBulletinImpl &&
            (identical(other.massifName, massifName) ||
                other.massifName == massifName) &&
            (identical(other.beraNumber, beraNumber) ||
                other.beraNumber == beraNumber) &&
            (identical(other.mountain, mountain) ||
                other.mountain == mountain));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, massifName, beraNumber, mountain);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AvalancheBulletinImplCopyWith<_$AvalancheBulletinImpl> get copyWith =>
      __$$AvalancheBulletinImplCopyWithImpl<_$AvalancheBulletinImpl>(
          this, _$identity);
}

abstract class _AvalancheBulletin implements AvalancheBulletin {
  const factory _AvalancheBulletin(
      {required final String massifName,
      required final int beraNumber,
      required final Mountain mountain}) = _$AvalancheBulletinImpl;

  @override
  String get massifName;
  @override
  int get beraNumber;
  @override
  Mountain get mountain;
  @override
  @JsonKey(ignore: true)
  _$$AvalancheBulletinImplCopyWith<_$AvalancheBulletinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
