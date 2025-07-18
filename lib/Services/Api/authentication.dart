import 'package:ai_health_assistance/Services/Api/base/base.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationApiService {
  final BaseApi _apiService = BaseApi();
  final isLoading = false.obs;
  Future<dynamic> login({required Map<String, dynamic> body}) async {
    try {
      isLoading(true);
      var response = await _apiService.postRequest(
        url: '/patients/login',
        body: body,
      );
      isLoading(false);
      debugPrint('Status Code : ${response.statusCode}');
      return response;
    } catch (e) {
      isLoading(false);
    }
  }

  Future<dynamic> signup({required Map<String, dynamic> body}) async {
    try {
      var requestBody = {
        "name": body['name'],
        "password": body['password'],
        "phone": body['phone'],
      };
      isLoading(true);
      var response = await _apiService.postRequest(
          url: '/patients/register', body: requestBody);
      isLoading(false);
      return response;
    } catch (e) {
      isLoading(false);
      debugPrint(e.toString());
    }
  }

  Future<dynamic> forgetPassword({required String password}) async {
    try {
      isLoading(true);
      var response = await _apiService.postRequest(
          url: '/patients/resetPassword',
          body: dio.FormData.fromMap(
              {"newPassword": password, 'is-forget': true}));
      isLoading(false);
      return response;
    } catch (e) {
      isLoading(false);
    }
  }

  Future<dynamic> sendOtp({required Map<String, dynamic> body}) async {
    try {
      isLoading(true);
      var response = await _apiService.postRequest(
          url: '/patients/phone/sendOTP', body: body);
      isLoading(false);
      return response;
    } catch (e) {
      isLoading(false);
    }
  }

  Future<dynamic> verifyOtp({required int otp, required bool isReset}) async {
    try {
      isLoading(true);
      var response = await _apiService.postRequest(
        url: 'patients/phone/verifyOTP',
        body: {
          'otp': otp,
          'is-forget': isReset,
        },
      );
      isLoading(false);
      return response;
    } catch (e) {
      isLoading(false);
    }
  }
}
