import 'package:flutter/material.dart';


class NewWidget extends StatelessWidget implements PreferredSizeWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
