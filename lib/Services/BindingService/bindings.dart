import 'package:ai_health_assistance/Services/Api/authentication.dart';
import 'package:ai_health_assistance/Services/CachingService/user_session.dart';
import 'package:get/get.dart';

class BindingService extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserSession());
    Get.lazyPut(() => AuthenticationApiService());
  }
}
