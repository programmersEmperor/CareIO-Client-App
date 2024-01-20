import 'package:ai_health_assistance/Models/client.dart';
import 'package:ai_health_assistance/Pages/Profile/custom/change_language_sheet.dart';
import 'package:ai_health_assistance/Pages/Profile/custom/logout_bottom_sheet.dart';
import 'package:ai_health_assistance/Services/CachingService/user_session.dart';
import 'package:ai_health_assistance/Utils/bottom_sheet_handle.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfilePageController extends GetxController {
  Patient patient = Get.find<UserSession>().patient;
  void showLogoutBottomSheet() {
    Get.put(BottomSheetController())
        .showBottomSheet(const LogoutBottomSheet(), 100.h);
  }

  void changeLanguageBottomSheet() {
    Get.put(BottomSheetController())
        .showBottomSheet(const ChangeLanguageSheet(), 100.h);
  }
}
