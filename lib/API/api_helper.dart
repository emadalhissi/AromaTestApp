import 'package:aroma_test_app/shared_preferences/shared_preferences_controller.dart';
import 'package:flutter/material.dart';

mixin ApiHelper {
  Map<String, String> get headers {
    var headers = {
      'Cache-Control': 'no-cache',
      'Content-Length': '0',
      'Accept': 'application/json',
      'Connection': 'keep-alive',
      'Accept-Language': SharedPreferencesController().checkLanguage,
      'X-Client-FCM-Token': '123456fcm_token55',
      'X-Client-Device-Type': '123456device_type55',
      'X-Client-Device-UDID': SharedPreferencesController().getDeviceId,
      'Authorization': SharedPreferencesController().getToken,
      'X-Client-Device-Message-uid': SharedPreferencesController().getAppSignature,
    };
    // if(SharedPreferencesController().loggedIn) {
    // headers['Authorization'] = SharedPreferencesController().getToken;
    // }
    return headers;
  }
}
