import 'package:aroma_test_app/models/API%20Models/Splash/splash_country.dart';
import 'package:aroma_test_app/models/API%20Models/Splash/splash_country_code.dart';
import 'package:aroma_test_app/models/API%20Models/Splash/splash_currency.dart';
import 'package:aroma_test_app/models/API%20Models/Splash/splash_page.dart';
import 'package:aroma_test_app/models/API%20Models/Splash/splash_social_media.dart';
import 'package:aroma_test_app/models/API%20Models/Splash/splash_user.dart';

class SplashData {
  late List<SplashCountry>? countries;
  late List<SplashCountryCode>? countryCodes;
  late List<SplashCurrency>? currencies;
  late SplashUser? user;
  late List<SplashSocialMedia>? socialMedia;
  late List<SplashPage>? pages;
  late String? htw;
  late int? cartCount;
  late int? notificationCount;

  // SplashData({
  //   required this.countries,
  //   required this.countryCodes,
  //   required this.currencies,
  //   required this.user,
  //   required this.socialMedia,
  //   required this.pages,
  //   required this.htw,
  //   required this.cartCount,
  //   required this.notificationCount,
  // });

  SplashData.fromJson(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = <SplashCountry>[];
      json['countries'].forEach((v) {
        countries!.add(SplashCountry.fromJson(v));
      });
    }
    if (json['country_codes'] != null) {
      countryCodes = <SplashCountryCode>[];
      json['country_codes'].forEach((v) {
        countryCodes!.add(SplashCountryCode.fromJson(v));
      });
    }
    if (json['currencies'] != null) {
      currencies = <SplashCurrency>[];
      json['currencies'].forEach((v) {
        currencies!.add(SplashCurrency.fromJson(v));
      });
    }
    user = json['user'] != null ? SplashUser.fromJson(json['user']) : null;
    if (json['social_media'] != null) {
      socialMedia = <SplashSocialMedia>[];
      json['social_media'].forEach((v) {
        socialMedia!.add(SplashSocialMedia.fromJson(v));
      });
    }
    if (json['pages'] != null) {
      pages = <SplashPage>[];
      json['pages'].forEach((v) {
        pages!.add(SplashPage.fromJson(v));
      });
    }
    htw = json['htw'];
    cartCount = json['cart_count'];
    notificationCount = json['notification_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (countries != null) {
      data['countries'] = countries!.map((v) => v.toJson()).toList();
    }
    if (countryCodes != null) {
      data['country_codes'] = countryCodes!.map((v) => v.toJson()).toList();
    }
    if (currencies != null) {
      data['currencies'] = currencies!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (socialMedia != null) {
      data['social_media'] = socialMedia!.map((v) => v.toJson()).toList();
    }
    if (pages != null) {
      data['pages'] = pages!.map((v) => v.toJson()).toList();
    }
    data['htw'] = htw;
    data['cart_count'] = cartCount;
    data['notification_count'] = notificationCount;
    return data;
  }
}
