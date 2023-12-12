import 'package:ai_health_assistance/Services/CachingService/language_preferance_cache.dart';
import 'package:ai_health_assistance/Services/CachingService/user_session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint('REQUEST [${options.method}] => PATH: ${options.path}');

    options.headers.putIfAbsent(
        'Authorization', () => 'Bearer ${Get.find<UserSession>().token}');
    options.headers['Accept-Language'] = LanguagePreferenceCache.appLanguage;
    options.headers['fingerprint'] = "";
    options.headers['deviceToken'] = "firebaseToken";
    options.headers['Content-Type'] = "application/json";
    handler.next(options);
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
