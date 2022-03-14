import 'dart:convert';

import 'package:aroma_test_app/API/api_helper.dart';
import 'package:aroma_test_app/API/api_settings.dart';
import 'package:aroma_test_app/Helpers/snakbar.dart';
import 'package:aroma_test_app/models/API%20Models/Splash/splash_country.dart';
import 'package:aroma_test_app/models/API%20Models/Splash/splash_country_code.dart';
import 'package:aroma_test_app/models/API%20Models/Splash/splash_currency.dart';
import 'package:aroma_test_app/models/API%20Models/Splash/splash_data.dart';
import 'package:aroma_test_app/models/API%20Models/Splash/splash_page.dart';
import 'package:aroma_test_app/models/API%20Models/Splash/splash_social_media.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SplashController with ApiHelper, SnackBarHelper {
  Future<List<SplashCountry>> getSplashCountries(BuildContext context) async {
    var url = Uri.parse(ApiSettings.splash);
    var response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body)['data']['countries'] as List;
      return jsonResponse.map((obj) => SplashCountry.fromJson(obj)).toList();
    }
    return [];
  }

  Future<List<SplashCountryCode>> getSplashCountryCodes(BuildContext context) async {
    var url = Uri.parse(ApiSettings.splash);
    var response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body)['data']['country_codes'] as List;
      return jsonResponse.map((obj) => SplashCountryCode.fromJson(obj)).toList();
    }
    return [];
  }

  Future<List<SplashCurrency>> getSplashCurrencies(BuildContext context) async {
    var url = Uri.parse(ApiSettings.splash);
    var response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body)['data']['currencies'] as List;
      return jsonResponse.map((obj) => SplashCurrency.fromJson(obj)).toList();
    }
    return [];
  }

  Future<List<SplashSocialMedia>> getSplashSocialMedia(BuildContext context) async {
    var url = Uri.parse(ApiSettings.splash);
    var response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body)['data']['social_media'] as List;
      return jsonResponse.map((obj) => SplashSocialMedia.fromJson(obj)).toList();
    }
    return [];
  }

  Future<List<SplashPage>> getSplashPages(BuildContext context) async {
    var url = Uri.parse(ApiSettings.splash);
    var response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body)['data']['pages'] as List;
      return jsonResponse.map((obj) => SplashPage.fromJson(obj)).toList();
    }
    return [];
  }

  Future<SplashData?> getAllSplash(BuildContext context) async {
    var url = Uri.parse(ApiSettings.splash);
    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var splashData = SplashData.fromJson(jsonDecode(response.body)['data']);

      return splashData;
    }
    return null;
  }
}
