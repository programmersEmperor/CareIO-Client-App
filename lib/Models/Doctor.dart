import 'package:ai_health_assistance/Models/Specialism.dart';

class Doctor {
  Doctor({
    int? id,
    String? name,
    String? avatar,
    int? rating,
    int? completedAppointments,
  }) {
    _id = id;
    _name = name;
    _avatar = avatar;
    _rating = rating;
    _completedAppointments = completedAppointments;
  }

  Doctor.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _avatar = json['avatar'];
    _rating = json['rating'];
    _completedAppointments = json['completedAppointments'];
    _specialism = Specialism.fromJson(json['specialism']);
  }
  int? _id;
  String? _name;
  String? _avatar;
  int? _rating;
  int? _completedAppointments;
  Specialism? _specialism;

  int? get id => _id;
  String? get name => _name;
  String? get avatar => _avatar;
  int? get rating => _rating;
  int? get completedAppointments => _completedAppointments;
  Specialism? get specialism => _specialism;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['avatar'] = _avatar;
    map['rating'] = _rating;
    map['completedAppointments'] = _completedAppointments;
    return map;
  }
}
