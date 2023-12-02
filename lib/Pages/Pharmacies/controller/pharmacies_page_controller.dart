import 'package:ai_health_assistance/Pages/Search/filter_bottom_sheet.dart';
import 'package:ai_health_assistance/Utils/bottom_sheet_handle.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PharmaciesPageController extends GetxController {
  void showFilter() {
    Get.put(BottomSheetController())
        .showBottomSheet(const FilterBottomSheet(), 100.h);
  }
}
