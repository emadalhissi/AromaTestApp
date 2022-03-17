import 'package:aroma_test_app/models/API%20Models/Cart/cart_data.dart';

class FullCartModel {
 late bool? status;
 late String? message;
 late CartDataModel? cartDataModel;

  // FullCartModel({
  //   required this.status,
  //   required this.message,
  //   required this.data,
  // });

  FullCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    cartDataModel = json['data'] != null ? CartDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] =message;
    if (cartDataModel != null) {
      data['data'] = cartDataModel!.toJson();
    }
    return data;
  }
}
