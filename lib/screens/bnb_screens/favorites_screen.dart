
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:

      Shimmer(
        gradient: LinearGradient(
          colors: [
            Colors.grey.shade300,
            Colors.grey.shade100,
            Colors.grey.shade300,
            Colors.grey.shade100,
          ],
        ),
        enabled: true,
        child: Container(
            width: 400,
            height: 200,
            color: Colors.black,
          ),
        ),

    );
  }
}


