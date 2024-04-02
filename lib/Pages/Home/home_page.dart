import 'package:ai_health_assistance/Components/SharedWidgets/main_app_bar.dart';
import 'package:ai_health_assistance/Pages/Home/controller/home_page_controller.dart';
import 'package:ai_health_assistance/Pages/Profile/controller/profile_page_controller.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  static const id = '/Home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfilePageController profilePageController = Get.put(ProfilePageController());
    profilePageController.refreshPatientData();
    HomePageController homePageController = Get.put(HomePageController());
    return Scaffold(
      extendBody: true,
      floatingActionButton: SizedBox(
        height: 39.sp,
        width: 39.sp,
        child: FloatingActionButton(
          child: Lottie.asset(
            'assets/animations/lines.json',
            fit: BoxFit.fill,
            height: 10.h,
          ),
          onPressed: () => homePageController.showBottomSheet(context),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar(
          icons: homePageController.icons,
          activeIndex: homePageController.activePage.value,
          activeColor: AppColors.primaryColor,
          inactiveColor: Colors.black45,
          iconSize: 23,
          gapLocation: GapLocation.center,
          height: 51,
          notchSmoothness: NotchSmoothness.defaultEdge,
          leftCornerRadius: 10,
          rightCornerRadius: 10,
          onTap: homePageController.changePage,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        child: Column(
          children: [
            Obx(() => MainAppBar(
              patient: homePageController.patient.value,
            )),
            Expanded(
              child: Obx(
                () => AnimatedSwitcher(
                  duration: 300.milliseconds,
                  switchOutCurve: Curves.linear,
                  switchInCurve: Curves.linear,
                  reverseDuration: 300.milliseconds,
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: Tween<double>(end: 1.0, begin: 0.0)
                          .animate(animation),
                      child: child,
                    );
                  },
                  child: homePageController.pages[homePageController.activePage.value],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
