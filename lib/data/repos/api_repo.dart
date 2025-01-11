import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiRepo {

  static Future<Uint8List?> generateImage(String prompt)async{
    String url = "https://api.imagepig.com/xl";
    String api_key = dotenv.get("API_KEY");
    
    final Map<String,dynamic> headers = {"Api-Key": api_key};
    final Map<String,dynamic> body = {"prompt": prompt};

    Dio dio = Dio();
    dio.options = BaseOptions(
      headers: headers,
    );
    
    final response = await dio.post(url, data: body);

    if(response.statusCode == 200){
      print('SUCCESS!');
      print('RESONSE: $response');
      final String base64Image = response.data['image_data'];
      print('Generated Image: \n\n $base64Image');

      return base64Decode(base64Image);

    }
    else{
      print('Error Fetching the image');
      return null;
    }

  }
}
