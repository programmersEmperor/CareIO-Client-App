import 'package:ai_health_assistance/Pages/Home/animations/animation_handler.dart';
import 'package:ai_health_assistance/Pages/Home/customs/home_main_page.dart';
import 'package:ai_health_assistance/Pages/Home/customs/my_appoinments_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxInt activePage = 1.obs;
  final List<IconData> icons = [
    Boxicons.bx_list_check,
    Boxicons.bx_home_circle,
  ];

  late List<Widget> tabs;
  late TabController tabController;

  late HomeAnimationHandler animationHandler;

  late List<dynamic> pages;

  @override
  void onInit() {
    super.onInit();

    tabs = [
      const Tab(
        text: "Upcoming",
      ),
      const Tab(
        text: "Completed",
      ),
      const Tab(
        text: "Canceled",
      ),
    ];

    tabController = TabController(length: tabs.length, vsync: this);

    animationHandler = Get.put(HomeAnimationHandler());

    pages = [
      const MyAppointmentsPage(),
      HomeMainPage(animationHandler: animationHandler),
    ];
  }

  void changePage(int index) {
    activePage(index);
    debugPrint(index.toString());
  }
}
