import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:collection/collection.dart';

class AppUtils {

  static Future<Uint8List?> convertAssetToUint8List(String imagePath)async{
    try{
      ByteData byteData = await rootBundle.load(imagePath);
      
      return byteData.buffer.asUint8List();
    }
    catch(e){
      print('an error happened while converting image to Uint8List');
      return null;
    }
  }

  static Future<LottieComposition?> customDecoder(List<int> bytes) {
  return LottieComposition.decodeZip(bytes, filePicker: (files) {
    return files.firstWhereOrNull(
        (f) => f.name.startsWith('animations/') && f.name.endsWith('.json'));
  });
}

}