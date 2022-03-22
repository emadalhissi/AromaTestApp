import 'package:aroma_test_app/API/Controllers/favorites_api_controller.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  List<HomeProduct> favoritesList_ = <HomeProduct>[];
  final FavoritesApiController favoritesApiController_ =
      FavoritesApiController();

  Future<void> getFavorites_() async {
    print('getFavorites_');
    favoritesList_ = await favoritesApiController_.getFavorites();
    notifyListeners();
  }

  Future<bool> updateFavorite({
    required BuildContext context,
    required HomeProduct product,
  }) async {
    bool status = await favoritesApiController_.favorite(context,
        id: product.id.toString());
    if (status) {
      if (!product.isFav!) {
        print('!product.isFav!');
        product.isFav = true;
        favoritesList_.add(product);
        print('Added from Provider');
        // return true;
      } else {
        print('product.isFav!');
        product.isFav = false;
        favoritesList_.removeWhere((element) => element.id == product.id);
        print('Removed from Provider');
      }
    }
    print('before return');
    print(status);
    return status;
  }

  bool isFavorite(int productId) {
    int index = favoritesList_.indexWhere((element) => element.id == productId);
    return index != -1;
  }

  void delete_() {
    favoritesList_.removeAt(0);
    notifyListeners();
  }
}
