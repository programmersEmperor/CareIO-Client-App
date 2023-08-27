import 'package:ai_health_assistance/Pages/Home/UiController/home_page_controller.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController homePageController = Get.put(HomePageController());
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        child: const Text("AI"),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar(
          icons: homePageController.icons,
          activeIndex: homePageController.activePage.value,
          activeColor: Theme.of(context).primaryColor,
          iconSize: 20.sp,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 10.sp,
          rightCornerRadius: 10.sp,
          onTap: homePageController.changePage,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.sp,
        ),
        child: Column(
          children: [
            SlideTransition(
              position: homePageController.animationHandler.aiCardAnimation,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 25.sp, bottom: 5.sp, right: 15.sp, left: 15.sp),
                child: SizedBox(
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 22.0,
                          backgroundImage:
                              AssetImage("assets/images/person.jpg"),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Good morning ",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 1.sp),
                                child: Text(
                                  "Haitham Hussien",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Badge(child: Icon(Boxicons.bx_bell)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: Obx(
              () => AnimatedSwitcher(
                  duration: 400.milliseconds,
                  switchOutCurve: Curves.linearToEaseOut,
                  switchInCurve: Curves.linearToEaseOut,
                  transitionBuilder: (child, animation) {
                    return SlideTransition(
                      position: Tween<Offset>(
                              begin: const Offset(10, 0.0),
                              end: const Offset(0, 0))
                          .animate(animation),
                      child: child,
                    );
                  },
                  child: homePageController
                      .pages[homePageController.activePage.value]),
            )),
          ],
        ),
      ),
    );
  }
}
