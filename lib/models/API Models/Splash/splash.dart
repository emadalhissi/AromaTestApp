import 'package:aroma_test_app/models/API%20Models/Splash/splash_data.dart';

class Splash {
  late bool? status;
  late String? message;
  late SplashData? data;

  // Splash({
  //   required this.status,
  //   required this.message,
  //   required this.data,
  // });

  Splash.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? SplashData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
