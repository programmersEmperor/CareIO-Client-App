import 'package:ai_health_assistance/Pages/doctors/doctors_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final List<GetPage> allRoutes = [
    GetPage(name: DoctorsPage.id, page: () => const DoctorsPage()),
  ];
}
