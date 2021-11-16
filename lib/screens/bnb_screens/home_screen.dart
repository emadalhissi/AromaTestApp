import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageSlideshow(
              width: 335,
              height: 200,
              // autoPlayInterval: 1,
              isLoop: true,
              autoPlayInterval: 0,
              indicatorColor: Colors.transparent,
              indicatorBackgroundColor: Colors.transparent,
              children: [
                Image(
                  image: NetworkImage(
                      'https://www.browserstack.com/blog/content/images/2019/06/MobileAppTesting_MainVisual-2.png'),
                ),
                Image(
                  image: NetworkImage(
                      'https://marvel-b1-cdn.bc0a.com/f00000000131077/www.perfecto.io/sites/perfecto/files/image/2020-08/image-blog-perfecto-mobile-app-checklist.jpg'),
                ),
                Image(
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxaVA0bZzW-qsL32vqFEkyOxcGeuVplaJNwKzndwCi0AHc8b6CuSAYHauPlczvdFn5sqk&usqp=CAU'),
                ),
              ],
            ),
            Expanded(child: Center())
          ],
        ),
      ),
    );
  }
}
