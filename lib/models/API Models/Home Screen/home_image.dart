class HomeImage {
  late int? id;
  late String? image;
  late bool? isDefault;

  // HomeImage({
  //   required this.id,
  //   required this.image,
  //   required this.isDefault,
  // });

  HomeImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    isDefault = json['is_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['is_default'] = isDefault;
    return data;
  }
}
