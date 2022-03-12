import 'package:aroma_test_app/models/API%20Models/Register%20User/user.dart';

class RegisterUserData {
  late User? user;

  // RegisterUserData({
  //   required this.user,
  // });

  RegisterUserData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
