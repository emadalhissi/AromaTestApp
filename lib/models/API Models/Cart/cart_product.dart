class CartProduct {
  late int? id;
  late String? productName;
  late String? productImage;
  late int? qty;
  late int? price;
  late int? total;
  late bool? isShipping;
  late bool? hasOption;
  late String? optionName;
  late int? optionPrice;

  // CartProduct({
  //   required this.id,
  //   required this.productName,
  //   required this.productImage,
  //   required this.qty,
  //   required this.price,
  //   required this.total,
  //   required this.isShipping,
  //   required this.hasOption,
  //   required this.optionName,
  //   required this.optionPrice,
  // });

  CartProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    qty = json['qty'];
    price = json['price'];
    total = json['total'];
    isShipping = json['is_shipping'];
    hasOption = json['has_option'];
    optionName = json['option_name'];
    optionPrice = json['option_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_name'] = productName;
    data['product_image'] = productImage;
    data['qty'] = qty;
    data['price'] = price;
    data['total'] = total;
    data['is_shipping'] = isShipping;
    data['has_option'] = hasOption;
    data['option_name'] = optionName;
    data['option_price'] = optionPrice;
    return data;
  }
}
