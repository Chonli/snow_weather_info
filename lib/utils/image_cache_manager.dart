import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class MyImageCacheManager {
  static const key = 'ImageCacheManager';
  static CacheManager instance = CacheManager(
    Config(
      key,
      stalePeriod: const Duration(hours: 2),
      maxNrOfCacheObjects: 40,
    ),
  );
}
