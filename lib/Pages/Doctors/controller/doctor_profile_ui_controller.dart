import 'dart:async';
import 'dart:developer';

import 'package:ai_health_assistance/Components/SharedWidgets/timeslot_item.dart';
import 'package:ai_health_assistance/Localization/app_strings.dart';
import 'package:ai_health_assistance/Models/ActiveTime.dart';
import 'package:ai_health_assistance/Models/DoctorDetails.dart';
import 'package:ai_health_assistance/Models/Experience.dart';
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
  List<ActiveTimes> timeSlots = [];

  RxList activeDayTimeSlot = [].obs;

  void addTimeSlot({required int id, required List<String> timeSlots}) {}

  final List<DayTimeSlot> dayTimeSlotList = [
    DayTimeSlot('Sun', true.obs),
    DayTimeSlot('Mon', false.obs),
    DayTimeSlot('Tue', false.obs),
    DayTimeSlot('Wed', false.obs),
    DayTimeSlot('Thu', false.obs),
    DayTimeSlot('Fri', false.obs),
    DayTimeSlot('Sat', false.obs),
  ];

  Wrap setTimeSlots(int index) {
    timeslotsItems.clear();
    for (var time in timeSlots) {
      if (time.day == index) {
        timeslotsItems.add(TimeSlotItem(time: "${time.from} - ${time.to}"));
      }
    }

    return Wrap(
      children: timeslotsItems.isNotEmpty?timeslotsItems: [
        Expanded(child: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(AppStrings.notActiveOnThisDay.tr)
          ),
        ))
      ],
    );
  }

  int calculateDoctorExperience(DoctorDetails doctor){
    int experienceTotal = 0;
    for(Experience experience in doctor.experience){
      DateTime from = DateTime.parse(experience.from);
      DateTime to = DateTime.parse(experience.to);
      experienceTotal += (to.difference(from).inDays/365).round();
    }
    return experienceTotal;
  }

  void onTapDayTimeSlot(int index) {
    //if (preSelectedIndex == index) return;
    debugPrint("it is clicked");
    DateTime;
    activeTimeSlotWidget(setTimeSlots(index));
    if (preSelectedIndex == index) return;
    dayTimeSlotList[index].setIsSelected = true;
    dayTimeSlotList[preSelectedIndex].setIsSelected = false;
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
  }

  void getData() async {
    await showDoctor();
    onTapDayTimeSlot(0);
  }

  Future<void> showDoctor() async {
    isLoading(true);
    var response = await apiService.showDoctor(id: Get.arguments[0]['index']);
    log(response.data['result'].toString());
    if (response == null) return;
    doctor = DoctorDetails.fromJson(response.data['result']);
    debugPrint("experience length ${doctor.experience.length}");
    for (var healthCenter in doctor.healthCenters) {
      for (var clinic in healthCenter.clinics) {
        for (var timeSlot in clinic.activeTimes) {
          timeSlots.add(timeSlot);
        }
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
