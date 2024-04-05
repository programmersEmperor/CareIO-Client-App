import 'dart:async';
import 'dart:developer';

import 'package:ai_health_assistance/Components/SharedWidgets/timeslot_item.dart';
import 'package:ai_health_assistance/Localization/app_strings.dart';
import 'package:ai_health_assistance/Models/ActiveTime.dart';
import 'package:ai_health_assistance/Models/Clinic.dart';
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

  RxInt currentSelectedIndex = 0.obs;

  RxBool isLoading = false.obs;

  void showBookingModal() {
    Get.put(BottomSheetController()).showBottomSheet(
        BookAppointment(
          doctor: doctor,
        ),
        100.h);
  }

  // var activeTimeSlotWidget = const Wrap().obs;

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
        timeslotsItems.add(TimeSlotItem(from: time.time12(time.from), to:time.time12(time.to)));
      }
    }

    return Wrap(
      children: timeslotsItems.isNotEmpty ? timeslotsItems : [
        Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(AppStrings.notActiveOnThisDay.tr, style: TextStyle(fontSize: 8.sp),)
          ),
        )
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
    // activeTimeSlotWidget(setTimeSlots(index));
    if (currentSelectedIndex.value == index) return;
    dayTimeSlotList[index].setIsSelected = true;
    dayTimeSlotList[currentSelectedIndex.value].setIsSelected = false;
    currentSelectedIndex(index);
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

  List<HealthCenter> filterHealthCentersByDay({required List<HealthCenter> healthCenters, required int day, int? clinicId}){
    final List<HealthCenter> filteredHealthCenters = [];
    for(HealthCenter healthCenter in healthCenters){
      final bool succeeded = healthCenter.clinics.any((clinic) {
        if(clinicId == null) return clinic.activeTimes.any((activeTime) => activeTime.day == day);
        else return clinic.id! == clinicId && clinic.activeTimes.any((activeTime) => activeTime.day == day) ;
      });
      if(succeeded){
        filteredHealthCenters.add(healthCenter);
      }
    }
    return filteredHealthCenters;
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
    isLoading(false);
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
