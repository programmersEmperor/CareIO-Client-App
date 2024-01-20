import 'package:ai_health_assistance/Services/Api/base/base.dart';

class AiBotApiService extends BaseApi {
  Future<dynamic> sendMessage(Map<String, dynamic> body) async {
    var response = await postRequest(url: 'patients/ai/chat', body: body);
    return response;
  }
}
