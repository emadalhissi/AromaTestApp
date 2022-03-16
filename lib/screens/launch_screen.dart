import 'package:aroma_test_app/API/Controllers/auth_api_controller.dart';
import 'package:aroma_test_app/API/Controllers/splash_controller.dart';
import 'package:aroma_test_app/DB/controllers/splash_cities_db_controller.dart';
import 'package:aroma_test_app/DB/controllers/splash_countries_db_controller.dart';
import 'package:aroma_test_app/Providers/splash_provider.dart';
import 'package:aroma_test_app/models/API%20Models/Splash/splash_data.dart';
import 'package:aroma_test_app/screens/auth/login_screen.dart';
import 'package:aroma_test_app/screens/intro_screen.dart';
import 'package:aroma_test_app/shared_preferences/shared_preferences_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  final SplashCountriesDbController splashCountriesDbController =
      SplashCountriesDbController();
  final SplashCitiesDbController splashCitiesDbController =
      SplashCitiesDbController();

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
      await splashData();
      if (SharedPreferencesController().checkFirstVisit == true) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const IntroScreen()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    } else {
      print('status not true from register');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const IntroScreen(),
        ),
      );
    }
  }

  Future<void> splashData() async {
    print('splashData inside');
    var countries = await SplashController().getSplashCountries(context);
    if (countries.isNotEmpty) {
      print('countries.isNotEmpty');
      Provider.of<SplashProvider>(context, listen: false)
          .setCountriesList_(list: countries);
    }
    var countryCodes = await SplashController().getSplashCountryCodes(context);
    if (countryCodes.isNotEmpty) {
      print('countryCodes.isNotEmpty');
      Provider.of<SplashProvider>(context, listen: false)
          .setCountryCodesList_(list: countryCodes);
    }
    var currencies = await SplashController().getSplashCurrencies(context);
    if (currencies.isNotEmpty) {
      print('currencies.isNotEmpty');
      Provider.of<SplashProvider>(context, listen: false)
          .setCurrenciesList_(list: currencies);
    }
    var socialMedia = await SplashController().getSplashSocialMedia(context);
    if (socialMedia.isNotEmpty) {
      print('socialMedia.isNotEmpty');
      Provider.of<SplashProvider>(context, listen: false)
          .setSocialMediaList_(list: socialMedia);
    }
    var pages = await SplashController().getSplashPages(context);
    if (pages.isNotEmpty) {
      print('pages.isNotEmpty');
      Provider.of<SplashProvider>(context, listen: false)
          .setPagesList_(list: pages);
    }
    SharedPreferencesController().setSliderDownloaded(downloaded: false);
    SharedPreferencesController().setCategoriesDownloaded(downloaded: false);
    print('END SPLASH');
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
