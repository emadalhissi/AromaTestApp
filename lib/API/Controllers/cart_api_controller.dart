import 'dart:convert';

import 'package:aroma_test_app/API/api_helper.dart';
import 'package:aroma_test_app/API/api_settings.dart';
import 'package:aroma_test_app/Helpers/snakbar.dart';
import 'package:aroma_test_app/models/API%20Models/Cart/cart_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CartApiController with SnackBarHelper, ApiHelper {
  Future<CartDataModel?> getCart() async {
    var url = Uri.parse(ApiSettings.getCart);
    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print('200 from cart controller');
      var cart = CartDataModel.fromJson(jsonDecode(response.body)['data']);
      return cart;
    }
    return null;
  }
}
