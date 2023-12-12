import 'package:ai_health_assistance/Services/Api/base/interceptors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BaseApi {
  late Dio _dio;
  String apiPreVersion = 'v1';
  String apiVersion = 'v1';
  BaseApi() {
    _dio = _configureClient();
  }

  Dio _configureClient() {
    Dio client = Dio();
    client.options = BaseOptions(
      baseUrl: '/api/$apiVersion/',
    );
    client.interceptors.add(ApiInterceptors());
    client.interceptors.add(LogInterceptor(
        responseBody: true, logPrint: (o) => debugPrint(o.toString())));
    return client;
  }

  Future<Response> getRequest(
      {required String url, Map<String, dynamic>? params}) async {
    Response response = await _dio.get(url, queryParameters: params ?? {});
    return response.data;
  }

  Future<Response> postRequest(
      {required url, required Map<String, dynamic> body}) async {
    Response response = await _dio.post(url, data: body);
    return response.data;
  }

  Future<Response> putRequest(
      {required url, required Map<String, dynamic> body}) async {
    Response response = await _dio.put('/', data: body);
    return response.data;
  }
}
