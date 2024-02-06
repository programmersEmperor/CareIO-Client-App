import 'dart:developer';

import 'package:ai_health_assistance/Models/HealthCenter.dart';
import 'package:ai_health_assistance/Models/WidgetModels/day_time_slot.dart';
import 'package:ai_health_assistance/Pages/Search/filter_bottom_sheet.dart';
import 'package:ai_health_assistance/Services/Api/hospitals.dart';
import 'package:ai_health_assistance/Utils/bottom_sheet_handle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HospitalsUiController extends GetxController {
  RxBool isList = true.obs;
  late ScrollController scrollController;
  RxDouble height = 63.h.obs;
  RxBool enableAnimation = false.obs;
  int preSelectedIndex = 0;

  final apiService = Get.find<HospitalApiService>();
  List<HealthCenter> healthCenters = [];
  late HealthCenter healthCenter;
  RxBool get isLoading => apiService.isLoading;
  RxBool profileLoading = true.obs;

  var activeTimeSlotWidget = const Wrap().obs;

  void showFilter() {
    Get.put(BottomSheetController())
        .showBottomSheet(const FilterBottomSheet(), 100.h);
  }

  List<Wrap> timeslotsWidgets = [];

  final List<DayTimeSlot> dayTimeSlotList = [
    DayTimeSlot('Sat', true.obs),
    DayTimeSlot('Sun', false.obs),
    DayTimeSlot('Mon', false.obs),
    DayTimeSlot('Tue', false.obs),
    DayTimeSlot('Wed', false.obs),
    DayTimeSlot('Thu', false.obs),
    DayTimeSlot('Fri', false.obs),
  ];

  void onTapDayTimeSlot(int index) {
    if (preSelectedIndex == index) return;
    dayTimeSlotList[index].setIsSelected = true;
    dayTimeSlotList[preSelectedIndex].setIsSelected = false;
    activeTimeSlotWidget(timeslotsWidgets[index]);
    preSelectedIndex = index;
  }

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    //activeTimeSlotWidget.value = timeslotsWidgets[0];
    fetchHealthCenters(isPagination: false);
  }

  void fetchHealthCenters({required bool isPagination}) async {
    if (!isPagination) {
      healthCenters.clear();
    }
    var response = await apiService.fetchHospitals();
    if (response == null) return;
    for (var healthCenter in response.data['result']['data']) {
      healthCenters.add(HealthCenter.fromJson(healthCenter));
    }
  }

  Future<void> showHealthCenter(String id) async {
    profileLoading(true);
    var response = await apiService.showHospital(id: id);
    profileLoading(false);
    if (response == null) return;

    log(response.toString());
    healthCenter = HealthCenter.fromJson(response.data['result']);
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
