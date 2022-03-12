class SplashPage {
  late int? id;
  late String? pKey;
  late String? title;
  late String? description;

  // SplashPage({
  //   required this.id,
  //   required this.pKey,
  //   required this.title,
  //   required this.description,
  // });

  SplashPage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pKey = json['p_key'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['p_key'] = pKey;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
