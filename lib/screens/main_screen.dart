import 'package:aroma_test_app/models/bnb_model.dart';
import 'package:aroma_test_app/screens/bnb_screens/cart_screen.dart';
import 'package:aroma_test_app/screens/bnb_screens/categories_screen.dart';
import 'package:aroma_test_app/screens/bnb_screens/favorites_screen.dart';
import 'package:aroma_test_app/screens/bnb_screens/home_screen.dart';
import 'package:aroma_test_app/screens/bnb_screens/menu_screen.dart';
import 'package:aroma_test_app/widgets/bn_widgets/bnb_active_icon.dart';
import 'package:aroma_test_app/widgets/bn_widgets/bnb_icon.dart';
import 'package:flutter/cupertino.dart';
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
    BnbModel(title: 'Cart', widget: CartScreen()),
    BnbModel(title: 'Categories', widget: CategoriesScreen()),
    BnbModel(title: 'Home', widget: HomeScreen()),
    BnbModel(title: 'Favorites', widget: FavoritesScreen()),
    BnbModel(title: 'Menu', widget: MenuScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        flexibleSpace: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color(0xff970810),
                    Color(0xffBB0D16),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 82,
              top: 25,
              child: Image(
                image: AssetImage('images/a_c_1.png'),
                height: 90,
                width: 90,
              ),
            ),
            const Positioned(
              left: 140,
              top: -8,
              child: Image(
                image: AssetImage('images/a_c_2.png'),
                height: 90,
                width: 90,
              ),
            ),
          ],
        ),
        title: const Image(image: AssetImage('images/aroma_logo_white.png')),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Image(image: AssetImage('images/support.png'),)
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined, size: 25),
          ),
          const SizedBox(width: 5)
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, size: 30),
        ),
      ),
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
                badgeContent: Text('1'),
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
                  padding: const EdgeInsets.all(15),
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
