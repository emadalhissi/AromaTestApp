import 'package:aroma_test_app/API/Controllers/favorites_api_controller.dart';
import 'package:aroma_test_app/API/Controllers/home_response_controller.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_category.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_slider.dart';
import 'package:aroma_test_app/screens/main_screen.dart';
import 'package:aroma_test_app/screens/product_screen.dart';
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

  int selectedCategory = 0;

  @override
  void initState() {
    super.initState();
    futureHomeSliderList = HomeResponseController().showHomeSlider(context);
    futureHomeCategoryList =
        HomeResponseController().showHomeCategories(context);
  }

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
              FutureBuilder<List<HomeSlider>>(
                future: futureHomeSliderList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    homeSliderList = snapshot.data!;
                    return CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        height: 140,
                        viewportFraction: 1,
                      ),
                      items: homeSliderList.map((slider) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Container(
                                width: double.infinity,
                                height: 140,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: NetworkImage(slider.image!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    );
                  } else {
                    return Center(
                      child: Column(
                        children: const [
                          Text('NO DATA'),
                          SizedBox(height: 20),
                          Icon(
                            Icons.warning,
                            color: Colors.grey,
                            size: 80,
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              FutureBuilder<List<HomeCategory>>(
                future: futureHomeCategoryList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    homeCategoryList = snapshot.data!;
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedCategory = 0;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  decoration: selectedCategory == 0
                                      ? BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xffD6111E),
                                              Color(0xff970810),
                                            ],
                                          ),
                                        )
                                      : BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: const Color(0xff484848)
                                              .withOpacity(0.55),
                                        ),
                                  child: Center(
                                    child: Text(
                                      homeCategoryList[0].title!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedCategory = 1;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  decoration: selectedCategory == 1
                                      ? BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xffD6111E),
                                              Color(0xff970810),
                                            ],
                                          ),
                                        )
                                      : BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: const Color(0xff484848)
                                              .withOpacity(0.55),
                                        ),
                                  child: Center(
                                    child: Text(
                                      homeCategoryList[1].title!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedCategory = 2;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  decoration: selectedCategory == 2
                                      ? BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xffD6111E),
                                              Color(0xff970810),
                                            ],
                                          ),
                                        )
                                      : BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: const Color(0xff484848)
                                              .withOpacity(0.55),
                                        ),
                                  child: Center(
                                    child: Text(
                                      homeCategoryList[2].title!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
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
                            Text(
                              homeCategoryList[selectedCategory].title!,
                              style: const TextStyle(
                                color: Color(0xff171717),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainScreen(
                                      pageIndex: 1,
                                      categoryIndex: selectedCategory,
                                    ),
                                  ),
                                );
                              },
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
                        GridView.builder(
                          itemCount: 4,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 160 / 270,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductScreen(
                                      homeProduct:
                                          homeCategoryList[selectedCategory]
                                              .products![index],
                                    ),
                                  ),
                                );
                              },
                              child: HomePageGridViewItem(
                                id: homeCategoryList[selectedCategory]
                                    .products![index]
                                    .id
                                    .toString(),
                                image: homeCategoryList[selectedCategory]
                                    .products![index]
                                    .images![0]
                                    .image!,
                                name: homeCategoryList[selectedCategory]
                                    .products![index]
                                    .title!,
                                info: homeCategoryList[selectedCategory]
                                    .products![index]
                                    .subTitle!,
                                price: homeCategoryList[selectedCategory]
                                    .products![index]
                                    .price
                                    .toString(),
                                description: homeCategoryList[selectedCategory]
                                    .products![index]
                                    .description!,
                                isFavorite: homeCategoryList[selectedCategory]
                                    .products![index]
                                    .isFav!,
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: Column(
                        children: const [
                          Text('NO DATA'),
                          SizedBox(height: 20),
                          Icon(
                            Icons.warning,
                            color: Colors.grey,
                            size: 80,
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
