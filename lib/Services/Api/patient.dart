import 'dart:io';

import 'package:ai_health_assistance/Services/Api/base/base.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';

class PatientApiService {
  final BaseApi _apiService = BaseApi();

  Future<dynamic> update(
      {required String name,
      required File avatar,
      String? phone,
      String? email,
        bool removeAvatar = false,
      }) async {
    try {
      var response = await _apiService.postRequest(
          url: 'patients/update',
          body: dio.FormData.fromMap({
            'name': name,
            'avatar': avatar.path.isNotEmpty
                ? await dio.MultipartFile.fromFile(avatar.path)
                : null,
          }),
        params: removeAvatar ? {"removeAvatar": 1} : null,
      );

      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<dynamic> getPlans() async {
    try {
      var response =
          await _apiService.getRequest(url: 'patients/subscription-plans');

      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<dynamic> resetPassword(
      {required String password, required String oldPassword}) async {
    var response = await _apiService.putRequest(
        url: 'patients/resetPassword',
        body: {"oldPassword": oldPassword, "newPassword": password});
    return response;
  }

  Future<dynamic> getPatientData() async {
    try {
      var response = await _apiService.getRequest(
        url: '/patients/auther-data',
      );
      debugPrint('Status Code : ${response.statusCode}');
      return response;
    } catch (e) {
        throw e;
    }
  }
}
