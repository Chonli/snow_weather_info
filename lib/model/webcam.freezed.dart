// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'webcam.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WebCam {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WebCamCopyWith<WebCam> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebCamCopyWith<$Res> {
  factory $WebCamCopyWith(WebCam value, $Res Function(WebCam) then) =
      _$WebCamCopyWithImpl<$Res, WebCam>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$WebCamCopyWithImpl<$Res, $Val extends WebCam>
    implements $WebCamCopyWith<$Res> {
  _$WebCamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WebCamImplCopyWith<$Res> implements $WebCamCopyWith<$Res> {
  factory _$$WebCamImplCopyWith(
          _$WebCamImpl value, $Res Function(_$WebCamImpl) then) =
      __$$WebCamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$WebCamImplCopyWithImpl<$Res>
    extends _$WebCamCopyWithImpl<$Res, _$WebCamImpl>
    implements _$$WebCamImplCopyWith<$Res> {
  __$$WebCamImplCopyWithImpl(
      _$WebCamImpl _value, $Res Function(_$WebCamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$WebCamImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WebCamImpl implements _WebCam {
  _$WebCamImpl({required this.name, required this.url});

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'WebCam(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebCamImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WebCamImplCopyWith<_$WebCamImpl> get copyWith =>
      __$$WebCamImplCopyWithImpl<_$WebCamImpl>(this, _$identity);
}

abstract class _WebCam implements WebCam {
  factory _WebCam({required final String name, required final String url}) =
      _$WebCamImpl;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$WebCamImplCopyWith<_$WebCamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
