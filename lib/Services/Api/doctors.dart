import 'package:ai_health_assistance/Services/Api/base/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DoctorsApiService {
  final BaseApi _apiService = BaseApi();

  final isLoading = false.obs;

  Future<dynamic> fetchDoctors(
      {Map<String, dynamic>? params, required int pageSize}) async {
    try {
      isLoading(true);
      var response = await _apiService.getRequest(
        url: 'patients/doctors?page=$pageSize',
        params: params,
      );
      isLoading(false);
      return response;
    } catch (e) {
      isLoading(false);
      debugPrint(e.toString());
    }
  }

  Future<dynamic> showDoctor({required String id}) async {
    try {
      var response = await _apiService.getRequest(url: 'patients/doctors/$id');

      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
