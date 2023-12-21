class Patient {
  final String name;
  final String phone;
  final String email;
  final String avatar;
  final String subscription;
  final int messageBalance;
  final String token;

  Patient.fromJsonMap(Map<String, dynamic> map)
      : name = map["name"],
        phone = map["phone"],
        email = map["email"],
        avatar = map["avatar"],
        subscription = map["subscription"],
        messageBalance = map["messageBalance"],
        token = map["token"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['avatar'] = avatar;
    data['subscription'] = subscription;
    data['messageBalance'] = messageBalance;
    data['token'] = token;
    return data;
  }
}
