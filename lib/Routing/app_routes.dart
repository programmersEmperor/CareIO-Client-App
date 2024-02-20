import 'package:ai_health_assistance/Pages/AiAssistance/chatbot_page.dart';
import 'package:ai_health_assistance/Pages/Authentication/completeSetup/complete_setup.dart';
import 'package:ai_health_assistance/Pages/Authentication/forgetPassword/forget_password_page.dart';
import 'package:ai_health_assistance/Pages/Authentication/login/loginPage.dart';
import 'package:ai_health_assistance/Pages/Authentication/newPassword/newPassword.dart';
import 'package:ai_health_assistance/Pages/Authentication/otp/otp.dart';
import 'package:ai_health_assistance/Pages/Authentication/signup/signupPage.dart';
import 'package:ai_health_assistance/Pages/Home/home_page.dart';
import 'package:ai_health_assistance/Pages/Hospitals/hopitals_page.dart';
import 'package:ai_health_assistance/Pages/Hospitals/hospital_profile.dart';
import 'package:ai_health_assistance/Pages/Pharmacies/medicine_profile.dart';
import 'package:ai_health_assistance/Pages/Pharmacies/pharmacies_page.dart';
import 'package:ai_health_assistance/Pages/Pharmacies/pharmacy_profile.dart';
import 'package:ai_health_assistance/Pages/Profile/profile_edit.dart';
import 'package:ai_health_assistance/Pages/Profile/profile_page.dart';
import 'package:ai_health_assistance/Pages/Profile/settings.dart';
import 'package:ai_health_assistance/Pages/Search/specific_search_page.dart';
import 'package:ai_health_assistance/Pages/doctors/doctor_profile.dart';
import 'package:ai_health_assistance/Pages/doctors/doctors_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final List<GetPage> allRoutes = [
    GetPage(name: DoctorsPage.id, page: () => const DoctorsPage()),
    GetPage(name: HomePage.id, page: () => const HomePage()),
    GetPage(name: LoginPage.id, page: () => const LoginPage()),
    GetPage(name: ProfileEditPage.id, page: () => const ProfileEditPage()),
    GetPage(name: MedicineProfile.id, page: () => const MedicineProfile()),
    GetPage(
        name: ForgetPasswordPage.id, page: () => const ForgetPasswordPage()),
    GetPage(name: OTPPage.id, page: () => const OTPPage()),
    GetPage(
      name: DoctorProfile.id,
      page: () => DoctorProfile(
        index: Get.arguments[0]['index'],
      ),
    ),
    GetPage(name: SignupPage.id, page: () => const SignupPage()),
    GetPage(name: ChatBotPage.id, page: () => const ChatBotPage()),
    GetPage(name: HospitalsPage.id, page: () => const HospitalsPage()),
    GetPage(
      name: PharmacyProfile.id,
      page: () => PharmacyProfile(
        index: Get.arguments[0]['index'],
      ),
    ),
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
    GetPage(
      name: CompleteSetup.id,
      page: () => const CompleteSetup(),
    ),
    GetPage(
      name: PharmaciesPage.id,
      page: () => const PharmaciesPage(),
    ),
    GetPage(
      name: SpecificSearchPage.id,
      page: () => const SpecificSearchPage(),
    ),
    GetPage(
      name: NewPasswordPage.id,
      page: () => const NewPasswordPage(),
    ),
    GetPage(
      name: SettingsPage.id,
      page: () => const SettingsPage(),
    ),
  ];
}
