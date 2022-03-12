import 'dart:convert';

import 'package:aroma_test_app/API/api_helper.dart';
import 'package:aroma_test_app/API/api_settings.dart';
import 'package:aroma_test_app/Helpers/snakbar.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_category.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_response.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HomeResponseController with ApiHelper, SnackBarHelper {
  Future<List<HomeSlider>> showHomeSlider(BuildContext context) async {
    var url = Uri.parse(ApiSettings.home);
    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      var jsonResponse = jsonDecode(response.body)['data']['sliders'] as List;
      return jsonResponse.map((obj) => HomeSlider.fromJson(obj)).toList();
    }
    return [];
  }

  Future<List<HomeCategory>> showHomeCategories(BuildContext context) async {
    var url = Uri.parse(ApiSettings.home);
    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      var jsonResponse =
          jsonDecode(response.body)['data']['categories'] as List;
      return jsonResponse.map((obj) => HomeCategory.fromJson(obj)).toList();
    }
    return [];
  }
}
