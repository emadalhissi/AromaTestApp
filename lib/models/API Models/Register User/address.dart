class Address {
  late int? id;
  late String? name;
  late String? mobile;
  late String? countryCode;
  late int? countryId;
  late String? countryName;
  late int? cityId;
  late String? cityName;
  late String? region;
  late String? street;
  late String? building;
  late String? floor;
  late String? text;
  late bool? isDefault;

  Address({
    required this.id,
    required this.name,
    required this.mobile,
    required this.countryCode,
    required this.countryId,
    required this.countryName,
    required this.cityId,
    required this.cityName,
    required this.region,
    required this.street,
    required this.building,
    required this.floor,
    required this.text,
    required this.isDefault,
  });

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    countryCode = json['country_code'];
    countryId = json['country_id'];
    countryName = json['country_name'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    region = json['region'];
    street = json['street'];
    building = json['building'];
    floor = json['floor'];
    text = json['text'];
    isDefault = json['is_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobile'] = mobile;
    data['country_code'] = countryCode;
    data['country_id'] = countryId;
    data['country_name'] = countryName;
    data['city_id'] = cityId;
    data['city_name'] = cityName;
    data['region'] = region;
    data['street'] = street;
    data['building'] = building;
    data['floor'] = floor;
    data['text'] = text;
    data['is_default'] = isDefault;
    return data;
  }
}
