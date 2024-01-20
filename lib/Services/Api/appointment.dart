import 'package:ai_health_assistance/Services/Api/base/base.dart';

class AppointmentApiService {
  final BaseApi _apiService = BaseApi();

  Future<dynamic> fetchAppointments(
      {required Map<String, dynamic> params}) async {
    return await _apiService.getRequest(
        url: 'patients/appointments', params: params);
  }
}
