import 'package:freezed_annotation/freezed_annotation.dart';

part 'webcam.freezed.dart';

@freezed
abstract class WebCam with _$WebCam {
  factory WebCam({
    required String name,
    required String url,
  }) = _WebCam;
}
