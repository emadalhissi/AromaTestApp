import 'dart:convert';

import 'package:aroma_test_app/API/api_helper.dart';
import 'package:aroma_test_app/API/api_settings.dart';
import 'package:aroma_test_app/Helpers/snakbar.dart';
import 'package:aroma_test_app/models/API%20Models/Favorites/add_remove_favorite.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FavoritesApiController with ApiHelper, SnackBarHelper {
  Future<bool> favorite(
    BuildContext context, {
    required String id,
  }) async {
    var url = Uri.parse(ApiSettings.favorite + id);
    var response = await http.post(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonResponse = Favorite.fromJson(jsonDecode(response.body)['data']);
      if (jsonResponse.isFav == 1) {
        showSnackBar(
          context,
          message: 'تم اضافة المنتج الى المفضلة',
          error: false,
        );
      } else {
        showSnackBar(
          context,
          message: 'تم حذف المنتج من المفضلة',
          error: false,
        );
      }
      return true;
    }
    return false;
  }

  Future<List<HomeProduct>> getFavorites() async {
    var url = Uri.parse(ApiSettings.getFavorites);
    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body)['data']['favorites'] as List;
      return jsonResponse.map((obj) => HomeProduct.fromJson(obj)).toList();
    }

    return [];
  }
}
