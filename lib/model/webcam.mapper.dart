// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'webcam.dart';

class WebCamMapper extends ClassMapperBase<WebCam> {
  WebCamMapper._();

  static WebCamMapper? _instance;
  static WebCamMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WebCamMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'WebCam';

  static String _$name(WebCam v) => v.name;
  static const Field<WebCam, String> _f$name = Field('name', _$name);
  static String _$url(WebCam v) => v.url;
  static const Field<WebCam, String> _f$url = Field('url', _$url);

  @override
  final MappableFields<WebCam> fields = const {#name: _f$name, #url: _f$url};

  static WebCam _instantiate(DecodingData data) {
    return WebCam(name: data.dec(_f$name), url: data.dec(_f$url));
  }

  @override
  final Function instantiate = _instantiate;

  static WebCam fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WebCam>(map);
  }

  static WebCam fromJson(String json) {
    return ensureInitialized().decodeJson<WebCam>(json);
  }
}

mixin WebCamMappable {
  String toJson() {
    return WebCamMapper.ensureInitialized().encodeJson<WebCam>(this as WebCam);
  }

  Map<String, dynamic> toMap() {
    return WebCamMapper.ensureInitialized().encodeMap<WebCam>(this as WebCam);
  }

  WebCamCopyWith<WebCam, WebCam, WebCam> get copyWith =>
      _WebCamCopyWithImpl<WebCam, WebCam>(this as WebCam, $identity, $identity);
  @override
  String toString() {
    return WebCamMapper.ensureInitialized().stringifyValue(this as WebCam);
  }

  @override
  bool operator ==(Object other) {
    return WebCamMapper.ensureInitialized().equalsValue(this as WebCam, other);
  }

  @override
  int get hashCode {
    return WebCamMapper.ensureInitialized().hashValue(this as WebCam);
  }
}

extension WebCamValueCopy<$R, $Out> on ObjectCopyWith<$R, WebCam, $Out> {
  WebCamCopyWith<$R, WebCam, $Out> get $asWebCam =>
      $base.as((v, t, t2) => _WebCamCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WebCamCopyWith<$R, $In extends WebCam, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? url});
  WebCamCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WebCamCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, WebCam, $Out>
    implements WebCamCopyWith<$R, WebCam, $Out> {
  _WebCamCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WebCam> $mapper = WebCamMapper.ensureInitialized();
  @override
  $R call({String? name, String? url}) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (url != null) #url: url,
    }),
  );
  @override
  WebCam $make(CopyWithData data) => WebCam(
    name: data.get(#name, or: $value.name),
    url: data.get(#url, or: $value.url),
  );

  @override
  WebCamCopyWith<$R2, WebCam, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _WebCamCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

