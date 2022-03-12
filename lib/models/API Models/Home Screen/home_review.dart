class HomeReview {
  late int? id;
  late String? userName;
  late String? description;
  late String? image;
  late int? rate;
  late String? addDate;

  // HomeReview({
  //   required this.id,
  //   required this.userName,
  //   required this.description,
  //   required this.image,
  //   required this.rate,
  //   required this.addDate,
  // });

  HomeReview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    description = json['description'];
    image = json['image'];
    rate = json['rate'];
    addDate = json['add_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = userName;
    data['description'] = description;
    data['image'] = image;
    data['rate'] = rate;
    data['add_date'] = addDate;
    return data;
  }
}
