class Degree {
  Degree({
    String? nameAr,
    String? nameEn,
  }) {
    _nameAr = nameAr;
    _nameEn = nameEn;
  }

  Degree.fromJson(dynamic json) {
    _nameAr = json['nameAr'];
    _nameEn = json['nameEn'];
  }
  String? _nameAr;
  String? _nameEn;

  String? get nameAr => _nameAr;
  String? get nameEn => _nameEn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nameAr'] = _nameAr;
    map['nameEn'] = _nameEn;
    return map;
  }
}
