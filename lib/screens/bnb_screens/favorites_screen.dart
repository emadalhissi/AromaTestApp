import 'package:animations/animations.dart';
import 'package:aroma_test_app/Providers/favorites_provider.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_product.dart';
import 'package:aroma_test_app/screens/product_screen.dart';
import 'package:aroma_test_app/widgets/home_page_grid_view_item.dart';
import 'package:aroma_test_app/widgets/open_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Provider.of<FavoritesProvider>(context, listen: false)
                          .favoritesList_
                          .isNotEmpty
                      ? GridView.builder(
                          itemCount: Provider.of<FavoritesProvider>(context,
                                  listen: false)
                              .favoritesList_
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
                                Navigator.of(context)
                                    .push(
                                      MaterialPageRoute(
                                        builder: (context) => ProductScreen(
                                          homeProduct:
                                              Provider.of<FavoritesProvider>(
                                                      context,
                                                      listen: false)
                                                  .favoritesList_[index],
                                        ),
                                      ),
                                    )
                                    .then((_) => setState(() {}));
                              },
                              child: OpenContainerWrapper(
                                transitionType: _transitionType,
                                closedBuilder: (context, action) {
                                  return HomePageGridViewItem(
                                    favoriteProduct: () {
                                      favoriteProduct(
                                        Provider.of<FavoritesProvider>(context,
                                                listen: false)
                                            .favoritesList_[index],
                                      );
                                    },
                                    addToCart: (){},
                                    homeProduct: Provider.of<FavoritesProvider>(
                                            context,
                                            listen: false)
                                        .favoritesList_[index],
                                    id: Provider.of<FavoritesProvider>(context,
                                            listen: false)
                                        .favoritesList_[index]
                                        .id
                                        .toString(),
                                    image: Provider.of<FavoritesProvider>(
                                            context,
                                            listen: false)
                                        .favoritesList_[index]
                                        .images![0]
                                        .image
                                        .toString(),
                                    name: Provider.of<FavoritesProvider>(
                                            context,
                                            listen: false)
                                        .favoritesList_[index]
                                        .title
                                        .toString(),
                                    info: Provider.of<FavoritesProvider>(
                                            context,
                                            listen: false)
                                        .favoritesList_[index]
                                        .subTitle
                                        .toString(),
                                    price: Provider.of<FavoritesProvider>(
                                            context,
                                            listen: false)
                                        .favoritesList_[index]
                                        .price
                                        .toString(),
                                    description: Provider.of<FavoritesProvider>(
                                            context,
                                            listen: false)
                                        .favoritesList_[index]
                                        .description
                                        .toString(),
                                    isFavorite:
                                        Provider.of<FavoritesProvider>(context)
                                            .favoritesList_[index]
                                            .isFav!,
                                  );
                                },
                              ),
                            );
                          },
                        )
                      : Center(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height  / 1.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.favorite,
                                  size: 140,
                                  color: Colors.grey.shade500,
                                ),
                                const SizedBox(height: 40),
                                const Text(
                                  'لا يوجد منتجات في المفضلة',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              );
  }

  Future<void> favoriteProduct(HomeProduct homeProduct) async {
    await Provider.of<FavoritesProvider>(context, listen: false).updateFavorite(
      context: context,
      product: homeProduct,
    );
    setState(() {});
  }
}
