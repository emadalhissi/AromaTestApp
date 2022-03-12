class HomeRate {
  late int? id;
  late int? userId;
  late int? productId;
  late int? rValue;
  late String? rNote;
  late String? createdAt;
  late String? updatedAt;
  late int? isActive;

  // HomeRate({
  //   required this.id,
  //   required this.userId,
  //   required this.productId,
  //   required this.rValue,
  //   required this.rNote,
  //   required this.createdAt,
  //   required this.updatedAt,
  //   required this.isActive,
  // });

  HomeRate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    rValue = json['r_value'];
    rNote = json['r_note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['r_value'] = rValue;
    data['r_note'] = rNote;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_active'] = isActive;
    return data;
  }
}
