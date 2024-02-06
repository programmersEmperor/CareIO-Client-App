import 'dart:convert';

Notification notificationFromJson(String str) =>
    Notification.fromJson(json.decode(str));
String notificationToJson(Notification data) => json.encode(data.toJson());

class Notification {
  Notification({
    int? id,
    String? title,
    String? body,
    String? createdAt,
    bool? isRead,
  }) {
    _id = id;
    _title = title;
    _body = body;
    _createdAt = createdAt;
    _isRead = isRead;
  }

  Notification.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _body = json['body'];
    _createdAt = json['createdAt'];
    _isRead = json['isRead'];
  }
  int? _id;
  String? _title;
  String? _body;
  String? _createdAt;
  bool? _isRead;

  int? get id => _id;
  String? get title => _title;
  String? get body => _body;
  String? get createdAt => _createdAt;
  bool get isRead => _isRead ?? false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['body'] = _body;
    map['createdAt'] = _createdAt;
    map['isRead'] = _isRead;
    return map;
  }
}
