import 'package:intl/intl.dart';

class BookAvailableTime {
  BookAvailableTime({
    String? time,
    bool? isAvailable,
  }) {
    _time = time;
    _isAvailable = isAvailable;
  }

  BookAvailableTime.fromJson(dynamic json) {
    _time = json['time'];
    _isAvailable = json['isAvailable'];
  }
  String? _time;
  bool? _isAvailable;

  String get time => _time ?? "";
  String get time12 {
    if(_time == null) return "";

    DateTime dateTime = DateFormat("HH:mm:ss").parse(_time!);
    return DateFormat("h:mm a").format(dateTime);
  }
  bool get isAvailable => _isAvailable ?? false;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = _time;
    map['isAvailable'] = _isAvailable;
    return map;
  }
}
