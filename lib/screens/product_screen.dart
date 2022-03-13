import 'package:aroma_test_app/API/Controllers/favorites_api_controller.dart';
import 'package:aroma_test_app/models/API%20Models/Home%20Screen/home_product.dart';
import 'package:aroma_test_app/widgets/product_screen_feedback_container.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final HomeProduct homeProduct;

  const ProductScreen({
    Key? key,
    required this.homeProduct,
  }) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String rate() {
    if (widget.homeProduct.rateAvg != null) {
      String rateBefore = widget.homeProduct.rateAvg!;
      double doubleRate = double.parse(rateBefore);
      String rateAfter = doubleRate.toStringAsFixed(1);
      // double inDouble = double.parse(inString);
      return rateAfter;
    }
    return '0';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const SizedBox.shrink(),
        leadingWidth: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 19,
                backgroundColor: const Color(0xffBCBCBC),
                child: Center(
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: const Color(0xff1C1C1D),
                  ),
                ),
              ),
              const CircleAvatar(
                radius: 19,
                backgroundColor: Color(0xffBCBCBC),
                child: Center(
                  child: Icon(
                    Icons.share,
                    color: Color(0xff1C1C1D),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                // autoPlay: true,
                height: 380,
                viewportFraction: 1,
                enableInfiniteScroll: false,
              ),
              items: widget.homeProduct.images!.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Container(
                        width: double.infinity,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(image.image!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            // Image(
            //   image: NetworkImage(widget.homeProduct.images![0].image!),
            //   width: MediaQuery.of(context).size.width,
            //   height: 380,
            //   fit: BoxFit.cover,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.homeProduct.title!,
                              style: const TextStyle(
                                color: Color(0xff171717),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              // overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              widget.homeProduct.subTitle!,
                              style: const TextStyle(
                                color: Color(0xff8C8C8C),
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await favorite();
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                widget.homeProduct.isFav!
                                    ? const Color(0xffD6111E)
                                    : const Color(0xffC3C3C3),
                                widget.homeProduct.isFav!
                                    ? const Color(0xff970810)
                                    : const Color(0xffC3C3C3),
                              ],
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    color: Color(0xff7B7B81),
                    height: 0,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        widget.homeProduct.price!.toString(),
                        style: const TextStyle(
                          color: Color(0xffD6111E),
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(width: 2),
                      const Text(
                        'ر.س',
                        style: TextStyle(
                          color: Color(0xffD6111E),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.star,
                        color: num.parse(rate()) >= 1
                            ? const Color(0xffFFB850)
                            : const Color(0xff262323).withOpacity(0.25),
                      ),
                      Icon(
                        Icons.star,
                        color: num.parse(rate()) >= 2
                            ? const Color(0xffFFB850)
                            : const Color(0xff262323).withOpacity(0.25),
                      ),
                      Icon(
                        Icons.star,
                        color: num.parse(rate()) >= 3
                            ? const Color(0xffFFB850)
                            : const Color(0xff262323).withOpacity(0.25),
                      ),
                      Icon(
                        Icons.star,
                        color: num.parse(rate()) >= 4
                            ? const Color(0xffFFB850)
                            : const Color(0xff262323).withOpacity(0.25),
                      ),
                      Icon(
                        Icons.star,
                        color: num.parse(rate()) == 5
                            ? const Color(0xffFFB850)
                            : const Color(0xff262323).withOpacity(0.25),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        rate(),
                        style: const TextStyle(
                          color: Color(0xff171717),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '(${widget.homeProduct.rates!.length} تقييم)',
                        style: const TextStyle(
                          color: Color(0xff8C8C8C),
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Divider(
                    color: Color(0xff7B7B81),
                    height: 0,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'الوصف',
                    style: TextStyle(
                      color: Color(0xff171717),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.homeProduct.description!,
                    style: const TextStyle(
                      color: Color(0xff6B6868),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'الآراء',
                    style: TextStyle(
                      color: Color(0xff171717),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 13),
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    children: const [
                      ProductScreenFeedbackContainer(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        // height: 85,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 1.5,
              offset: const Offset(0, 0.5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color(0xff8C8C8C).withOpacity(0.28),
                  child: const Center(
                    child: Icon(
                      Icons.add_shopping_cart_outlined,
                      color: Color(0xffD70B18),
                      size: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
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
                        'اشتري الآن',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> favorite() async {
    bool status = await FavoritesApiController().favorite(
      context,
      id: widget.homeProduct.id.toString(),
    );

    if (status) {
      setState(() {});
    }
  }
}
