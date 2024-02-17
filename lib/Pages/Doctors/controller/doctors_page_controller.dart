import 'package:ai_health_assistance/Models/Doctor.dart';
import 'package:ai_health_assistance/Pages/Search/filter_bottom_sheet.dart';
import 'package:ai_health_assistance/Services/Api/doctors.dart';
import 'package:ai_health_assistance/Utils/bottom_sheet_handle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DoctorsPageController extends GetxController {
  RxBool isList = true.obs;
  final apiService = Get.find<DoctorsApiService>();
  List<Doctor> doctors = [];
  RxBool get isLoading => apiService.isLoading;
  void showFilter() {
    Get.put(BottomSheetController())
        .showBottomSheet( FilterBottomSheet(onTapFilter: ()=> filterDoctors()), 100.h);
  }

  void filterDoctors({int? rating, int? clinicId, bool? isNearby}) {
    debugPrint("Hello");
  }

  @override
  void onInit() {
    fetchDoctors(isPagination: false);
    super.onInit();
  }

  void fetchDoctors({required bool isPagination}) async {
    if (!isPagination) {
      doctors.clear();
    }
    var response = await apiService.fetchDoctors();
    if (response == null) return;
    for (var doctor in response.data['result']['data']) {
      doctors.add(Doctor.fromJson(doctor));
    }
  }
}
