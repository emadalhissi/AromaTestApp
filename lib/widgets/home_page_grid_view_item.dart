import 'package:flutter/material.dart';

class HomePageGridViewItem extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final String price;
  const HomePageGridViewItem({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      // height: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 1.5,
            offset: const Offset(0, 0.5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(
                width: double.infinity,
                height: 170,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(6),
                    topLeft: Radius.circular(6),
                  ),
                  child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xff171717),
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      description,
                      style: const TextStyle(
                        color: Color(0xff8C8C8C),
                        fontWeight: FontWeight.normal,
                        fontSize: 8,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                            color: Color(0xff970810),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 2),
                        const Text(
                          'رس',
                          style: TextStyle(
                            color: Color(0xff970810),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.shopping_cart_outlined,
                          color: Color(0xff484848),
                          size: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xffC3C3C3),
              child: Center(
                child: Icon(
                  Icons.favorite,
                  color: Color(0xffD4000C),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
