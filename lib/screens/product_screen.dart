import 'package:aroma_test_app/widgets/product_screen_feedback_container.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
            Image(
              image: const AssetImage('images/app1.png'),
              width: MediaQuery.of(context).size.width,
              height: 380,
              fit: BoxFit.cover,
            ),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'ibo player',
                            style: TextStyle(
                              color: Color(0xff171717),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'شراء التطبيق لمدة سنه',
                            style: TextStyle(
                              color: Color(0xff8C8C8C),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
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
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
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
                      const Text(
                        '20',
                        style: TextStyle(
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
                      const Icon(
                        Icons.star,
                        color: Color(0xffFFB850),
                      ),
                      const Icon(
                        Icons.star,
                        color: Color(0xffFFB850),
                      ),
                      const Icon(
                        Icons.star,
                        color: Color(0xffFFB850),
                      ),
                      const Icon(
                        Icons.star,
                        color: Color(0xffFFB850),
                      ),
                      Icon(
                        Icons.star,
                        color: const Color(0xff262323).withOpacity(0.25),
                      ),
                      const SizedBox(width: 3),
                      const Text(
                        '4.5',
                        style: TextStyle(
                          color: Color(0xff171717),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 3),
                      const Text(
                        '(50 تقييم)',
                        style: TextStyle(
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
                  const Text(
                    'هذا التطبيق هو مشغل فقط للقنوات .. هذا السعر رسوم لشراء التطبيق بدون اشتراك قنوات',
                    style: TextStyle(
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
}
