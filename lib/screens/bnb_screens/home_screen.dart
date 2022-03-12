import 'package:aroma_test_app/API/Controllers/home_response_controller.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_category.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_slider.dart';
import 'package:aroma_test_app/widgets/home_page_grid_view_item.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<HomeSlider> homeSliderList = <HomeSlider>[];
  late Future<List<HomeSlider>> futureHomeSliderList;

  List<HomeCategory> homeCategoryList = <HomeCategory>[];
  late Future<List<HomeCategory>> futureHomeCategoryList;

  @override
  void initState() {
    super.initState();
    futureHomeSliderList = HomeResponseController().showHomeSlider(context);
    futureHomeCategoryList = HomeResponseController().showHomeCategories(context);
  }

  List<String> sliderImages = <String>[
    'images/slider.png',
  ];

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              FutureBuilder(
                builder: (context, snapshot) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
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
                  );
                },
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
                    info: 'شراء التطبيق مدى الحياة',
                    price: '35',
                  ),
                  HomePageGridViewItem(
                    image: 'images/app2.png',
                    name: 'ibo player',
                    info: 'شراء التطبيق لمدة سنة',
                    price: '20',
                  ),
                  HomePageGridViewItem(
                    image: 'images/app2.png',
                    name: 'ibo player',
                    info: 'شراء التطبيق لمدة سنة',
                    price: '20',
                  ),
                  HomePageGridViewItem(
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
