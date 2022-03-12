import 'package:aroma_test_app/models/bnb_model.dart';
import 'package:aroma_test_app/screens/bnb_screens/cart_screen.dart';
import 'package:aroma_test_app/screens/bnb_screens/categories_screen.dart';
import 'package:aroma_test_app/screens/bnb_screens/favorites_screen.dart';
import 'package:aroma_test_app/screens/bnb_screens/home_screen.dart';
import 'package:aroma_test_app/screens/bnb_screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 2;
  final List<BnbModel> _bnbModel = <BnbModel>[
    BnbModel(title: 'Cart', widget: const CartScreen()),
    BnbModel(title: 'Categories', widget: const CategoriesScreen()),
    BnbModel(title: 'Home', widget: const HomeScreen()),
    BnbModel(title: 'Favorites', widget: const FavoritesScreen()),
    BnbModel(title: 'Menu', widget: const MenuScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _bnbModel[_currentIndex].widget,
      bottomNavigationBar: Container(
        // height: 65,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        width: MediaQuery.of(context).size.width,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedFontSize: 5,
          unselectedFontSize: 5,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Badge(
                position: BadgePosition.topStart(),
                animationType: BadgeAnimationType.scale,
                badgeContent: const Text('1'),
                child: const Icon(
                  Icons.shopping_cart,
                  size: 27,
                  color: Color(0xff7B7B81),
                ),
              ),
              label: '',
              activeIcon: Container(
                height: 55,
                width: 55,
                child: const Icon(
                  Icons.shopping_cart,
                  size: 27,
                  color: Colors.white,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/active_icon_bnb.png'),
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: const Image(
                image: AssetImage('images/categories_icon_bnb.png'),
                width: 25,
                height: 20,
              ),
              label: '',
              activeIcon: Container(
                height: 55,
                width: 55,
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Image(
                    image: AssetImage('images/categories_icon_bnb.png'),
                    width: 22,
                    height: 15,
                    color: Colors.white,
                  ),
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/active_icon_bnb.png'),
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
                size: 27,
                color: Color(0xff7B7B81),
              ),
              label: '',
              activeIcon: Container(
                height: 55,
                width: 55,
                child: const Icon(
                  Icons.home,
                  size: 27,
                  color: Colors.white,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/active_icon_bnb.png'),
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.favorite,
                size: 25,
                color: Color(0xff7B7B81),
              ),
              label: '',
              activeIcon: Container(
                height: 55,
                width: 55,
                child: const Icon(
                  Icons.favorite,
                  size: 25,
                  color: Colors.white,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/active_icon_bnb.png'),
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: const Image(
                image: AssetImage('images/menu_icon_bnb.png'),
                width: 22,
                height: 15,
              ),
              label: '',
              activeIcon: Container(
                height: 55,
                width: 55,
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Image(
                    image: AssetImage('images/menu_icon_bnb.png'),
                    width: 22,
                    height: 15,
                    color: Colors.white,
                  ),
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/active_icon_bnb.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
