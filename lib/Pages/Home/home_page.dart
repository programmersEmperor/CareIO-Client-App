import 'package:ai_health_assistance/Components/SharedWidgets/main_app_bar.dart';
import 'package:ai_health_assistance/Pages/Home/UiController/home_page_controller.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController homePageController = Get.put(HomePageController());
    return Scaffold(
      extendBody: true,
      floatingActionButton: SizedBox(
        height: 42,
        width: 42,
        child: FloatingActionButton(
          child: const Text(
            "AI",
            style: TextStyle(fontSize: 10),
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
          iconSize: 17,
          gapLocation: GapLocation.center,
          height: 45,
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
            const MainAppBar(),
            Expanded(
              child: Obx(
                () => AnimatedSwitcher(
                    duration: 400.milliseconds,
                    switchOutCurve: Curves.linearToEaseOut,
                    switchInCurve: Curves.linearToEaseOut,
                    reverseDuration: 400.milliseconds,
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: Tween<double>(end: 1.0, begin: 0.0)
                            .animate(animation),
                        child: child,
                      );
                    },
                    child: homePageController
                        .pages[homePageController.activePage.value]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
