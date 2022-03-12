import 'package:aroma_test_app/screens/product_screen.dart';
import 'package:aroma_test_app/widgets/home_page_grid_view_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text(
          'التصنيفات',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Image(
                image: AssetImage('images/support.png'),
              )),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff484848).withOpacity(0.55),
                      ),
                      child: const Center(
                        child: Text(
                          'باقات',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff484848).withOpacity(0.55),
                      ),
                      child: const Center(
                        child: Text(
                          'أجهزة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffD6111E),
                            Color(0xff970810),
                          ],
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'تطبيقات',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              GridView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 160 / 270,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductScreen(),
                        ),
                      );
                    },
                    child: const HomePageGridViewItem(
                      image: 'images/app1.png',
                      name: 'Smart IPTV',
                      info: 'شراء التطبيق مدى الحياة',
                      price: '35',
                    ),
                  ),
                  const HomePageGridViewItem(
                    image: 'images/app2.png',
                    name: 'ibo player',
                    info: 'شراء التطبيق لمدة سنة',
                    price: '20',
                  ),
                  const HomePageGridViewItem(
                    image: 'images/app2.png',
                    name: 'ibo player',
                    info: 'شراء التطبيق لمدة سنة',
                    price: '20',
                  ),
                  const HomePageGridViewItem(
                    image: 'images/app1.png',
                    name: 'Smart IPTV',
                    info: 'شراء التطبيق مدى الحياة',
                    price: '35',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
