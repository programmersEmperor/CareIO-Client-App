import 'package:ai_health_assistance/Models/Doctor.dart';
import 'package:ai_health_assistance/Models/HealthCenter.dart';

/// id : 10
/// status : 10
/// bookedAt : ""
/// patientName : "string"
/// healthCenter : "string"
/// section : "string"
/// clinic : "string"
/// wallet : "string"
/// price : 10.5

class Appointment {
  Appointment({
    required int id,
    required int status,
    required String bookedAt,
    required String patientName,
    required HealthCenter healthCenter,
    required String section,
    required String clinic,
    required String wallet,
    required int price,
  }) {
    _id = id;
    _status = status;
    _bookedAt = bookedAt;
    _patientName = patientName;
    _healthCenter = healthCenter;
    _section = section;
    _clinic = clinic;
    _wallet = wallet;
    _price = price;
  }

  Appointment.fromJson(dynamic json) {
    _id = json['id'];
    _status = json['status'];
    _bookedAt = json['bookedAt'];
    _patientName = json['patientName'];
    _healthCenter = HealthCenter.fromJson(json['healthCenter']);
    _section = json['section'];
    _clinic = json['clinic'] ?? "";
    _wallet = json['wallet'];
    _date = json['date'];
    _rating = json['rating'] ?? 0;
    _time = json['time'];
    _price = json['price'];
    _doctor = Doctor.fromJson(json['doctor']);
  }
  late int _id;
  late int _status;
  late String _bookedAt;
  late String _patientName;
  late HealthCenter _healthCenter;
  late String _section;
  late String _clinic;
  late String? _wallet;
  late int _price;
  late Doctor _doctor;
  late String _date;
  late String _time;
  late int _rating;

  int get id => _id;
  int get status => _status;
  String get bookedAt => _bookedAt;
  String get patientName => _patientName;
  HealthCenter get healthCenter => _healthCenter;
  String get section => _section;
  String get clinic => _clinic;
  String get wallet => _wallet ?? "";
  String get date => _date;
  int get rating => _rating;
  String get time => _time;
  int get price => _price;
  Doctor get doctor => _doctor;

  String get appointmentStatusTitle => _getAppointment();

  String _getAppointment() {
    if (status == 5) {
      return "completed";
    }
    if (status == 6) {
      return "unattended";
    }
    return "";
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['status'] = _status;
    map['bookedAt'] = _bookedAt;
    map['patientName'] = _patientName;
    map['healthCenter'] = _healthCenter;
    map['section'] = _section;
    map['clinic'] = _clinic;
    map['wallet'] = _wallet;
    map['price'] = _price;
    return map;
  }
}
