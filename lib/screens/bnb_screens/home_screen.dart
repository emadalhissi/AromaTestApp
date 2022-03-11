import 'package:aroma_test_app/widgets/home_page_grid_view_item.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> sliderImages = <String>[
    'images/slider.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 140,
                viewportFraction: 1,
              ),
              items: sliderImages.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Container(
                        width: double.infinity,
                        height: 140,
                        // margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: AssetImage('images/slider.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 24),
            Row(
              children: [
                const Image(
                  image: AssetImage('images/red_label.png'),
                ),
                const SizedBox(width: 4),
                const Text(
                  'تطبيقات أروما',
                  style: TextStyle(
                    color: Color(0xff171717),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'عرض الكل',
                    style: TextStyle(
                      color: Color(0xff8C8C8C),
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
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
              children: const [
                HomePageGridViewItem(
                  image: 'images/app1.png',
                  name: 'Smart IPTV',
                  description: 'شراء التطبيق مدى الحياة',
                  price: '35',
                ),
                HomePageGridViewItem(
                  image: 'images/app2.png',
                  name: 'ibo player',
                  description: 'شراء التطبيق لمدة سنة',
                  price: '20',
                ),
                HomePageGridViewItem(
                  image: 'images/app2.png',
                  name: 'ibo player',
                  description: 'شراء التطبيق لمدة سنة',
                  price: '20',
                ),
                HomePageGridViewItem(
                  image: 'images/app1.png',
                  name: 'Smart IPTV',
                  description: 'شراء التطبيق مدى الحياة',
                  price: '35',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
