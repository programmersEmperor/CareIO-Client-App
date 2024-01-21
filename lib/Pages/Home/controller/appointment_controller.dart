import 'package:ai_health_assistance/Models/Appointment.dart';
import 'package:ai_health_assistance/Services/Api/appointment.dart';
import 'package:ai_health_assistance/Utils/appointment_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController
    with GetTickerProviderStateMixin {
  late List<Widget> tabs;
  late TabController tabController;
  List<Appointment> appointments = [];

  List<Appointment> get upcomingAppointments => appointments
      .where((element) => element.status == AppointmentStatus.upcoming.index)
      .toList();

  List<Appointment> get completedAppointments => appointments
      .where((element) => element.status == AppointmentStatus.completed.index)
      .toList();

  List<Appointment> get canceledAppointments => appointments
      .where((element) => element.status == AppointmentStatus.canceled.index)
      .toList();

  List<int> pages = [1, 1, 1];
  List<RxBool> isLoading = [false.obs, false.obs, false.obs];

  @override
  void onInit() async {
    tabs = const [
      Tab(
        text: "Upcoming",
        //  height: 30.sp,
      ),
      Tab(
        text: "Completed",
        //    height: 30.sp,
      ),
      Tab(
        text: "Canceled",
        //    height: 30.sp,
      ),
    ];

    tabController = TabController(length: tabs.length, vsync: this);

    initializeAppointments();

    super.onInit();
  }

  void initializeAppointments({AppointmentStatus? status}) async {
    if (status != null) {
      await fetchAppointments(
          loading: isLoading[status.index],
          params: {'page': 1, 'status': status.index});
      return;
    }
    await fetchAppointments(
        loading: isLoading[AppointmentStatus.upcoming.index],
        params: {
          'page': 1,
          'status': AppointmentStatus.upcoming.index
        }).whenComplete(() => fetchAppointments(
            loading: isLoading[AppointmentStatus.completed.index],
            params: {'page': 1, 'status': AppointmentStatus.completed.index})
        .whenComplete(() => fetchAppointments(
            loading: isLoading[AppointmentStatus.canceled.index],
            params: {'page': 1, 'status': AppointmentStatus.canceled.index})));
  }

  Future<List<dynamic>> fetchAppointments(
      {required Map<String, dynamic> params, required RxBool loading}) async {
    var response = await Get.find<AppointmentApiService>()
        .fetchAppointments(params: params);
    loading(true);
    debugPrint("Appointments response $response");
    if (response == null) return [];

    for (var appointment in response.data['result']['data']) {
      appointments.add(Appointment.fromJson(appointment));
    }

    loading(false);

    return [];
  }
}
