import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_category.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_review.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_slider.dart';

class HomeResponse {
  late List<HomeSlider>? sliders;
  late List<HomeCategory>? categories;
  late List<HomeReview>? reviews;

  // HomeResponse({
  //   required this.sliders,
  //   required this.categories,
  //   required this.reviews,
  // });

  HomeResponse.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      sliders = <HomeSlider>[];
      json['sliders'].forEach((v) {
        sliders!.add(HomeSlider.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <HomeCategory>[];
      json['categories'].forEach((v) {
        categories!.add(HomeCategory.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <HomeReview>[];
      json['reviews'].forEach((v) {
        reviews!.add(HomeReview.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sliders != null) {
      data['sliders'] = sliders!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
