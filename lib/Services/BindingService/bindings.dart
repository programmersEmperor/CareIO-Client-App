import 'package:ai_health_assistance/Localization/localization_helper.dart';
import 'package:ai_health_assistance/Pages/Authentication/controllers/authentication_controller.dart';
import 'package:ai_health_assistance/Services/Api/aibot.dart';
import 'package:ai_health_assistance/Services/Api/appointment.dart';
import 'package:ai_health_assistance/Services/Api/authentication.dart';
import 'package:ai_health_assistance/Services/Api/doctors.dart';
import 'package:ai_health_assistance/Services/Api/patient.dart';
import 'package:get/get.dart';

class BindingService extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationApiService(), fenix: true);
    Get.lazyPut(() => AuthenticationController(), fenix: true);
    Get.lazyPut(() => AiBotApiService(), fenix: true);
    Get.lazyPut(() => PatientApiService(), fenix: true);
    Get.lazyPut(() => AppointmentApiService(), fenix: true);
    Get.lazyPut(() => DoctorsApiService(), fenix: true);
    Get.put(LocalizationHelper());
  }
}
