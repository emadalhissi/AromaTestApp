import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/main_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffB9272D),
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
            color: Color(0xff73970810), // opacity added with (73) => 45%
            // decoration: BoxDecoration(),
            // child: Image.asset('images/A1.png'),
          ),
          Container(
            // height: 76,
            // width: 204,
            alignment: Alignment.center,
            child: Image.asset(
              'images/launch_logo.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
