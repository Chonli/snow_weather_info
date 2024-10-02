// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ski_resort.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SkiResort {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Mountain get mountain => throw _privateConstructorUsedError;
  LatLng? get position => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<WebCam> get webcams => throw _privateConstructorUsedError;

  /// Create a copy of SkiResort
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkiResortCopyWith<SkiResort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkiResortCopyWith<$Res> {
  factory $SkiResortCopyWith(SkiResort value, $Res Function(SkiResort) then) =
      _$SkiResortCopyWithImpl<$Res, SkiResort>;
  @useResult
  $Res call(
      {int id,
      String name,
      Mountain mountain,
      LatLng? position,
      String? description,
      List<WebCam> webcams});
}

/// @nodoc
class _$SkiResortCopyWithImpl<$Res, $Val extends SkiResort>
    implements $SkiResortCopyWith<$Res> {
  _$SkiResortCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkiResort
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? mountain = null,
    Object? position = freezed,
    Object? description = freezed,
    Object? webcams = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mountain: null == mountain
          ? _value.mountain
          : mountain // ignore: cast_nullable_to_non_nullable
              as Mountain,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      webcams: null == webcams
          ? _value.webcams
          : webcams // ignore: cast_nullable_to_non_nullable
              as List<WebCam>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SkiResortImplCopyWith<$Res>
    implements $SkiResortCopyWith<$Res> {
  factory _$$SkiResortImplCopyWith(
          _$SkiResortImpl value, $Res Function(_$SkiResortImpl) then) =
      __$$SkiResortImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      Mountain mountain,
      LatLng? position,
      String? description,
      List<WebCam> webcams});
}

/// @nodoc
class __$$SkiResortImplCopyWithImpl<$Res>
    extends _$SkiResortCopyWithImpl<$Res, _$SkiResortImpl>
    implements _$$SkiResortImplCopyWith<$Res> {
  __$$SkiResortImplCopyWithImpl(
      _$SkiResortImpl _value, $Res Function(_$SkiResortImpl) _then)
      : super(_value, _then);

  /// Create a copy of SkiResort
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? mountain = null,
    Object? position = freezed,
    Object? description = freezed,
    Object? webcams = null,
  }) {
    return _then(_$SkiResortImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mountain: null == mountain
          ? _value.mountain
          : mountain // ignore: cast_nullable_to_non_nullable
              as Mountain,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      webcams: null == webcams
          ? _value._webcams
          : webcams // ignore: cast_nullable_to_non_nullable
              as List<WebCam>,
    ));
  }
}

/// @nodoc

class _$SkiResortImpl implements _SkiResort {
  _$SkiResortImpl(
      {required this.id,
      required this.name,
      required this.mountain,
      this.position,
      this.description,
      final List<WebCam> webcams = const []})
      : _webcams = webcams;

  @override
  final int id;
  @override
  final String name;
  @override
  final Mountain mountain;
  @override
  final LatLng? position;
  @override
  final String? description;
  final List<WebCam> _webcams;
  @override
  @JsonKey()
  List<WebCam> get webcams {
    if (_webcams is EqualUnmodifiableListView) return _webcams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_webcams);
  }

  @override
  String toString() {
    return 'SkiResort(id: $id, name: $name, mountain: $mountain, position: $position, description: $description, webcams: $webcams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkiResortImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mountain, mountain) ||
                other.mountain == mountain) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._webcams, _webcams));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, mountain, position,
      description, const DeepCollectionEquality().hash(_webcams));

  /// Create a copy of SkiResort
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkiResortImplCopyWith<_$SkiResortImpl> get copyWith =>
      __$$SkiResortImplCopyWithImpl<_$SkiResortImpl>(this, _$identity);
}

abstract class _SkiResort implements SkiResort {
  factory _SkiResort(
      {required final int id,
      required final String name,
      required final Mountain mountain,
      final LatLng? position,
      final String? description,
      final List<WebCam> webcams}) = _$SkiResortImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  Mountain get mountain;
  @override
  LatLng? get position;
  @override
  String? get description;
  @override
  List<WebCam> get webcams;

  /// Create a copy of SkiResort
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkiResortImplCopyWith<_$SkiResortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
