import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_category.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_product.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  List<HomeSlider> homeSliderList_ = <HomeSlider>[];
  List<HomeCategory> homeCategoryList_ = <HomeCategory>[];
  List<HomeProduct> allProductsList_ = <HomeProduct>[];


  void setHomeSliderList_({required List<HomeSlider> list}) {
    homeSliderList_ = list;
    // notifyListeners();
  }

  void setHomeCategoryList_({required List<HomeCategory> list}) {
    homeCategoryList_ = list;
    // notifyListeners();
  }

  void setAllProductsList_({required List<HomeProduct> list}) {
    allProductsList_ = list;
    // notifyListeners();
  }
}
