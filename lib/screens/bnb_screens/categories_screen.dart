import 'package:animations/animations.dart';
import 'package:aroma_test_app/API/Controllers/home_response_controller.dart';
import 'package:aroma_test_app/Providers/favorites_provider.dart';
import 'package:aroma_test_app/Providers/products_provider.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_category.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_product.dart';
import 'package:aroma_test_app/screens/product_screen.dart';
import 'package:aroma_test_app/widgets/home_page_grid_view_item.dart';
import 'package:aroma_test_app/widgets/open_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  final int categoryIndex;

  const CategoriesScreen({
    Key? key,
    this.categoryIndex = 0,
  }) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  // late Future<List<HomeCategory>> futureHomeCategoryList;

  late int selectedCategory = widget.categoryIndex;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  void initState() {
    super.initState();
    // futureHomeCategoryList =
    //     HomeResponseController().showHomeCategories(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      borderRadius: BorderRadius.circular(8),
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
                                      borderRadius: BorderRadius.circular(8),
                                      color: const Color(0xff484848)
                                          .withOpacity(0.55),
                                    ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
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
                                        borderRadius: BorderRadius.circular(8),
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
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xff484848)
                                            .withOpacity(0.55),
                                      ),
                                child: Center(
                                  child: Text(
                                    Provider.of<ProductsProvider>(context,
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
                                        borderRadius: BorderRadius.circular(8),
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
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xff484848)
                                            .withOpacity(0.55),
                                      ),
                                child: Center(
                                  child: Text(
                                    Provider.of<ProductsProvider>(context,
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
                                        borderRadius: BorderRadius.circular(8),
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
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xff484848)
                                            .withOpacity(0.55),
                                      ),
                                child: Center(
                                  child: Text(
                                    Provider.of<ProductsProvider>(context,
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
                      const SizedBox(height: 30),
                      GridView.builder(
                        itemCount: selectedCategory == 10
                            ? Provider.of<ProductsProvider>(context,
                                    listen: false)
                                .allProductsList_
                                .length
                            : Provider.of<ProductsProvider>(context,
                                    listen: false)
                                .homeCategoryList_[selectedCategory]
                                .products!
                                .length,
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
                              Navigator.of(context).push(

                                MaterialPageRoute(
                                  builder: (context) => ProductScreen(
                                    homeProduct: Provider.of<ProductsProvider>(
                                            context,
                                            listen: false)
                                        .homeCategoryList_[
                                            selectedCategory == 10
                                                ? 0
                                                : selectedCategory]
                                        .products![index],
                                  ),
                                ),
                              ).then((_) => setState(() {}));
                            },
                            child: OpenContainerWrapper(
                              transitionType: _transitionType,
                              closedBuilder: (context, action) {
                                return HomePageGridViewItem(
                                  favoriteProduct: () {
                                     favoriteProduct(
                                      selectedCategory == 10
                                          ? Provider.of<ProductsProvider>(
                                        context,
                                          listen: false
                                      )
                                          .allProductsList_[index]
                                          : Provider.of<ProductsProvider>(
                                        context,
                                          listen: false
                                      )
                                          .homeCategoryList_[
                                      selectedCategory]
                                          .products![index],
                                    );
                                  },
                                  addToCart: (){},
                                  homeProduct: selectedCategory == 10
                                      ? Provider.of<ProductsProvider>(context,
                                              listen: false)
                                          .allProductsList_[index]
                                      : Provider.of<ProductsProvider>(context,
                                              listen: false)
                                          .homeCategoryList_[selectedCategory]
                                          .products![index],
                                  id: selectedCategory == 10
                                      ? Provider.of<ProductsProvider>(context,
                                              listen: false)
                                          .allProductsList_[index]
                                          .id
                                          .toString()
                                      : Provider.of<ProductsProvider>(context,
                                              listen: false)
                                          .homeCategoryList_[selectedCategory]
                                          .products![index]
                                          .id
                                          .toString(),
                                  image: selectedCategory == 10
                                      ? Provider.of<ProductsProvider>(context,
                                              listen: false)
                                          .allProductsList_[index]
                                          .images![0]
                                          .image
                                          .toString()
                                      : Provider.of<ProductsProvider>(context,
                                              listen: false)
                                          .homeCategoryList_[selectedCategory]
                                          .products![index]
                                          .images![0]
                                          .image
                                          .toString(),
                                  name: selectedCategory == 10
                                      ? Provider.of<ProductsProvider>(context,
                                              listen: false)
                                          .allProductsList_[index]
                                          .title
                                          .toString()
                                      : Provider.of<ProductsProvider>(context,
                                              listen: false)
                                          .homeCategoryList_[selectedCategory]
                                          .products![index]
                                          .title
                                          .toString(),
                                  info: selectedCategory == 10
                                      ? Provider.of<ProductsProvider>(context,
                                              listen: false)
                                          .allProductsList_[index]
                                          .subTitle
                                          .toString()
                                      : Provider.of<ProductsProvider>(context,
                                              listen: false)
                                          .homeCategoryList_[selectedCategory]
                                          .products![index]
                                          .subTitle
                                          .toString(),
                                  price: selectedCategory == 10
                                      ? Provider.of<ProductsProvider>(context,
                                              listen: false)
                                          .allProductsList_[index]
                                          .price
                                          .toString()
                                      : Provider.of<ProductsProvider>(context,
                                              listen: false)
                                          .homeCategoryList_[selectedCategory]
                                          .products![index]
                                          .price
                                          .toString(),
                                  description: selectedCategory == 10
                                      ? Provider.of<ProductsProvider>(context,
                                              listen: false)
                                          .allProductsList_[index]
                                          .description
                                          .toString()
                                      : Provider.of<ProductsProvider>(context,
                                              listen: false)
                                          .homeCategoryList_[selectedCategory]
                                          .products![index]
                                          .description
                                          .toString(),
                                  isFavorite: selectedCategory == 10
                                      ? Provider.of<ProductsProvider>(context)
                                          .allProductsList_[index]
                                          .isFav!
                                      : Provider.of<ProductsProvider>(context)
                                          .homeCategoryList_[selectedCategory]
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
                ),
              );
  }
  Future<void> favoriteProduct(HomeProduct homeProduct) async {
    bool status = await Provider.of<FavoritesProvider>(context, listen: false).updateFavorite(
      context: context,
      product: homeProduct,
    );
    setState(() {});
  }
}
