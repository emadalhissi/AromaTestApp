import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 80,
            color: Colors.grey,
          ),
          // SizedBox(height: 20),
          // Text(
          //   'Empty Cart!',
          //   style: TextStyle(
          //     fontSize: 22,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.grey,
          //   ),
          // ),
        ],
      ),
    );
  }
}
