// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snow_weather_info/model/mountain.dart';

part 'avalanche_bulletin.freezed.dart';

@freezed
abstract class AvalancheBulletin with _$AvalancheBulletin {
  const factory AvalancheBulletin({
    required String massifName,
    required int beraNumber,
    required Mountain mountain,
  }) = _AvalancheBulletin;
}
