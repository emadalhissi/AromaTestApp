import 'dart:convert';

import 'package:aroma_test_app/API/api_helper.dart';
import 'package:aroma_test_app/API/api_settings.dart';
import 'package:aroma_test_app/Helpers/snakbar.dart';
import 'package:aroma_test_app/models/API%20Models/Activate/activate_base.dart';
import 'package:aroma_test_app/models/API%20Models/Register%20User/register_user.dart';
import 'package:aroma_test_app/shared_preferences/shared_preferences_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthApiController with ApiHelper, SnackBarHelper {
  Future<bool> register(BuildContext context) async {
    var url = Uri.parse(ApiSettings.register);
    var response = await http.post(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var token = jsonDecode(response.body)['data']['token'];

      SharedPreferencesController().setToken(token: token);
      return true;
    }
    return false;
  }

  Future<RegisterUser?> registerWithMobile(
    BuildContext context, {
    required String mobile,
  }) async {
    var url = Uri.parse(ApiSettings.registerWithMobile + mobile);
    var response = await http.post(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      RegisterUser registerUser =
          RegisterUser.fromJson(jsonDecode(response.body));
      return registerUser;
    }
    return null;
  }

  Future<RegisterUser?> registerWithEmail(
    BuildContext context, {
    required String email,
  }) async {
    var url = Uri.parse(ApiSettings.registerWithMobile + email);
    var response = await http.post(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      RegisterUser registerUser =
          RegisterUser.fromJson(jsonDecode(response.body));
      return registerUser;
    }
    return null;
  }

  Future<ActivateBase?> activate(
    BuildContext context, {
    required String code,
  }) async {
    var url = Uri.parse(ApiSettings.activate + code);
    var response = await http.post(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      ActivateBase? activateBase =
          ActivateBase.fromJson(jsonDecode(response.body));
      print(activateBase.message);
      return activateBase;
    } else if (response.statusCode == 422) {
      ActivateBase? activateBase =
          ActivateBase.fromJson(jsonDecode(response.body));
      showSnackBar(
        context,
        message: activateBase.message!,
        error: true,
      );
      return null;
    }
    return null;
  }
}
// class AuthApiController with ApiHelper, Helpers {
//   Future<bool> login(
//     BuildContext context, {
//     required String mobile,
//     required String password,
//   }) async {
//     var url = Uri.parse(ApiSettings.login);
//     var response = await http.post(
//       url,
//       body: {
//         'mobile': mobile,
//         'password': password,
//       },
//       headers: headers,
//     );
//     if (response.statusCode == 200) {
//       var baseApiResponse =
//           BaseApiObjectResponse<User>.fromJson(jsonDecode(response.body));
//       showSnackBar(context, message: baseApiResponse.message);
//       Map<String, dynamic> responseBodyData = jsonDecode(response.body)['data'];
//       if (responseBodyData.containsKey('token')) {
//         SharedPreferencesController()
//             .setToken(token: responseBodyData['token']);
//       }
//       return true;
//     } else if (response.statusCode == 400) {
//       var message = jsonDecode(response.body)['message'];
//       showSnackBar(
//         context,
//         message: message,
//         error: true,
//       );
//     } else {
//       showSnackBar(
//         context,
//         message: 'Something went wrong, please try again!',
//         error: true,
//       );
//     }
//     return false;
//   }
//
//   Future<bool> register(
//     BuildContext context, {
//     required User user,
//   }) async {
//     var url = Uri.parse(ApiSettings.register);
//     var response = await http.post(
//       url,
//       body: {
//         'name': user.name,
//         'mobile': user.mobile,
//         'password': user.password,
//         'gender': user.gender,
//         'STORE_API_KEY': ApiSettings.storeApiKey,
//         'city_id': user.cityId.toString(),
//       },
//       headers: headers,
//     );
//     if (response.statusCode == 201) {
//       var code = jsonDecode(response.body)['code'];
//       var baseApiResponse =
//           BaseApiObjectResponse<User>.fromJson(jsonDecode(response.body));
//       showSnackBar(context, message: baseApiResponse.message);
//       show_SnackBar(context, message: 'Verification code: $code');
//       print(code);
//       return true;
//     } else if (response.statusCode == 400) {
//       var message = jsonDecode(response.body)['message'];
//       showSnackBar(
//         context,
//         message: message,
//         error: true,
//       );
//     } else {
//       showSnackBar(
//         context,
//         message: 'Something went wrong, please try again!',
//         error: true,
//       );
//     }
//     return false;
//   }
//
//   Future<bool> activate(
//     BuildContext context, {
//     required String mobile,
//     required String code,
//   }) async {
//     var url = Uri.parse(ApiSettings.activate);
//     var response = await http.post(
//       url,
//       body: {
//         'mobile': mobile,
//         'code': code,
//       },
//       headers: headers,
//     );
//     if (response.statusCode == 200) {
//       var message = jsonDecode(response.body)['message'];
//       showSnackBar(
//         context,
//         message: message,
//       );
//       return true;
//     } else if (response.statusCode == 400) {
//       var message = jsonDecode(response.body)['message'];
//       showSnackBar(
//         context,
//         message: message,
//         error: true,
//       );
//     } else {
//       showSnackBar(
//         context,
//         message: 'Something went wrong, please try again!',
//         error: true,
//       );
//     }
//     return false;
//   }
//
//   Future<bool> forget(
//     BuildContext context, {
//     required String mobile,
//   }) async {
//     var url = Uri.parse(ApiSettings.forget);
//     var response = await http.post(
//       url,
//       body: {
//         'mobile': mobile,
//       },
//       headers: headers,
//     );
//     if (response.statusCode == 200) {
//       var message = jsonDecode(response.body)['message'];
//       var code = jsonDecode(response.body)['code'];
//       print(code);
//       showSnackBar(
//         context,
//         message: message,
//       );
//       return true;
//     } else if (response.statusCode == 400) {
//       var message = jsonDecode(response.body)['message'];
//       showSnackBar(
//         context,
//         message: message,
//         error: true,
//       );
//     } else {
//       showSnackBar(
//         context,
//         message: 'Something went wrong, please try again!',
//         error: true,
//       );
//     }
//     return false;
//   }
//
//   Future<bool> change(
//     BuildContext context, {
//     required String currentPassword,
//     required String newPassword,
//     required String repeatPassword,
//   }) async {
//     var url = Uri.parse(ApiSettings.change);
//     var response = await http.post(
//       url,
//       body: {
//         'current_password': currentPassword,
//         'new_password': newPassword,
//         'new_password_confirmation': repeatPassword,
//       },
//       headers: headers,
//     );
//
//     if (response.statusCode == 200) {
//       var message = jsonDecode(response.body)['message'];
//       showSnackBar(
//         context,
//         message: message,
//       );
//       return true;
//     } else if (response.statusCode == 400) {
//       var message = jsonDecode(response.body)['message'];
//       showSnackBar(
//         context,
//         message: message,
//         error: true,
//       );
//     } else {
//       showSnackBar(
//         context,
//         message: 'Something went wrong, please try again!',
//         error: true,
//       );
//     }
//     return false;
//   }
//
//   Future<bool> reset(
//     BuildContext context, {
//     required String mobile,
//     required String code,
//     required String password,
//     required String passwordConfirmation,
//   }) async {
//     var url = Uri.parse(ApiSettings.reset);
//     var response = await http.post(
//       url,
//       body: {
//         'mobile': mobile,
//         'code': code,
//         'password': password,
//         'password_confirmation': passwordConfirmation,
//       },
//       headers: headers,
//     );
//     if (response.statusCode == 200) {
//       var message = jsonDecode(response.body)['message'];
//       var code = jsonDecode(response.body)['code'];
//       showSnackBar(
//         context,
//         message: message,
//       );
//       print(code);
//       return true;
//     } else if (response.statusCode == 400) {
//       var message = jsonDecode(response.body)['message'];
//       showSnackBar(
//         context,
//         message: message,
//         error: true,
//       );
//     } else {
//       showSnackBar(
//         context,
//         message: 'Something went wrong, please try again!',
//         error: true,
//       );
//     }
//     return false;
//   }
//
//   Future<bool> logout() async {
//     var url = Uri.parse(ApiSettings.logout);
//     var response = await http.get(
//       url,
//       headers: headers,
//     );
//     if (response.statusCode == 200 || response.statusCode == 401) {
//       return true;
//     }
//     return false;
//   }
// }
