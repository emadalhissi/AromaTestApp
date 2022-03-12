import 'package:aroma_test_app/models/API%20Models/Register%20User/register_user_data.dart';

class RegisterUser {
  late bool? status;
  late String? message;
  late RegisterUserData? data;

  // RegisterUser({
  //   required this.status,
  //   required this.message,
  //   required this.data,
  // });

  RegisterUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? RegisterUserData.fromJson(json['data']) : null;
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
