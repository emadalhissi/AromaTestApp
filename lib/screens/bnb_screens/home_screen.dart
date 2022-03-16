import 'package:aroma_test_app/API/Controllers/home_response_controller.dart';
import 'package:aroma_test_app/Providers/products_provider.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_category.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_slider.dart';
import 'package:aroma_test_app/screens/main_screen.dart';
import 'package:aroma_test_app/screens/product_screen.dart';
import 'package:aroma_test_app/shared_preferences/shared_preferences_controller.dart';
import 'package:aroma_test_app/widgets/home_page_grid_view_item.dart';
import 'package:aroma_test_app/widgets/open_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:animations/animations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<HomeSlider>> futureHomeSliderList;
  late Future<List<HomeCategory>> futureHomeCategoryList;

  int selectedCategory = 10;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  void initState() {
    super.initState();
    futureHomeSliderList = HomeResponseController().showHomeSlider(context);
    futureHomeCategoryList =
        HomeResponseController().showHomeCategories(context);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: ValueKey(_transitionType),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              key: _scaffoldKey,
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
                title: const Image(
                    image: AssetImage('images/aroma_logo_white.png')),
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
                      SharedPreferencesController().getSliderDownloaded == false
                          ? FutureBuilder<List<HomeSlider>>(
                              future: futureHomeSliderList,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: Shimmer(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.grey.shade300,
                                          Colors.grey.shade50,
                                          Colors.grey.shade300,
                                          Colors.grey.shade100,
                                        ],
                                      ),
                                      enabled: true,
                                      child: Container(
                                        width: double.infinity,
                                        height: 140,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                                } else if (snapshot.hasData &&
                                    snapshot.data!.isNotEmpty) {
                                  // homeSliderList = snapshot.data!;
                                  Provider.of<ProductsProvider>(context,
                                          listen: false)
                                      .setHomeSliderList_(list: snapshot.data!);
                                  SharedPreferencesController()
                                      .setSliderDownloaded(downloaded: true);
                                  return CarouselSlider(
                                    options: CarouselOptions(
                                      autoPlay: true,
                                      height: 140,
                                      viewportFraction: 1,
                                    ),
                                    items: Provider.of<ProductsProvider>(
                                            context,
                                            listen: false)
                                        .homeSliderList_
                                        .map((slider) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            child: Container(
                                              width: double.infinity,
                                              height: 140,
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                image: DecorationImage(
                                                  image:
                                                      CachedNetworkImageProvider(
                                                          slider.image!),
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
                            )
                          : CarouselSlider(
                              options: CarouselOptions(
                                autoPlay: true,
                                height: 140,
                                viewportFraction: 1,
                              ),
                              items: Provider.of<ProductsProvider>(context,
                                      listen: false)
                                  .homeSliderList_
                                  .map((slider) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: Container(
                                        width: double.infinity,
                                        height: 140,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                slider.image!),
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
                      SharedPreferencesController().getCategoriesDownloaded ==
                              false
                          ? FutureBuilder<List<HomeCategory>>(
                              future: futureHomeCategoryList,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Shimmer(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.grey.shade300,
                                                    Colors.grey.shade50,
                                                    Colors.grey.shade300,
                                                    Colors.grey.shade100,
                                                  ],
                                                ),
                                                enabled: true,
                                                child: Container(
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 70),
                                        GridView.builder(
                                          itemCount: 4,
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 160 / 270,
                                            crossAxisSpacing: 16,
                                            mainAxisSpacing: 16,
                                          ),
                                          itemBuilder: (context, index) {
                                            return Shimmer(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.grey.shade300,
                                                  Colors.grey.shade50,
                                                  Colors.grey.shade300,
                                                  Colors.grey.shade100,
                                                ],
                                              ),
                                              enabled: true,
                                              child: Container(
                                                width: 160,
                                                // height: 260,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                } else if (snapshot.hasData &&
                                    snapshot.data!.isNotEmpty) {
                                  // homeCategoryList = snapshot.data!;
                                  Provider.of<ProductsProvider>(context,
                                          listen: false)
                                      .setHomeCategoryList_(
                                          list: snapshot.data!);
                                  Provider.of<ProductsProvider>(context,
                                          listen: false)
                                      .setAllProductsList_(
                                    list: snapshot.data![0].products! +
                                        snapshot.data![1].products! +
                                        snapshot.data![2].products!,
                                  );
                                  SharedPreferencesController()
                                      .setCategoriesDownloaded(
                                          downloaded: true);
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedCategory = 10;
                                              });
                                            },
                                            child: Container(
                                              height: 40,
                                              decoration: selectedCategory == 10
                                                  ? BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      gradient:
                                                          const LinearGradient(
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          Color(0xffD6111E),
                                                          Color(0xff970810),
                                                        ],
                                                      ),
                                                    )
                                                  : BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: const Color(
                                                              0xff484848)
                                                          .withOpacity(0.55),
                                                    ),
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8),
                                                child: Center(
                                                  child: Text(
                                                    'الكل',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  selectedCategory = 0;
                                                });
                                              },
                                              child: Container(
                                                height: 40,
                                                decoration: selectedCategory ==
                                                        0
                                                    ? BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        gradient:
                                                            const LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          colors: [
                                                            Color(0xffD6111E),
                                                            Color(0xff970810),
                                                          ],
                                                        ),
                                                      )
                                                    : BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color: const Color(
                                                                0xff484848)
                                                            .withOpacity(0.55),
                                                      ),
                                                child: Center(
                                                  child: Text(
                                                    Provider.of<ProductsProvider>(
                                                            context,
                                                            listen: false)
                                                        .homeCategoryList_[0]
                                                        .title!,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  selectedCategory = 1;
                                                });
                                              },
                                              child: Container(
                                                height: 40,
                                                decoration: selectedCategory ==
                                                        1
                                                    ? BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        gradient:
                                                            const LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          colors: [
                                                            Color(0xffD6111E),
                                                            Color(0xff970810),
                                                          ],
                                                        ),
                                                      )
                                                    : BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color: const Color(
                                                                0xff484848)
                                                            .withOpacity(0.55),
                                                      ),
                                                child: Center(
                                                  child: Text(
                                                    Provider.of<ProductsProvider>(
                                                            context,
                                                            listen: false)
                                                        .homeCategoryList_[1]
                                                        .title!,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  selectedCategory = 2;
                                                });
                                              },
                                              child: Container(
                                                height: 40,
                                                decoration: selectedCategory ==
                                                        2
                                                    ? BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        gradient:
                                                            const LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          colors: [
                                                            Color(0xffD6111E),
                                                            Color(0xff970810),
                                                          ],
                                                        ),
                                                      )
                                                    : BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color: const Color(
                                                                0xff484848)
                                                            .withOpacity(0.55),
                                                      ),
                                                child: Center(
                                                  child: Text(
                                                    Provider.of<ProductsProvider>(
                                                            context,
                                                            listen: false)
                                                        .homeCategoryList_[2]
                                                        .title!,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                            image: AssetImage(
                                                'images/red_label.png'),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            selectedCategory == 10
                                                ? 'الكل'
                                                : Provider.of<ProductsProvider>(
                                                        context,
                                                        listen: false)
                                                    .homeCategoryList_[
                                                        selectedCategory]
                                                    .title!,
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
                                                  builder: (context) =>
                                                      MainScreen(
                                                    pageIndex: 1,
                                                    categoryIndex:
                                                        selectedCategory,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: selectedCategory != 10
                                                ? const Text(
                                                    'عرض الكل',
                                                    style: TextStyle(
                                                      color: Color(0xff8C8C8C),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  )
                                                : const SizedBox.shrink(),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      GridView.builder(
                                        itemCount: selectedCategory == 10
                                            ? Provider.of<ProductsProvider>(
                                                    context,
                                                    listen: false)
                                                .allProductsList_
                                                .length
                                            : 4,
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
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
                                                  builder: (context) =>
                                                      ProductScreen(
                                                    homeProduct: Provider.of<
                                                                ProductsProvider>(
                                                            context,
                                                            listen: false)
                                                        .homeCategoryList_[
                                                            selectedCategory ==
                                                                    10
                                                                ? 0
                                                                : selectedCategory]
                                                        .products![index],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: OpenContainerWrapper(
                                              transitionType: _transitionType,
                                              closedBuilder: (context, openContainer) {
                                                return HomePageGridViewItem(
                                                  id: selectedCategory == 10
                                                      ? Provider.of<
                                                      ProductsProvider>(
                                                      context,
                                                      listen: false)
                                                      .allProductsList_[index]
                                                      .id
                                                      .toString()
                                                      : Provider.of<
                                                      ProductsProvider>(
                                                      context,
                                                      listen: false)
                                                      .homeCategoryList_[
                                                  selectedCategory]
                                                      .products![index]
                                                      .id
                                                      .toString(),
                                                  image: selectedCategory == 10
                                                      ? Provider.of<
                                                      ProductsProvider>(
                                                      context,
                                                      listen: false)
                                                      .allProductsList_[index]
                                                      .images![0]
                                                      .image
                                                      .toString()
                                                      : Provider.of<
                                                      ProductsProvider>(
                                                      context,
                                                      listen: false)
                                                      .homeCategoryList_[
                                                  selectedCategory]
                                                      .products![index]
                                                      .images![0]
                                                      .image
                                                      .toString(),
                                                  name: selectedCategory == 10
                                                      ? Provider.of<
                                                      ProductsProvider>(
                                                      context,
                                                      listen: false)
                                                      .allProductsList_[index]
                                                      .title
                                                      .toString()
                                                      : Provider.of<
                                                      ProductsProvider>(
                                                      context,
                                                      listen: false)
                                                      .homeCategoryList_[
                                                  selectedCategory]
                                                      .products![index]
                                                      .title
                                                      .toString(),
                                                  info: selectedCategory == 10
                                                      ? Provider.of<
                                                      ProductsProvider>(
                                                      context,
                                                      listen: false)
                                                      .allProductsList_[index]
                                                      .subTitle
                                                      .toString()
                                                      : Provider.of<
                                                      ProductsProvider>(
                                                      context,
                                                      listen: false)
                                                      .homeCategoryList_[
                                                  selectedCategory]
                                                      .products![index]
                                                      .subTitle
                                                      .toString(),
                                                  price: selectedCategory == 10
                                                      ? Provider.of<
                                                      ProductsProvider>(
                                                      context,
                                                      listen: false)
                                                      .allProductsList_[index]
                                                      .price
                                                      .toString()
                                                      : Provider.of<
                                                      ProductsProvider>(
                                                      context,
                                                      listen: false)
                                                      .homeCategoryList_[
                                                  selectedCategory]
                                                      .products![index]
                                                      .price
                                                      .toString(),
                                                  description: selectedCategory ==
                                                      10
                                                      ? Provider.of<
                                                      ProductsProvider>(
                                                      context,
                                                      listen: false)
                                                      .allProductsList_[index]
                                                      .description
                                                      .toString()
                                                      : Provider.of<
                                                      ProductsProvider>(
                                                      context,
                                                      listen: false)
                                                      .homeCategoryList_[
                                                  selectedCategory]
                                                      .products![index]
                                                      .description
                                                      .toString(),
                                                  isFavorite: selectedCategory == 10
                                                      ? Provider.of<
                                                      ProductsProvider>(
                                                      context,
                                                      listen: false)
                                                      .allProductsList_[index]
                                                      .isFav!
                                                      : Provider.of<
                                                      ProductsProvider>(
                                                      context,
                                                      listen: false)
                                                      .homeCategoryList_[
                                                  selectedCategory]
                                                      .products![index]
                                                      .isFav!,
                                                );
                                              },
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
                            )
                          : Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedCategory = 10;
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        decoration: selectedCategory == 10
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
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Center(
                                            child: Text(
                                              'الكل',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
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
                                                  gradient:
                                                      const LinearGradient(
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
                                              Provider.of<ProductsProvider>(
                                                      context,
                                                      listen: false)
                                                  .homeCategoryList_[0]
                                                  .title!,
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
                                    const SizedBox(width: 12),
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
                                                  gradient:
                                                      const LinearGradient(
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
                                              Provider.of<ProductsProvider>(
                                                      context,
                                                      listen: false)
                                                  .homeCategoryList_[1]
                                                  .title!,
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
                                    const SizedBox(width: 12),
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
                                                  gradient:
                                                      const LinearGradient(
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
                                              Provider.of<ProductsProvider>(
                                                      context,
                                                      listen: false)
                                                  .homeCategoryList_[2]
                                                  .title!,
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
                                      selectedCategory == 10
                                          ? 'الكل'
                                          : Provider.of<ProductsProvider>(
                                                  context,
                                                  listen: false)
                                              .homeCategoryList_[
                                                  selectedCategory]
                                              .title!,
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
                                      child: selectedCategory != 10
                                          ? const Text(
                                              'عرض الكل',
                                              style: TextStyle(
                                                color: Color(0xff8C8C8C),
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                GridView.builder(
                                  itemCount: selectedCategory == 10
                                      ? Provider.of<ProductsProvider>(context,
                                              listen: false)
                                          .allProductsList_
                                          .length
                                      : 4,
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
                                              homeProduct: Provider.of<
                                                          ProductsProvider>(
                                                      context,
                                                      listen: false)
                                                  .homeCategoryList_[
                                                      selectedCategory == 10
                                                          ? 0
                                                          : selectedCategory]
                                                  .products![index],
                                            ),
                                          ),
                                        );
                                      },
                                      child: OpenContainerWrapper(
                                        transitionType: _transitionType,
                                        closedBuilder: (context, openContainer) {
                                          print('closedBuilder--');
                                          return HomePageGridViewItem(
                                            id: selectedCategory == 10
                                                ? Provider.of<ProductsProvider>(
                                                context,
                                                listen: false)
                                                .allProductsList_[index]
                                                .id
                                                .toString()
                                                : Provider.of<ProductsProvider>(
                                                context,
                                                listen: false)
                                                .homeCategoryList_[
                                            selectedCategory]
                                                .products![index]
                                                .id
                                                .toString(),
                                            image: selectedCategory == 10
                                                ? Provider.of<ProductsProvider>(
                                                context,
                                                listen: false)
                                                .allProductsList_[index]
                                                .images![0]
                                                .image
                                                .toString()
                                                : Provider.of<ProductsProvider>(
                                                context,
                                                listen: false)
                                                .homeCategoryList_[
                                            selectedCategory]
                                                .products![index]
                                                .images![0]
                                                .image
                                                .toString(),
                                            name: selectedCategory == 10
                                                ? Provider.of<ProductsProvider>(
                                                context,
                                                listen: false)
                                                .allProductsList_[index]
                                                .title
                                                .toString()
                                                : Provider.of<ProductsProvider>(
                                                context,
                                                listen: false)
                                                .homeCategoryList_[
                                            selectedCategory]
                                                .products![index]
                                                .title
                                                .toString(),
                                            info: selectedCategory == 10
                                                ? Provider.of<ProductsProvider>(
                                                context,
                                                listen: false)
                                                .allProductsList_[index]
                                                .subTitle
                                                .toString()
                                                : Provider.of<ProductsProvider>(
                                                context,
                                                listen: false)
                                                .homeCategoryList_[
                                            selectedCategory]
                                                .products![index]
                                                .subTitle
                                                .toString(),
                                            price: selectedCategory == 10
                                                ? Provider.of<ProductsProvider>(
                                                context,
                                                listen: false)
                                                .allProductsList_[index]
                                                .price
                                                .toString()
                                                : Provider.of<ProductsProvider>(
                                                context,
                                                listen: false)
                                                .homeCategoryList_[
                                            selectedCategory]
                                                .products![index]
                                                .price
                                                .toString(),
                                            description: selectedCategory == 10
                                                ? Provider.of<ProductsProvider>(
                                                context,
                                                listen: false)
                                                .allProductsList_[index]
                                                .description
                                                .toString()
                                                : Provider.of<ProductsProvider>(
                                                context,
                                                listen: false)
                                                .homeCategoryList_[
                                            selectedCategory]
                                                .products![index]
                                                .description
                                                .toString(),
                                            isFavorite: selectedCategory == 10
                                                ? Provider.of<ProductsProvider>(
                                                context,
                                                listen: false)
                                                .allProductsList_[index]
                                                .isFav!
                                                : Provider.of<ProductsProvider>(
                                                context,
                                                listen: false)
                                                .homeCategoryList_[
                                            selectedCategory]
                                                .products![index]
                                                .isFav!,
                                          );
                                        },

                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}


