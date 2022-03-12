import 'package:aroma_test_app/API/Controllers/auth_api_controller.dart';
import 'package:aroma_test_app/API/Controllers/splash_controller.dart';
import 'package:aroma_test_app/models/API%20Models/Splash/splash_data.dart';
import 'package:aroma_test_app/screens/intro_screen.dart';
import 'package:aroma_test_app/shared_preferences/shared_preferences_controller.dart';
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
    register();
    // Future.delayed(const Duration(seconds: 2), () {
    //   Navigator.pushReplacementNamed(context, '/intro_screen');
    // });
  }

  Future<void> register() async {
    bool status = await AuthApiController().register(context);

    if (status) {
      print('status true from register');
      await splashData();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const IntroScreen(),));
    } else {
      print('status not true from register');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const IntroScreen(),));
    }
  }

  Future<void> splashData() async {
    print('splashData inside');
    SplashData? splashData = await SplashController().getSplash(context);
    if(splashData != null) {
      print('splashData = >');
      print(splashData);
    }
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
