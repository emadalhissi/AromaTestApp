import 'package:aroma_test_app/models/API%20Models/Activate/activate_data.dart';

class ActivateBase {
  late bool? status;
  late String? message;
  late ActivateData? activateData;

  // ActivateBase({
  //   required this.status,
  //   required this.message,
  //   required this.data,
  // });

  ActivateBase.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    activateData =
        json['data'] != null ? ActivateData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (activateData != null) {
      data['data'] = activateData!.toJson();
    }
    return data;
  }
}
