import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snow_weather_info/data/repositories/ski_resorts.dart';
import 'package:snow_weather_info/model/mountain.dart';
import 'package:snow_weather_info/model/ski_resort.dart';

part 'notifier.g.dart';

@riverpod
class SkiResorts extends _$SkiResorts {
  @override
  FutureOr<List<SkiResort>> build() {
    return ref.watch(skiResortsRepositoryProvider).getSkiResorts();
  }
}

extension ListSkiResorts on List<SkiResort> {
  List<SkiResort> get webcamsNord =>
      where((ski) => ski.mountain == Mountain.alpesNord).toList();

  List<SkiResort> get webcamsSud =>
      where((ski) => ski.mountain == Mountain.alpesSud).toList();

  List<SkiResort> get webcamsCorse =>
      where((ski) => ski.mountain == Mountain.corse).toList();

  List<SkiResort> get webcamsVosges =>
      where((ski) => ski.mountain == Mountain.vosges).toList();

  List<SkiResort> get webcamsCentral =>
      where((ski) => ski.mountain == Mountain.massifCentral).toList();

  List<SkiResort> get webcamsJura =>
      where((ski) => ski.mountain == Mountain.jura).toList();

  List<SkiResort> get webcamsPyrenees =>
      where((ski) => ski.mountain == Mountain.pyrenees).toList();
}
