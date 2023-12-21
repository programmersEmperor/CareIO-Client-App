import 'package:ai_health_assistance/Models/chats.dart';

class Message {
  final int id;
  final String summary;
  final List<Chats> chats;

  Message.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        summary = map["summary"],
        chats =
            List<Chats>.from(map["chats"].map((it) => Chats.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['summary'] = summary;
    if (chats.isNotEmpty) {
      data['chats'] = chats.map((v) => v.toJson()).toList();
    } else {
      data['chats'] = null;
    }
    return data;
  }
}
