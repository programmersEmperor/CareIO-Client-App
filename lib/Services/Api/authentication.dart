import 'package:ai_health_assistance/Services/Api/base/base.dart';
import 'package:get/get.dart';

class AuthenticationApiService {
  final BaseApi _apiService = BaseApi();
  final isLoading = false.obs;
  Future<dynamic> login({required Map<String, dynamic> body}) async {
    try {
      isLoading(true);
      var response = await _apiService.postRequest(
        url: '/clients/login',
        body: body,
      );

      isLoading(false);
      return response;
    } catch (e) {
      isLoading(false);
    }
  }

  Future<dynamic> signup({required Map<String, dynamic> body}) async {
    try {
      isLoading(true);
      var response =
          await _apiService.postRequest(url: '/clients/register', body: body);
      isLoading(false);
      return response;
    } catch (e) {
      isLoading(false);
    }
  }

  Future<dynamic> forgetPassword({required String password}) async {
    var response = await _apiService.putRequest(
        url: '/clients/resetPassword', body: {"newPassword": password});
    return response;
  }

  Future<dynamic> logout() async {
    // var response = await _apiService.getRequest(url: '/clients/logout');
    // return response;
  }

  Future<dynamic> sendOtp({required Map<String, dynamic> body}) async {
    // var response =
    //     await _apiService.postRequest(url: '/phone/sendOTP', body: body);
    // return response;
  }

  Future<dynamic> verifyOtp({required int otp, required bool isReset}) async {
    try {
      isLoading(true);
      var response =
          await _apiService.postRequest(url: '/phone/VerifyOTP', body: {
        'otp': otp,
        'isReset': isReset,
      });
      isLoading(false);
      return response;
    } catch (e) {
      isLoading(false);
    }
  }
}
