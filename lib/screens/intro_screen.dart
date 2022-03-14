import 'package:aroma_test_app/Providers/lang_provider.dart';
import 'package:aroma_test_app/main.dart';
import 'package:aroma_test_app/shared_preferences/shared_preferences_controller.dart';
import 'package:aroma_test_app/widgets/Intro%20Screen/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late PageController pageController;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                _index = index;
              });
            },
            controller: pageController,
            children: [
              IntroPage(
                image: 'intro_bg_1.png',
                title: AppLocalizations.of(context)!.intro_page1_title,
                subTitle: AppLocalizations.of(context)!.intro_page1_subTitle,
              ),
              IntroPage(
                image: 'intro_bg_2.png',
                title: AppLocalizations.of(context)!.intro_page2_title,
                subTitle: AppLocalizations.of(context)!.intro_page2_subTitle,
              ),
              IntroPage(
                image: 'intro_bg_3.png',
                title: AppLocalizations.of(context)!.intro_page3_title,
                subTitle: AppLocalizations.of(context)!.intro_page3_subTitle,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Provider.of<LangProvider>(context, listen: false)
                        .changeLang();
                    RestartWidget.restartApp(context);
                  },
                  child: Text(
                    Provider.of<LangProvider>(context, listen: false).lang ==
                            'ar'
                        ? 'EN'
                        : 'AR',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffD4000C),
                    minimumSize: const Size(70, 35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        _index == 2
                            ? goToLoginScreen()
                            : pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                      },
                      child: const Image(
                          image: AssetImage('images/intro__red.png')),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        goToLoginScreen();
                      },
                      child: Text(
                        AppLocalizations.of(context)!.skip,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff707070),
                        minimumSize: const Size(70, 35),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void goToLoginScreen() {
    Navigator.pushReplacementNamed(context, '/login_screen');
    SharedPreferencesController().setFirstVisit();
  }
}
