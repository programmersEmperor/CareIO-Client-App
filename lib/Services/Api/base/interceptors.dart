import 'package:ai_health_assistance/Localization/localization_helper.dart';
import 'package:ai_health_assistance/Services/CachingService/user_session.dart';
import 'package:ai_health_assistance/Utils/snackbar.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unique_identifier/unique_identifier.dart';

class ApiInterceptors extends Interceptor {
  Future<String> get getFingerprint async => await getFingerPrint();
  late DeviceInfoPlugin deviceInfoPlugin;

  Future<String> getFingerPrint() async {
    deviceInfoPlugin = DeviceInfoPlugin();
    AndroidDeviceInfo android = await deviceInfoPlugin.androidInfo;
    debugPrint(
        "FingerPrint: ${android.fingerprint}${await UniqueIdentifier.serial}");
    return "${android.fingerprint}${await UniqueIdentifier.serial}";
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint('REQUEST [${options.method}] => PATH: ${options.path}');

    options.headers.putIfAbsent(
        'Authorization', () => 'Bearer ${Get.find<UserSession>().token}');
    options.headers['Accept-Language'] =
        Get.find<LocalizationHelper>().appliedLocale.value!.languageCode;
    options.headers['fingerprint'] = await getFingerprint;
    options.headers['deviceToken'] =
        Get.find<UserSession>().firebaseDeviceToken;
    options.headers['Content-Type'] = "application/json";
    handler.next(options);

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    // Get.snackbar(
    //     'Error ${err.response?.statusCode}',
    //     duration: 5.seconds,
    //     "In Path ${err.requestOptions.path} \n Message : ${err.message}");

    var response = err.response.toString().isEmpty
        ? err.message
        : err.response!.data['message'];

    showSnack(
        title: "Oops ${err.response?.statusCode}",
        description: response.toString());

    super.onError(err, handler);
  }
}
