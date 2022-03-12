import 'package:aroma_test_app/models/API%20Models/Splash/splash_currency.dart';

class SplashUser {
  late int? id;
  late String? image;
  late String? name;
  late String? email;
  late String? mobile;
  late String? countryCode;
  late SplashCurrency? currency;
  late String? language;
  late bool? isNotify;
  late bool? isGuest;
  late String? activeCode;
  late bool? isActive;
  late int? authType;
  late String? address;

  // SplashUser({
  //   required this.id,
  //   required this.image,
  //   required this.name,
  //   required this.email,
  //   required this.mobile,
  //   required this.countryCode,
  //   required this.currency,
  //   required this.language,
  //   required this.isNotify,
  //   required this.isGuest,
  //   required this.activeCode,
  //   required this.isActive,
  //   required this.authType,
  //   required this.address,
  // });

  SplashUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    countryCode = json['country_code'];
    currency = json['currency'] != null
        ? SplashCurrency.fromJson(json['currency'])
        : null;
    language = json['language'];
    isNotify = json['is_notify'];
    isGuest = json['is_guest'];
    activeCode = json['active_code'];
    isActive = json['is_active'];
    authType = json['auth_type'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['country_code'] = countryCode;
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    data['language'] = language;
    data['is_notify'] = isNotify;
    data['is_guest'] = isGuest;
    data['active_code'] = activeCode;
    data['is_active'] = isActive;
    data['auth_type'] = authType;
    data['address'] = address;
    return data;
  }
}
