import 'package:ai_health_assistance/Services/Api/base/base.dart';

class AppointmentApiService {
  final BaseApi _apiService = BaseApi();

  Future<dynamic> fetchAppointments(
      {required Map<String, dynamic> params}) async {
    return await _apiService.getRequest(
        url: 'patients/appointments', params: params);
  }

  Future<dynamic> cancelAppointment({required int id}) async {
    return await _apiService.getRequest(
        url: 'patients/appointments/cancel/$id');
  }

  Future<dynamic> rescheduleAppointment(
      {required int id, required String date}) async {
    return await _apiService.postRequest(
        url: 'patients/appointments/reschedule/$id', body: {'date': date});
  }
}
