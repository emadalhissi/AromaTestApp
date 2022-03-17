import 'dart:math';

import 'package:aroma_test_app/API/Controllers/auth_api_controller.dart';
import 'package:aroma_test_app/Helpers/snakbar.dart';
import 'package:aroma_test_app/Providers/favorites_provider.dart';
import 'package:aroma_test_app/Providers/splash_provider.dart';
import 'package:aroma_test_app/models/API%20Models/Activate/activate_base.dart';
import 'package:aroma_test_app/models/API%20Models/Register%20User/register_user.dart';
import 'package:aroma_test_app/screens/main_screen.dart';
import 'package:aroma_test_app/shared_preferences/shared_preferences_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:intl_phone_field/countries.dart' as phone_countries;
import 'package:sms_autofill/sms_autofill.dart';
// import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SnackBarHelper, CodeAutoFill {
  late TextEditingController mobileEditingController;
  late TextEditingController emailEditingController;
  late TextEditingController otpCodeEditingController;
  late TextEditingController searchEditingController;

  String loginWith = 'mobile';
  bool sendButtonClicked = false;
  bool policyChecked = false;

  // String code = '';

  phone_countries.Country selectedCountry = phone_countries.countries
      .firstWhere((element) => element.dialCode == '970');
  bool showCountriesList = false;
  List<phone_countries.Country> searchedCountries = <phone_countries.Country>[];

  @override
  void initState() {
    SmsAutoFill().listenForCode();
    SmsAutoFill().getAppSignature.then((signature) {
      setState(() {
        final appSignature = signature;
        print('appSignature ===> $appSignature');
        SharedPreferencesController().setAppSignature(appSignature: signature);
      });
    });

    super.initState();
    mobileEditingController = TextEditingController();
    emailEditingController = TextEditingController();
    otpCodeEditingController = TextEditingController();
    searchEditingController = TextEditingController();
    // codeUpdated();
    // _listenOtp();
  }

  @override
  void codeUpdated() {
    // TODO: implement codeUpdated
    setState(() {
      otpCodeEditingController.text = code!;
      print('---code---');
      print(code);
    });
    // verifyOtp(code);
  }

  // void _listenOtp() async {
  //   print('inside _listenOtp, before');
  //   await SmsAutoFill().listenForCode();
  //   print('inside _listenOtp, after');

  // }

  @override
  void dispose() {
    mobileEditingController.dispose();
    emailEditingController.dispose();
    otpCodeEditingController.dispose();
    searchEditingController.dispose();
    cancel();
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image(
              image: AssetImage(
                loginWith == 'mobile'
                    ? 'images/SLIDE_02.png'
                    : 'images/intro_bg_1.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xff171717).withOpacity(0.8150),
                  const Color(0xff3F3F3F).withOpacity(0.8150),
                  const Color(0xff171717).withOpacity(0.8150),
                ],
              ),
            ),
          ),
          CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                    bottom: 30,
                    top: 60,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 70),
                        const Image(image: AssetImage('images/aromalogow.png')),
                        const SizedBox(height: 85),
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cairo',
                            ),
                            children: [
                              TextSpan(
                                style: TextStyle(color: Color(0xffD6111E)),
                                text: 'تس',
                              ),
                              TextSpan(text: 'جيل الدخول'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'بواسطة',
                          style: TextStyle(
                            color: Color(0xffBCBCBC),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    loginWith = 'mobile';
                                    sendButtonClicked = false;
                                    mobileEditingController.text = '';
                                    emailEditingController.text = '';
                                    otpCodeEditingController.text = '';
                                  });
                                },
                                child: Container(
                                  height: 48,
                                  decoration: loginWith == 'mobile'
                                      ? BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(21),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xffD6111E),
                                              Color(0xff970810),
                                            ],
                                          ),
                                        )
                                      : BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(21),
                                          color: const Color(0xff7B7B81)
                                              .withOpacity(0.5750),
                                        ),
                                  child: const Center(
                                    child: Text(
                                      'رقم الجوال',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    loginWith = 'email';
                                    sendButtonClicked = false;
                                    mobileEditingController.text = '';
                                    emailEditingController.text = '';
                                    otpCodeEditingController.text = '';
                                  });
                                },
                                child: Container(
                                  height: 48,
                                  decoration: loginWith == 'email'
                                      ? BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(21),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xffD6111E),
                                              Color(0xff970810),
                                            ],
                                          ),
                                        )
                                      : BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(21),
                                          color: const Color(0xff7B7B81)
                                              .withOpacity(0.5750),
                                        ),
                                  child: const Center(
                                    child: Text(
                                      'البريد الالكتروني',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 48,
                          child: loginWith == 'mobile'
                              ? TextField(
                                  controller: mobileEditingController,
                                  cursorHeight: 5,
                                  showCursor: false,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    suffixIconColor: Colors.grey,
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: InkWell(
                                        onTap: () {
                                          if (showCountriesList == false) {
                                            setState(() {
                                              showCountriesList = true;
                                            });
                                          } else {
                                            setState(() {
                                              showCountriesList = false;
                                            });
                                          }
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.grey,
                                            ),
                                            Text(selectedCountry.dialCode),
                                            const Text('+'),
                                            const SizedBox(width: 8),
                                            Image.asset(
                                              'assets/flags/${selectedCountry.code.toLowerCase()}.png',
                                              package: 'intl_phone_field',
                                              width: 32,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // suffixIcon: DropdownButton<String>(
                                    //   underline: const SizedBox.shrink(),
                                    //   alignment: Alignment.centerLeft,
                                    //   value: dropdownButtonDialCode,
                                    //   onChanged: (String? newValue) {
                                    //     setState(() {
                                    //       dropdownButtonDialCode = newValue!;
                                    //     });
                                    //     print(dropdownButtonDialCode);
                                    //   },
                                    //   items:
                                    //       phone_countries.countries.map((country_) {
                                    //     return DropdownMenuItem(
                                    //       onTap: (){
                                    //         setState(() {
                                    //           dropdownButtonFlag = country_.code;
                                    //         });
                                    //       },
                                    //       child: Row(
                                    //         mainAxisAlignment: MainAxisAlignment.end,
                                    //         children: [
                                    //           Text(country_.dialCode),
                                    //           const Text('+'),
                                    //           const SizedBox(width: 8),
                                    //           Image.asset(
                                    //             'assets/flags/${country_.code.toLowerCase()}.png',
                                    //             package: 'intl_phone_field',
                                    //             width: 32,
                                    //           ),
                                    //         ],
                                    //       ),
                                    //       value: country_.dialCode,
                                    //     );
                                    //   }).toList(),
                                    // ),
                                    // prefixIcon: DropdownButton<String>(
                                    //   value: dropdownButtonValue,
                                    //   onChanged: (String? newValue) {
                                    //     setState(() {
                                    //       dropdownButtonValue = newValue!;
                                    //     });
                                    //   },
                                    //   items: Provider.of<SplashProvider>(context,
                                    //           listen: false)
                                    //       .countryCodes_
                                    //       .map((countryCode) {
                                    //     return DropdownMenuItem(
                                    //       child: Text('+${countryCode.prefix!}'),
                                    //       value: countryCode.prefix,
                                    //     );
                                    //   }).toList(),
                                    // ),
                                    hintText: 'رقم الجوال',
                                    hintStyle: const TextStyle(
                                      color: Color(0xff8C8C8C),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(22),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(22),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
                                    ),
                                  ),
                                )
                              : TextField(
                                  controller: emailEditingController,
                                  cursorHeight: 5,
                                  showCursor: false,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    hintText: 'البريد الالكتروني',
                                    hintStyle: const TextStyle(
                                      color: Color(0xff8C8C8C),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(22),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(22),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
                                    ),
                                  ),
                                ),
                        ),
                        sendButtonClicked
                            ? const SizedBox(height: 20)
                            : const SizedBox.shrink(),
                        sendButtonClicked
                            ? TextFieldPinAutoFill(
                                // controller: otpCodeEditingController,
                                // cursorHeight: 5,
                                // showCursor: false,
                                // keyboardType: TextInputType.number,

                                codeLength: 6,
                                currentCode: code,

                                decoration: InputDecoration(
                                  counter: const SizedBox.shrink(),
                                  hintText: 'كود التحقق',
                                  hintStyle: const TextStyle(
                                    color: Color(0xff8C8C8C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(22),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(22),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        sendButtonClicked
                            ? const SizedBox(height: 12)
                            : const SizedBox.shrink(),
                        sendButtonClicked
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: policyChecked,
                                    onChanged: (newValue) {
                                      setState(() {
                                        policyChecked = newValue!;
                                      });
                                    },
                                    activeColor: const Color(0xffD6111E),
                                    checkColor: const Color(0xffD6111E),
                                    side: MaterialStateBorderSide.resolveWith(
                                        (states) => const BorderSide(
                                            color: Colors.white)),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Cairo',
                                        ),
                                        children: [
                                          const TextSpan(
                                              text:
                                                  'عند تسجيل الدخول ، أنت توافق على '),
                                          TextSpan(
                                            text: 'الشروط والأحكام ',
                                            style: const TextStyle(
                                                color: Color(0xffD6111E)),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                print('الشروط والأحكام ');
                                              },
                                          ),
                                          const TextSpan(text: 'و '),
                                          TextSpan(
                                              text: 'سياسة الخصوصية',
                                              style: const TextStyle(
                                                  color: Color(0xffD6111E)),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () =>
                                                    print('سياسة الخصوصية')),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
                        const SizedBox(height: 20),
                        !sendButtonClicked
                            ? InkWell(
                                onTap: () async {
                                  await performSend();
                                },
                                child: Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(21),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xffD6111E),
                                        Color(0xff970810),
                                      ],
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'ارسال',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () async {
                                  await performLogin();
                                },
                                child: Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(21),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xffD6111E),
                                        Color(0xff970810),
                                      ],
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'تسجيل الدخول',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        sendButtonClicked
                            ? const SizedBox(height: 30)
                            : const SizedBox.shrink(),
                        sendButtonClicked
                            ? InkWell(
                                onTap: () {},
                                child: const Text(
                                  'اعادة ارسال الكود',
                                  style: TextStyle(
                                    color: Color(0xff8C8C8C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          showCountriesList == true
              ? PositionedDirectional(
                  top: 100,
                  end: 20,
                  child: Container(
                    width: 200,
                    height: MediaQuery.of(context).size.height - 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(
                              controller: searchEditingController,
                              onChanged: (searchText) {
                                setState(() {
                                  searchedCountries.clear();
                                  for (int i = 0;
                                      i < phone_countries.countries.length;
                                      i++) {
                                    if (phone_countries.countries[i].name
                                            .toLowerCase()
                                            .contains(
                                                searchText.toLowerCase()) ||
                                        phone_countries.countries[i].dialCode
                                            .contains(
                                                searchText.toLowerCase())) {
                                      searchedCountries
                                          .add(phone_countries.countries[i]);
                                    }
                                  }
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: 'ابحث',
                              ),
                            ),
                          ),
                          ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            children: searchedCountries.isNotEmpty ||
                                    searchEditingController.text.isNotEmpty
                                ? searchedCountries
                                    .map(
                                      (country_) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 5,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedCountry = country_;
                                              showCountriesList = false;
                                            });
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(country_.dialCode),
                                              const Text('+'),
                                              const SizedBox(width: 8),
                                              Image.asset(
                                                'assets/flags/${country_.code.toLowerCase()}.png',
                                                package: 'intl_phone_field',
                                                width: 32,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList()
                                : phone_countries.countries
                                    .map(
                                      (country_) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 5,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedCountry = country_;
                                              showCountriesList = false;
                                            });
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(country_.dialCode),
                                              const Text('+'),
                                              const SizedBox(width: 8),
                                              Image.asset(
                                                'assets/flags/${country_.code.toLowerCase()}.png',
                                                package: 'intl_phone_field',
                                                width: 32,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Future<void> performSend() async {
    if (checkDataBefore()) {
      await sendMobile();
      await sendEmail();
    }
  }

  Future<void> performLogin() async {
    if (checkDataAfter()) {
      await checkOTP();

    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ),
    );
  }

  Future<void> sendMobile() async {
    // final signature = await SmsAutoFill().getAppSignature;
    // print('signature => $signature');
    // await SmsAutoFill().listenForCode;
    RegisterUser? registerUser = await AuthApiController().registerWithMobile(
      context,
      mobile: '+' + selectedCountry.dialCode + mobileEditingController.text,
    );
    if (registerUser != null) {
      print('OTP => ${registerUser.data!.user!.activeCode}');
    }
  }

  Future<void> sendEmail() async {
    RegisterUser? registerUser = await AuthApiController().registerWithEmail(
      context,
      email: emailEditingController.text,
    );
    if (registerUser != null) {
      print('OTP => ${registerUser.data!.user!.activeCode}');
    }
  }

  Future<void> checkOTP() async {
    ActivateBase? activateBase = await AuthApiController().activate(
      context,
      code: code!,
      // code: otpCodeEditingController.text,
    );

    if (activateBase != null) {
      SharedPreferencesController()
          .setToken(token: activateBase.activateData!.token!);

      SharedPreferencesController().saveLoggedIn();
 Provider.of<FavoritesProvider>(context, listen: false).getFavorites_();
      // PageRouteBuilder(
      //                 transitionsBuilder:
      //                     (context, animation, secondaryAnimation, child) {
      //                   return ScaleTransition(
      //                     alignment: Alignment.center,
      //                     scale: Tween<double>(begin: 0.1, end: 1).animate(
      //                       CurvedAnimation(
      //                         parent: animation,
      //                         curve: Curves.bounceIn,
      //                       ),
      //                     ),
      //                     child: child,
      //                   );
      //                 },
      //                 transitionDuration: Duration(seconds: 2),
      //                 pageBuilder: (BuildContext context,
      //                     Animation<double> animation,
      //                     Animation<double> secondaryAnimation) {
      //                   return FinalScreen();
      //                 },
      //               ),
      //             );
    }
  }

  bool checkDataBefore() {
    if (loginWith == 'mobile' && mobileEditingController.text.isNotEmpty) {
      setState(() {
        sendButtonClicked = true;
      });
      return true;
    } else if (loginWith == 'email' && emailEditingController.text.isNotEmpty) {
      setState(() {
        sendButtonClicked = true;
      });
      return true;
    } else {
      showSnackBar(
        context,
        message: 'يرجى ادخال البيانات المطلوبة',
        error: true,
      );
      return false;
    }
  }

  bool checkDataAfter() {
    if (checkDataBefore() && otpCodeEditingController.text.isEmpty) {
      // showSnackBar(
      //   context,
      //   message: 'يرجى ادخال كود التحقق',
      //   error: true,
      // );
      return false;
    } else if (policyChecked == false) {
      showSnackBar(
        context,
        message: 'يجب الموافقة على السياسات',
        error: true,
      );
      return false;
    }
    return true;
  }
}
