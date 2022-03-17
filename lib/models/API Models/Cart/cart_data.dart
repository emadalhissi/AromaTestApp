import 'package:aroma_test_app/models/API%20Models/Cart/cart_product.dart';

class CartDataModel {
  late int? id;
  late int? total;
  late List<CartProduct>? cartProduct;

  CartDataModel();

  CartDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    if (json['cart_products'] != null) {
      cartProduct = <CartProduct>[];
      json['cart_products'].forEach((v) {
        cartProduct!.add(CartProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['total'] = total;
    if (cartProduct != null) {
      data['cart_products'] = cartProduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
