import 'package:ai_health_assistance/Services/Api/base/base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookAppointmentApiService {
  final BaseApi _apiService = BaseApi();
  final isLoading = false.obs;

  Future<dynamic> fetchTimes({required Map<String, dynamic> params}) async {
    try {
      isLoading(true);
      var response = await _apiService.getRequest(
        url: '/patients/available-doctor-times',
        params: params,
      );
      isLoading(false);
      return response;
    } catch (e) {
      isLoading(false);
    }
  }

  Future<dynamic> bookAppointment({required Map<String, dynamic> body}) async {
    try {
      var response = await _apiService.postRequest(
        url: '/patients/appointments',
        body: body,
      );

      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
