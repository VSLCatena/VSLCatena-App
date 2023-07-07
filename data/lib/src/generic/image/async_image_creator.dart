import 'package:domain/generic.dart';
import 'package:injectable/injectable.dart';

import 'async_image_impl.dart';

@lazySingleton
class AsyncImageCreator {
  final Map<String, AsyncImage> _cache = {};

  AsyncImage create(String savePath, String url) {
    final cacheHit = _cache[savePath];
    if (cacheHit != null) return cacheHit;

    final asyncImage = AsyncImageImpl(savePath, url);
    _cache[savePath] = asyncImage;

    return asyncImage;
  }
}
