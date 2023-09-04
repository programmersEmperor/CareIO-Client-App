import 'package:ai_health_assistance/Pages/Home/animations/animation_handler.dart';
import 'package:ai_health_assistance/Pages/Home/customs/ai_intro_bottom_sheet.dart';
import 'package:ai_health_assistance/Pages/Home/customs/home_main_page.dart';
import 'package:ai_health_assistance/Pages/Home/customs/my_appoinments_page.dart';
import 'package:ai_health_assistance/Pages/Notifications/notifications_page.dart';
import 'package:ai_health_assistance/Pages/Search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomePageController extends GetxController
    with GetTickerProviderStateMixin {
  RxInt activePage = 0.obs;
  final List<IconData> icons = [
    Boxicons.bx_home_circle,
    Boxicons.bx_search,
    Boxicons.bx_calendar,
    Boxicons.bx_bell,
  ];

  late List<Widget> tabs;
  late TabController tabController;

  late HomeAnimationHandler animationHandler;

  late List<dynamic> pages;

  @override
  void onInit() {
    super.onInit();

    tabs = [
      Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Tab(
          text: "Upcoming",
          //  height: 30.sp,
        ),
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

    animationHandler = Get.put(HomeAnimationHandler());

    pages = [
      HomeMainPage(animationHandler: animationHandler),
      const SearchPage(),
      const MyAppointmentsPage(),
      const NotificationsPage(),
    ];
  }

  void changePage(int index) {
    activePage(index);
    debugPrint(index.toString());
  }

  void showBottomSheet(BuildContext context) {
    AnimationController controller =
        BottomSheet.createAnimationController(this);
    // Animation duration for displaying the BottomSheet
    controller.duration = const Duration(seconds: 1);
    // Animation duration for retracting the BottomSheet
    controller.reverseDuration = 300.milliseconds;
    // Set animation curve duration for the BottomSheet
    controller.drive(CurveTween(curve: Curves.fastEaseInToSlowEaseOut));
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.sp),
              topRight: Radius.circular(15.sp))),
      useSafeArea: true,
      transitionAnimationController: controller,
      constraints: BoxConstraints(maxHeight: 94.h),
      builder: (BuildContext context) {
        return const AiIntroBottomSheet();
      },
    );
  }
}
