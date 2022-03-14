import 'package:aroma_test_app/models/API%20Models/Splash/splash_country.dart';
import 'package:aroma_test_app/models/API%20Models/Splash/splash_country_code.dart';
import 'package:aroma_test_app/models/API%20Models/Splash/splash_currency.dart';
import 'package:aroma_test_app/models/API%20Models/Splash/splash_page.dart';
import 'package:aroma_test_app/models/API%20Models/Splash/splash_social_media.dart';
import 'package:aroma_test_app/shared_preferences/shared_preferences_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  List<SplashCountry> countries_ = <SplashCountry>[];
  List<SplashCountryCode> countryCodes_ = <SplashCountryCode>[];
  List<SplashCurrency> currencies_ = <SplashCurrency>[];
  List<SplashSocialMedia> socialMedia_ = <SplashSocialMedia>[];
  List<SplashPage> pages_ = <SplashPage>[];

  void setCountriesList_({required List<SplashCountry> list}) {
    countries_ = list;
    notifyListeners();
  }

  void clearCountriesList_() {
    countries_.clear();
    notifyListeners();
  }

  void setCountryCodesList_({required List<SplashCountryCode> list}) {
    countryCodes_ = list;
    notifyListeners();
  }

  void clearCountryCodesList_() {
    countryCodes_.clear();
    notifyListeners();
  }

  void setCurrenciesList_({required List<SplashCurrency> list}) {
    currencies_ = list;
    notifyListeners();
  }

  void clearCurrenciesList_() {
    currencies_.clear();
    notifyListeners();
  }

  void setSocialMediaList_({required List<SplashSocialMedia> list}) {
    socialMedia_ = list;
    notifyListeners();
  }

  void clearSocialMediaList_() {
    socialMedia_.clear();
    notifyListeners();
  }

  void setPagesList_({required List<SplashPage> list}) {
    pages_ = list;
    notifyListeners();
  }

  void clearPagesList_() {
    pages_.clear();
    notifyListeners();
  }
}
