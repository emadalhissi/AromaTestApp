import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_product.dart';

class HomeCategory {
  late int? id;
  late String? title;
  late List<HomeProduct>? products;

  // HomeCategory({
  //   required this.id,
  //   required this.title,
  //   required this.products,
  // });

  HomeCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['products'] != null) {
      products = <HomeProduct>[];
      json['products'].forEach((v) {
        products!.add(HomeProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
