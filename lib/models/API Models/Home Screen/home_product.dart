import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_image.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_rate.dart';

class HomeProduct {
  late int? id;
  late String? title;
  late String? subTitle;
  late String? description;
  late num? price;
  late bool? isFav;
  late bool? isRate;
  late String? rateAvg;
  late List<HomeRate>? rates;
  late int? remainingQty;
  late bool? hasOption;
  late String? optionName;
  late num? optionPrice;
  late List<HomeImage>? images;
  late int? isShipping;

  // HomeProduct({
  //   required this.id,
  //   required this.title,
  //   required this.subTitle,
  //   required this.description,
  //   required this.price,
  //   required this.isFav,
  //   required this.isRate,
  //   required this.rateAvg,
  //   required this.rates,
  //   required this.remainingQty,
  //   required this.hasOption,
  //   required this.optionName,
  //   required this.optionPrice,
  //   required this.images,
  //   required this.isShipping,
  // });

  HomeProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subTitle = json['sub_title'];
    description = json['description'];
    price = json['price'];
    isFav = json['isFav'];
    isRate = json['is_rate'];
    rateAvg = json['rate_avg'];
    if (json['rates'] != null) {
      rates = <HomeRate>[];
      json['rates'].forEach((v) {
        rates!.add(HomeRate.fromJson(v));
      });
    }
    remainingQty = json['remaining_qty'];
    hasOption = json['has_option'];
    optionName = json['option_name'];
    optionPrice = json['option_price'];
    if (json['images'] != null) {
      images = <HomeImage>[];
      json['images'].forEach((v) {
        images!.add(HomeImage.fromJson(v));
      });
    }
    isShipping = json['is_shipping'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['sub_title'] = subTitle;
    data['description'] = description;
    data['price'] = price;
    data['isFav'] = isFav;
    data['is_rate'] = isRate;
    data['rate_avg'] = rateAvg;
    if (rates != null) {
      data['rates'] = rates!.map((v) => v.toJson()).toList();
    }
    data['remaining_qty'] = remainingQty;
    data['has_option'] = hasOption;
    data['option_name'] = optionName;
    data['option_price'] = optionPrice;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['is_shipping'] = isShipping;
    return data;
  }
}
