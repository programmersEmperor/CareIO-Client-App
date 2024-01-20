import 'package:ai_health_assistance/Services/Api/appointment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController
    with GetTickerProviderStateMixin {
  late List<Widget> tabs;
  late TabController tabController;

  List<int> pages = [1, 1, 1];

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

    fetchAppointments(params: {'page': 1, 'status': 0});

    super.onInit();
  }

  Future<List<dynamic>> fetchAppointments(
      {required Map<String, dynamic> params}) async {
    var appointments = await Get.find<AppointmentApiService>()
        .fetchAppointments(params: params);
    debugPrint("Appointments response $appointments");
    return [];
  }
}
