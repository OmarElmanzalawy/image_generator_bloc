import 'dart:typed_data';

import 'package:flutter/services.dart';

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

}