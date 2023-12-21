class Chats {
  final String role;
  final String content;

  Chats.fromJsonMap(Map<String, dynamic> map)
      : role = map["role"],
        content = map["content"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['content'] = content;
    return data;
  }
}
