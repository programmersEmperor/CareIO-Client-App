import 'package:ai_health_assistance/Pages/Profile/custom/logout_bottom_sheet.dart';
import 'package:ai_health_assistance/Utils/bottom_sheet_handle.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfilePageController extends GetxController {
  void showLogoutBottomSheet() {
    Get.put(BottomSheetController())
        .showBottomSheet(const LogoutBottomSheet(), 100.h);
  }
}
