import 'package:ai_health_assistance/Pages/AiAssistance/chatbot_page.dart';
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
  ];
}
