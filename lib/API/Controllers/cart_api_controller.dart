import 'dart:convert';

import 'package:aroma_test_app/API/api_helper.dart';
import 'package:aroma_test_app/API/api_settings.dart';
import 'package:aroma_test_app/Helpers/snakbar.dart';
import 'package:aroma_test_app/models/API%20Models/Cart/cart_data.dart';
import 'package:aroma_test_app/models/API%20Models/Cart/full_cart.dart';
import 'package:http/http.dart' as http;

class CartApiController with SnackBarHelper, ApiHelper {
  Future<CartDataModel?> getCart() async {
    var url = Uri.parse(ApiSettings.getCart);
    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var cart = CartDataModel.fromJson(jsonDecode(response.body)['data']);
      return cart;
    }
    return null;
  }

  Future<bool> addToCard({
    required String id,
    required qty,
  }) async {
    var url = Uri.parse(ApiSettings.addToCart
        .replaceFirst('PRODUCT__ID', id)
        .replaceFirst('QTY__', qty));
    var response = await http.post(
      url,
      headers: headers,
    );

    if(response.statusCode == 200) {
      bool added = jsonDecode(response.body)['status'];
      var message = jsonDecode(response.body)['message'];
      return added;
    }
    return false;
  }
}
