import 'package:ai_health_assistance/Components/SharedWidgets/timeslot_item.dart';
import 'package:ai_health_assistance/Models/WidgetModels/day_time_slot.dart';
import 'package:ai_health_assistance/Pages/Search/filter_bottom_sheet.dart';
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

  var activeTimeSlotWidget = const Wrap().obs;

  void showFilter() {
    Get.put(BottomSheetController())
        .showBottomSheet(const FilterBottomSheet(), 100.h);
  }

  List<Wrap> timeslotsWidgets = [
    Wrap(
      key: const ValueKey<int>(0),
      spacing: 7.sp,
      children: const [
        TimeSlotItem(),
      ],
    ),
    Wrap(
      key: const ValueKey<int>(1),
      spacing: 7.sp,
      children: const [
        TimeSlotItem(),
        TimeSlotItem(),
      ],
    ),
    Wrap(
      key: const ValueKey<int>(2),
      spacing: 7.sp,
      children: const [
        TimeSlotItem(),
        TimeSlotItem(isDisabled: true),
        TimeSlotItem(),
      ],
    ),
    Wrap(
      key: const ValueKey<int>(3),
      spacing: 7.sp,
      children: const [
        TimeSlotItem(),
        TimeSlotItem(),
        TimeSlotItem(),
        TimeSlotItem(),
      ],
    ),
    Wrap(
      key: const ValueKey<int>(4),
      spacing: 7.sp,
      children: const [
        TimeSlotItem(),
        TimeSlotItem(),
        TimeSlotItem(),
        TimeSlotItem(),
        TimeSlotItem(),
      ],
    ),
    Wrap(
      key: const ValueKey<int>(5),
      spacing: 7.sp,
      children: const [
        TimeSlotItem(),
        TimeSlotItem(),
        TimeSlotItem(),
        TimeSlotItem(),
        TimeSlotItem(),
        TimeSlotItem(),
      ],
    ),
    Wrap(
      key: const ValueKey<int>(6),
      spacing: 7.sp,
      children: const [
        TimeSlotItem(),
        TimeSlotItem(),
        TimeSlotItem(),
        TimeSlotItem(),
        TimeSlotItem(),
        TimeSlotItem(),
        TimeSlotItem(),
      ],
    ),
  ];

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
    activeTimeSlotWidget.value = timeslotsWidgets[0];
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
