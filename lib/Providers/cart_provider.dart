import 'package:aroma_test_app/API/Controllers/cart_api_controller.dart';
import 'package:aroma_test_app/models/API%20Models/Cart/cart_data.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  CartDataModel? cart_ = CartDataModel();

  final CartApiController cartApiController_ = CartApiController();

  Future<void> getCart_() async {
    print('getCart_');
    cart_ = await cartApiController_.getCart();
    notifyListeners();
  }

  // Future<bool> updateFavorite({
  //   required BuildContext context,
  //   required HomeProduct product,
  // }) async {
  //   bool status = await favoritesApiController_.favorite(context,
  //       id: product.id.toString());
  //   if (status) {
  //     if (!product.isFav!) {
  //       print('!product.isFav!');
  //       product.isFav = true;
  //       favoritesList_.add(product);
  //       print('Added from Provider');
  //       // return true;
  //     } else {
  //       print('product.isFav!');
  //       product.isFav = false;
  //       favoritesList_.removeWhere((element) => element.id == product.id);
  //       print('Removed from Provider');
  //     }
  //   }
  //   print('before return');
  //   print(status);
  //   return status;
  // }

  // bool isFavorite(int productId) {
  //   int index = favoritesList_.indexWhere((element) => element.id == productId);
  //   return index != -1;
  // }

}
