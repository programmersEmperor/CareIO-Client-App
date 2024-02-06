import 'dart:developer';

import 'package:ai_health_assistance/Components/SharedWidgets/timeslot_item.dart';
import 'package:ai_health_assistance/Models/DoctorDetails.dart';
import 'package:ai_health_assistance/Models/HealthCenter.dart';
import 'package:ai_health_assistance/Models/WidgetModels/day_time_slot.dart';
import 'package:ai_health_assistance/Pages/Booking/book_appointment.dart';
import 'package:ai_health_assistance/Services/Api/doctors.dart';
import 'package:ai_health_assistance/Utils/bottom_sheet_handle.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorProfileUiController extends GetxController {
  late ScrollController scrollController;
  RxDouble height = 63.h.obs;
  RxBool enableAnimation = false.obs;
  late DoctorDetails doctor;
  final apiService = Get.find<DoctorsApiService>();

  int preSelectedIndex = 0;

  RxBool isLoading = false.obs;

  void showBookingModal() {
    Get.put(BottomSheetController()).showBottomSheet(
        BookAppointment(
          doctor: doctor,
        ),
        100.h);
  }

  var activeTimeSlotWidget = const Wrap().obs;

  List<Wrap> timeslotsWidgets = [];
  List<TimeSlotItem> timeslotsItems = [];

  void addTimeSlot({required int id, required List<String> timeSlots}) {}

  final List<DayTimeSlot> dayTimeSlotList = [
    DayTimeSlot('Sun', false.obs),
    DayTimeSlot('Mon', false.obs),
    DayTimeSlot('Tue', false.obs),
    DayTimeSlot('Wed', false.obs),
    DayTimeSlot('Thu', false.obs),
    DayTimeSlot('Fri', false.obs),
    DayTimeSlot('Sat', true.obs),
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
    scrollController = ScrollController();

    super.onInit();
  }

  Future<void> callDoctor() async {
    if (!await launchUrl(Uri.parse('tel:${doctor.phone}'))) {
      throw Exception('Could not launch ');
    }
  }

  void showTimeslots({required HealthCenter healthCenter}) {
    if (healthCenter.activeTimes == null) return;

    // timeslotsWidgets.add(
    //   Wrap(
    //     key: const ValueKey<int>(0),
    //     spacing: 7.sp,
    //     children: healthCenter.activeTimes!.map((e) {
    //      if(e.)
    //     }).toList(),
    //   ),
    // );
  }

  Future<void> showDoctor() async {
    isLoading(true);
    var response = await apiService.showDoctor(id: Get.arguments[0]['index']);
    log(response.data['result']['healthCenters'].toString());
    if (response == null) return;
    doctor = DoctorDetails.fromJson(response.data['result']);
    for (var time in doctor.healthCenters!.first.clinics) {
      if (time.activeTimes.isNotEmpty) {
        debugPrint("Hello");
        debugPrint(time.activeTimes.map((e) => e.id.toString()).toString());
      }
    }
    isLoading(false);
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
