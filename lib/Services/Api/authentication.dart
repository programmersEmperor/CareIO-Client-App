import 'package:ai_health_assistance/Services/Api/base/base.dart';

class AuthenticationApiService extends BaseApi {
  Future<dynamic> login(
      {required String phone, required String password}) async {
    var response = await postRequest(
        url: '/clients/login', body: {'phone': phone, 'password': password});
    return response;
  }

  Future<dynamic> signup(
      {required String phone, required String password, String? email}) async {
    var response = await postRequest(url: '/clients/register', body: {
      "password": password,
      "email": email,
      "phone": phone,
    });
    return response;
  }

  Future<dynamic> forgetPassword({required String password}) async {
    var response = await putRequest(
        url: '/clients/resetPassword', body: {"newPassword": password});
    return response;
  }

  Future<dynamic> logout() async {
    var response = await getRequest(url: '/clients/logout');
    return response;
  }

  Future<dynamic> sendOtp({required String phone}) async {
    var response =
        await postRequest(url: '/phone/sendOTP', body: {'phone': phone});
    return response;
  }

  Future<dynamic> verifyOtp({required int otp, required bool isReset}) async {
    var response = await postRequest(url: '/phone/verifyOTP', body: {
      'otp': otp,
      'isReset': isReset,
    });
    return response;
  }
}
