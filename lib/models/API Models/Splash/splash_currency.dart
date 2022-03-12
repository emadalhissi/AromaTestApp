class SplashCurrency {
  late int? id;
  late String? name;
  late String? symbol;
  late num? exchangeRate;
  late String? icon;

  // SplashCurrency({
  //   required this.id,
  //   required this.name,
  //   required this.symbol,
  //   required this.exchangeRate,
  //   required this.icon,
  // });

  SplashCurrency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    exchangeRate = json['exchange_rate'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['exchange_rate'] = exchangeRate;
    data['icon'] = icon;
    return data;
  }
}
