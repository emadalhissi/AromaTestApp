import 'package:aroma_test_app/models/API%20Models/Splash/splash_city.dart';

class SplashCountry {
  late int? dbId;
  late int? id;
  late String? title;
  late String? prefix;
  late String? code;
  late String? flag;
  late List<SplashCity>? cities;

  // SplashCountry({
  //   required this.id,
  //   required this.title,
  //   required this.prefix,
  //   required this.code,
  //   required this.flag,
  //   required this.cities,
  // });

  SplashCountry.fromMap(Map<String, dynamic> json) {
    dbId = json['dbId'];
    id = json['id'];
    title = json['title'];
    prefix = json['prefix'];
    code = json['code'];
    flag = json['flag'];
    cities = json['cities'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['prefix'] = prefix;
    data['code'] = code;
    data['flag'] = flag;
    data['cities'] = cities;
    return data;
  }

  SplashCountry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    prefix = json['prefix'];
    code = json['code'];
    flag = json['flag'];
    if (json['cities'] != null) {
      cities = <SplashCity>[];
      json['cities'].forEach((v) {
        cities!.add(SplashCity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['prefix'] = prefix;
    data['code'] = code;
    data['flag'] = flag;
    if (cities != null) {
      data['cities'] = cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
