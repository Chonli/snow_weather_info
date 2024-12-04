import 'package:dart_mappable/dart_mappable.dart';

part 'webcam.mapper.dart';

@MappableClass()
class WebCam with WebCamMappable {
  WebCam({
    required this.name,
    required this.url,
  });
  final String name;
  final String url;
}
