class SplashCity {
  late int? id;
  late String? title;

  late int? dbId;
  late int? countryId;

  // SplashCity({
  //   required this.id,
  //   required this.title,
  // });

  SplashCity.fromMap(Map<String, dynamic> json) {
    dbId = json['dbId'];
    id = json['id'];
    title = json['title'];
    countryId = json['countryId'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['countryId'] = countryId;
    return data;
  }

  SplashCity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}
