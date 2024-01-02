import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snow_weather_info/model/mountain.dart';
import 'package:snow_weather_info/model/webcam.dart';

part 'ski_resort.freezed.dart';

@freezed
abstract class SkiResort with _$SkiResort {
  factory SkiResort({
    required String name,
    required Mountain mountain,
    String? description,
    @Default([]) List<WebCam> webcams,
  }) = _SkiResort;
}
