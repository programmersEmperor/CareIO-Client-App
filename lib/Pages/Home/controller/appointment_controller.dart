import 'package:ai_health_assistance/Models/Appointment.dart';
import 'package:ai_health_assistance/Pages/Home/custom/cancel_appointment_confirm_sheet.dart';
import 'package:ai_health_assistance/Pages/Home/custom/reschedule_appointment_sheet.dart';
import 'package:ai_health_assistance/Services/Api/appointment.dart';
import 'package:ai_health_assistance/Utils/appointment_enum.dart';
import 'package:ai_health_assistance/Utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController
    with GetTickerProviderStateMixin {
  late List<Widget> tabs;
  late TabController tabController;
  RxList<Appointment> appointments = <Appointment>[].obs;

  final AppointmentApiService _apiService = Get.find<AppointmentApiService>();

  RxBool cancelLoading = false.obs;

  RxList<Appointment> get upcomingAppointments => appointments
      .where((element) => element.status == AppointmentStatus.upcoming.index)
      .toList()
      .obs;

  RxList<Appointment> get completedAppointments => appointments
      .where((element) => element.status == AppointmentStatus.completed.index)
      .toList()
      .obs;

  RxList<Appointment> get canceledAppointments => appointments
      .where((element) => element.status == AppointmentStatus.canceled.index)
      .toList()
      .obs;

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
      appointments.removeWhere((element) => element.status == status.index);
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
    loading(true);
    var response = await _apiService.fetchAppointments(params: params);

    debugPrint("Appointments response $response");
    if (response == null) return [];

    for (var appointment in response.data['result']['data']) {
      appointments.add(Appointment.fromJson(appointment));
    }

    debugPrint(appointments.length.toString());

    loading(false);

    return [];
  }

  void confirmCancelAppointment({required int id}) {
    Get.bottomSheet(CancelAppointmentConfirmSheet(
        loading: cancelLoading,
        onTap: () => cancelAppointment(id: id),
        appointment: appointments.where((p0) => id == p0.id).first));
  }

  void confirmRescheduleAppointment({required int id}) {
    Get.bottomSheet(
      RescheduleAppointmentConfirmSheet(
          loading: cancelLoading,
          onTap: () => cancelAppointment(id: id),
          appointment: appointments.where((p0) => id == p0.id).first),
      isScrollControlled: true,
    );
  }

  void cancelAppointment({required int id}) async {
    if (cancelLoading.isTrue) return;

    cancelLoading(true);
    var response = await _apiService.cancelAppointment(id: id);
    cancelLoading(false);
    if (response == null) return;

    if (response.data['result'].isEmpty) {
      appointments.removeWhere((element) => element.id == id);
      Get.close(0);
      showSnack(
          title: "Appointment canceled",
          description: "Your appointment has been canceled");
    }
  }
}
