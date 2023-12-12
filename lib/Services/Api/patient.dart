import 'dart:io';

import 'package:ai_health_assistance/Services/Api/base/base.dart';
import 'package:dio/dio.dart';

class PatientApiService extends BaseApi {
  Future<dynamic> update({required String name, File? avatar}) async {
    var response = await putRequest(url: 'clients/update', body: {
      'name': name,
      'avatar': avatar != null ? MultipartFile.fromFile(avatar.path) : null,
    });
    return response;
  }

  Future<dynamic> resetPassword(
      {required String password, required String oldPassword}) async {
    var response = await putRequest(
        url: '/clients/resetPassword',
        body: {"oldPassword": oldPassword, "newPassword": password});
    return response;
  }
}
