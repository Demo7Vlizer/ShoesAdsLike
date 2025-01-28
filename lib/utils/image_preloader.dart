import 'package:flutter/material.dart';

class ImagePreloader {
  static Future<void> preloadImages(BuildContext context) async {
    final images = [
      'assets/images/one.jpg',
      'assets/images/two.jpg',
      'assets/images/three.jpg',
    ];

    for (final image in images) {
      await precacheImage(AssetImage(image), context);
    }
  }
}
