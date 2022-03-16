import 'package:aroma_test_app/API/Controllers/favorites_api_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomePageGridViewItem extends StatefulWidget {
  final String id;
  final String image;
  final String name;
  final String info;
  final String price;
  final String description;
  final bool isFavorite;

  const HomePageGridViewItem({
    required this.id,
    required this.image,
    required this.name,
    required this.info,
    required this.price,
    required this.description,
    required this.isFavorite,
    Key? key,
  }) : super(key: key);

  @override
  State<HomePageGridViewItem> createState() => _HomePageGridViewItemState();
}

class _HomePageGridViewItemState extends State<HomePageGridViewItem> {
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
                    image: CachedNetworkImageProvider(widget.image),
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
                      widget.name,
                      style: const TextStyle(
                        color: Color(0xff171717),
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.info,
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
                          widget.price,
                          style: const TextStyle(
                            color: Color(0xff970810),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 2),
                        const Text(
                          'ر.س',
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
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () async {
                await favorite();
              },
              child: CircleAvatar(
                radius: 18,
                backgroundColor: const Color(0xffC3C3C3),
                child: Center(
                  child: Icon(
                    Icons.favorite,
                    color: widget.isFavorite
                        ? const Color(0xffD4000C)
                        : const Color(0xffE2E2E2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> favorite() async {
    bool status = await FavoritesApiController().favorite(
      context,
      id: widget.id,
    );

    if (status) {
      setState(() {});
    }
  }
}
