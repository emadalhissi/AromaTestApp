class SplashSocialMedia {
  late int? id;
  late String? key;
  late String? value;

  // SplashSocialMedia({
  //   required this.id,
  //   required this.key,
  //   required this.value,
  // });

  SplashSocialMedia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}
