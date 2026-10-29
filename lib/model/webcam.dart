import 'package:dart_mappable/dart_mappable.dart';

part 'webcam.mapper.dart';

@MappableClass()
class WebCam with WebCamMappable {
  const new({required this.name, required this.url});

  final String name;
  final String url;
}
