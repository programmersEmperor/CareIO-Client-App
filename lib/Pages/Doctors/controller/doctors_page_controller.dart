import 'package:ai_health_assistance/Models/Doctor.dart';
import 'package:ai_health_assistance/Pages/Search/filter_bottom_sheet.dart';
import 'package:ai_health_assistance/Services/Api/doctors.dart';
import 'package:ai_health_assistance/Utils/bottom_sheet_handle.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DoctorsPageController extends GetxController {
  RxBool isList = true.obs;
  final apiService = Get.find<DoctorsApiService>();
  List<Doctor> doctors = [];
  RxBool get isLoading => apiService.isLoading;
  void showFilter() {
    Get.put(BottomSheetController())
        .showBottomSheet(const FilterBottomSheet(), 100.h);
  }

  @override
  void onInit() {
    fetchDoctors();
    super.onInit();
  }

  void fetchDoctors() async {
    try {
      debugPrint('Locale ${Get.locale}');
      var response = await apiService.fetchDoctors();
      debugPrint("Doctor response is $response");
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
