class Favorite {
  late int? isFav;

  // Favorite({
  //   required this.isFav,
  // });

  Favorite.fromJson(Map<String, dynamic> json) {
    isFav = json['is_fav'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_fav'] = isFav;

    return data;
  }
}
