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

  static Future<Uint8List?> faceSwap({required String sourceUrl,required String targetUrl})async{

    print('Source: $sourceUrl \n Target: $targetUrl');

    String url = "https://api.imagepig.com/faceswap";
    String api_key = dotenv.get("API_KEY");

    final List<int> sourceImageBytes = await File(sourceUrl).readAsBytes();
    final List<int> targetImageBytes = await File(targetUrl).readAsBytes();

    final String source64 = base64Encode(sourceImageBytes);
    final String target64 = base64Encode(targetImageBytes);

    Map<String,dynamic> headers = {"Api-Key": api_key};
    Map<String,dynamic> body = {
      //TODO PASS THE IMAGES AS BASE64 ENCODED INSTEAD OF PURE STRING PATH
      //SHOULD BE EASY
      'source_image_data': source64,
      'target_image_data': target64,
    };

    Dio dio = Dio();
    dio.options = BaseOptions(
      headers: headers,
    );

    final response = await dio.post(url,data: body);

    if(response.statusCode == 200){
      print("SUCCESSFULL SWAP!");
      print("Response: $response");

      final String base64Image = response.data['image_data'];

      return base64Decode(base64Image);
    }
    else{
      print("SOMETHING WRONG HAPPENED");
      print("Status Code: ${response.statusCode}");
      print("Response: $response");
      return null;
    }

  }


}
