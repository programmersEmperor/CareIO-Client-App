import 'package:ai_health_assistance/Services/Api/base/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HospitalApiService {
  final BaseApi _apiService = BaseApi();

  final isLoading = false.obs;

  Future<dynamic> fetchHospitals({Map<String, dynamic>? params}) async {
    try {
      isLoading(true);
      var response = await _apiService.getRequest(
        url: 'patients/health-centers',
        params: params,
      );
      isLoading(false);
      return response;
    } catch (e) {
      isLoading(false);
      debugPrint(e.toString());
    }
  }

  Future<dynamic> showHospital({required String id}) async {
    try {
      var response =
          await _apiService.getRequest(url: 'patients/health-centers/$id');
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
