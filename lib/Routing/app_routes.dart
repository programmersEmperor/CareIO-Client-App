import 'package:ai_health_assistance/Pages/AiAssistance/chatbot_page.dart';
import 'package:ai_health_assistance/Pages/Hospitals/hopitals_page.dart';
import 'package:ai_health_assistance/Pages/Hospitals/hospital_profile.dart';
import 'package:ai_health_assistance/Pages/Profile/profile_page.dart';
import 'package:ai_health_assistance/Pages/doctors/doctor_profile.dart';
import 'package:ai_health_assistance/Pages/doctors/doctors_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final List<GetPage> allRoutes = [
    GetPage(name: DoctorsPage.id, page: () => const DoctorsPage()),
    GetPage(
      name: DoctorProfile.id,
      page: () => DoctorProfile(
        index: Get.arguments[0]['index'],
      ),
    ),
    GetPage(name: ChatBotPage.id, page: () => const ChatBotPage()),
    GetPage(name: HospitalsPage.id, page: () => const HospitalsPage()),
    GetPage(
      name: HospitalProfile.id,
      page: () => HospitalProfile(
        index: Get.arguments[0]['index'],
      ),
    ),
    GetPage(
      name: ProfilePage.id,
      page: () => const ProfilePage(),
    ),
  ];
}
