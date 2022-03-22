import 'package:aroma_test_app/API/Controllers/cart_api_controller.dart';
import 'package:aroma_test_app/models/API%20Models/Cart/cart_data.dart';
import 'package:aroma_test_app/models/API%20Models/Cart/cart_product.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  late int? totalCartPrice;
  List<CartProduct> cart_ = <CartProduct>[];

  final CartApiController cartApiController_ = CartApiController();

  Future<void> getCart_() async {
    print('getCart_');
    var obj = await cartApiController_.getCart();
    totalCartPrice = obj!.total;
    cart_ = obj.cartProduct!;
    notifyListeners();
  }

  Future<bool> addToCart_({
    required String id,
    String qty = '1',
  }) async {
    bool status = await cartApiController_.addToCard(
      id: id,
      qty: qty,
    );
    if(status) {
      print('status is $status from addToCart_');

    }

    return status;
  }
}
