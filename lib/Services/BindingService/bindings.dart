import 'package:ai_health_assistance/Localization/localization_helper.dart';
import 'package:ai_health_assistance/Pages/Authentication/controllers/authentication_controller.dart';
import 'package:ai_health_assistance/Pages/Booking/book_appointment_controller.dart';
import 'package:ai_health_assistance/Pages/Notifications/notification_controller.dart';
import 'package:ai_health_assistance/Services/Api/aibot.dart';
import 'package:ai_health_assistance/Services/Api/appointment.dart';
import 'package:ai_health_assistance/Services/Api/authentication.dart';
import 'package:ai_health_assistance/Services/Api/book_appintment.dart';
import 'package:ai_health_assistance/Services/Api/doctors.dart';
import 'package:ai_health_assistance/Services/Api/home.dart';
import 'package:ai_health_assistance/Services/Api/hospitals.dart';
import 'package:ai_health_assistance/Services/Api/notification.dart';
import 'package:ai_health_assistance/Services/Api/patient.dart';
import 'package:ai_health_assistance/Services/Api/wallets.dart';
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
    Get.lazyPut(() => HospitalApiService(), fenix: true);
    Get.lazyPut(() => NotificationApiService(), fenix: true);
    Get.lazyPut(() => NotificationController(), fenix: true);
    Get.lazyPut(() => HomeApiService(), fenix: true);
    Get.lazyPut(() => BookAppointmentApiService(), fenix: true);
    Get.lazyPut(() => WalletsApiService(), fenix: true);
    Get.lazyPut(() => BookAppointmentController(), fenix: true);
    Get.put(LocalizationHelper());
  }
}
