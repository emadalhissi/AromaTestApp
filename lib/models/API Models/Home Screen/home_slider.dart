class HomeSlider {
  late int? id;
  late String? title;
  late String? image;

  // HomeSlider({
  //   required this.id,
  //   required this.title,
  //   required this.image,
  // });

  HomeSlider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    return data;
  }
}
