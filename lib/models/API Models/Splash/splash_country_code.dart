class SplashCountryCode {
  late int? id;
  late String? title;
  late String? prefix;
  late String? code;
  late String? flag;
  //
  // SplashCountryCode({
  //   required this.id,
  //   required this.title,
  //   required this.prefix,
  //   required this.code,
  //   required this.flag,
  // });

  SplashCountryCode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    prefix = json['prefix'];
    code = json['code'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['prefix'] = prefix;
    data['code'] = code;
    data['flag'] = flag;
    return data;
  }
}
