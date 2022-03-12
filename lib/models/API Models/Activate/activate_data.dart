import 'package:aroma_test_app/models/API%20Models/Register%20User/user.dart';

class ActivateData {
  late String? token;
  late String? tokenType;
  late String? expiresAt;
  late User? user;

  // ActivateData({
  //   required this.token,
  //   required this.tokenType,
  //   required this.expiresAt,
  //   required this.user,
  // });

  ActivateData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    tokenType = json['token_type'];
    expiresAt = json['expires_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['token_type'] = tokenType;
    data['expires_at'] = expiresAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
