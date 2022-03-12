import 'dart:convert';

import 'package:aroma_test_app/API/api_helper.dart';
import 'package:aroma_test_app/API/api_settings.dart';
import 'package:aroma_test_app/Helpers/snakbar.dart';
import 'package:aroma_test_app/models/API%20Models/Splash/splash_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SplashController with ApiHelper, SnackBarHelper {
  Future<SplashData?> getSplash(BuildContext context) async {
    var url = Uri.parse(ApiSettings.splash);
    var response = await http.get(
      url,
      headers: headers,
    );

    if(response.statusCode == 200) {
      print(response.statusCode);
      var splashData = SplashData.fromJson(jsonDecode(response.body)['data']);
      print(splashData.countries![0].title);

      return splashData;
    }
    return null;
  }
}
