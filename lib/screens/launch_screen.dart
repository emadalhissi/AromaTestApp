import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/intro_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffB9272D),
      body: Stack(
        children: [
          Positioned(
            width: 570,
            height: 570,
            top: -236,
            // left: -149,
            child: Image.asset(
              'images/1.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            width: 570,
            height: 570,
            top: 334,
            // left: -149,
            child: Image.asset(
              'images/2.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: double.infinity,
            color: const Color(0xff970810).withOpacity(0.50),
          ),
          const Center(
            child: Image(
              image: AssetImage('images/aroma_logo_.png'),
              height: 80,
            ),
          ),
        ],
      ),
    );
  }
}
