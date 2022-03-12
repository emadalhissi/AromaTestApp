import 'dart:math';

import 'package:aroma_test_app/API/Controllers/auth_api_controller.dart';
import 'package:aroma_test_app/Helpers/snakbar.dart';
import 'package:aroma_test_app/models/API%20Models/Activate/activate_base.dart';
import 'package:aroma_test_app/models/API%20Models/Register%20User/register_user.dart';
import 'package:aroma_test_app/screens/main_screen.dart';
import 'package:aroma_test_app/shared_preferences/shared_preferences_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SnackBarHelper {
  late TextEditingController mobileEditingController;
  late TextEditingController emailEditingController;
  late TextEditingController otpCodeEditingController;

  String loginWith = 'mobile';
  bool sendButtonClicked = false;
  bool policyChecked = false;

  @override
  void initState() {
    super.initState();
    mobileEditingController = TextEditingController();
    emailEditingController = TextEditingController();
    otpCodeEditingController = TextEditingController();
  }

  @override
  void dispose() {
    mobileEditingController.dispose();
    emailEditingController.dispose();
    otpCodeEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          Padding(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
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
                                    borderRadius: BorderRadius.circular(21),
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
                                    borderRadius: BorderRadius.circular(21),
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
                                    borderRadius: BorderRadius.circular(21),
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
                                    borderRadius: BorderRadius.circular(21),
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
                              hintText: 'رقم الجوال',
                              hintStyle: const TextStyle(
                                color: Color(0xff8C8C8C),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22),
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
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22),
                              ),
                            ),
                          ),
                  ),
                  sendButtonClicked
                      ? const SizedBox(height: 20)
                      : const SizedBox.shrink(),
                  sendButtonClicked
                      ? TextField(
                          controller: otpCodeEditingController,
                          cursorHeight: 5,
                          showCursor: false,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'كود التحقق',
                            hintStyle: const TextStyle(
                              color: Color(0xff8C8C8C),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22),
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
                                  (states) =>
                                      const BorderSide(color: Colors.white)),
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
                                          ..onTap =
                                              () => print('سياسة الخصوصية')),
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
  }

  Future<void> sendMobile() async {
    RegisterUser? registerUser = await AuthApiController().registerWithMobile(
      context,
      mobile: '+970' + mobileEditingController.text,
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
      code: otpCodeEditingController.text,
    );
    if (activateBase != null) {
      SharedPreferencesController()
          .setToken(token: activateBase.activateData!.token!);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      );
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
      showSnackBar(
        context,
        message: 'يرجى ادخال كود التحقق',
        error: true,
      );
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
