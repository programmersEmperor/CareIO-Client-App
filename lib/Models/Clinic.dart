import 'package:ai_health_assistance/Models/ActiveTime.dart';

class Clinic {
  Clinic({
    int? id,
    String? name,
    String? description,
  }) {
    _id = id;
    _name = name;
    _description = description;
  }

  Clinic.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    if (json['activeTimes'] != null) {
      _activeTimes = [];
      for (var time in json['activeTimes']) {
        _activeTimes!.add(ActiveTimes.fromJson(time));
      }
    } else {
      _activeTimes = [];
    }
  }
  int? _id;
  String? _name;
  String? _description;
  List<ActiveTimes>? _activeTimes;

  int? get id => _id;
  String? get name => _name;
  String? get description => _description;
  List<ActiveTimes> get activeTimes => _activeTimes ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    return map;
  }
}
