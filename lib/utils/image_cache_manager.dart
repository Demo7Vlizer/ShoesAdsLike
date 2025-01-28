import 'package:flutter/material.dart';

class ImageCacheManager {
  static final ImageCacheManager _instance = ImageCacheManager._internal();
  factory ImageCacheManager() => _instance;
  ImageCacheManager._internal();

  void configureImageCache() {
    PaintingBinding.instance.imageCache.maximumSize = 200; // Increased cache size
    PaintingBinding.instance.imageCache.maximumSizeBytes = 100 << 20; // 100 MB
  }

  Future<void> preloadImages(BuildContext context) async {
    final images = [
      'assets/images/one.jpg',
      'assets/images/two.jpg',
      'assets/images/three.jpg',
    ];

    for (final image in images) {
      final configuration = createLocalImageConfiguration(context);
      final asset = AssetImage(image);
      await asset.obtainKey(configuration);
      await precacheImage(asset, context);
    }
  }

  void clearCache() {
    PaintingBinding.instance.imageCache.clear();
    PaintingBinding.instance.imageCache.clearLiveImages();
  }
} 