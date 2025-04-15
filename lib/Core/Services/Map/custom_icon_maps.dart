import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class CustomIconMaps {
  static Future<Uint8List> getImageFromRawData(
      String image, double width) async {
    var imageData = await rootBundle.load(image);
    var imageCodec = await ui.instantiateImageCodec(
        imageData.buffer.asUint8List(),
        targetWidth: width.round());
    var imageFrameInfo = await imageCodec.getNextFrame();
    var imageBytData =
        await imageFrameInfo.image.toByteData(format: ui.ImageByteFormat.png);
    return imageBytData!.buffer.asUint8List();
  }
}
