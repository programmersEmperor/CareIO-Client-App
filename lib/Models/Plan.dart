import 'dart:convert';

Plan planFromJson(String str) => Plan.fromJson(json.decode(str));
String planToJson(Plan data) => json.encode(data.toJson());

class Plan {
  Plan({
    int? id,
    String? titleAr,
    String? titleEn,
    String? descriptionAr,
    double? price,
  }) {
    _id = id;
    _titleAr = titleAr;
    _titleEn = titleEn;
    _descriptionAr = descriptionAr;
    _price = price;
  }

  Plan.fromJson(dynamic json) {
    _id = json['id'];
    _titleAr = json['titleAr'];
    _titleEn = json['titleEn'];
    _descriptionAr = json['descriptionAr'];
    _price = json['price'];
  }
  int? _id;
  String? _titleAr;
  String? _titleEn;
  String? _descriptionAr;
  double? _price;

  int get id => _id ?? 0;
  String get titleAr => _titleAr ?? "";
  String get titleEn => _titleEn ?? "";
  String get descriptionAr => _descriptionAr ?? "";
  double get price => _price ?? 0.0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['titleAr'] = _titleAr;
    map['titleEn'] = _titleEn;
    map['descriptionAr'] = _descriptionAr;
    map['price'] = _price;
    return map;
  }
}
