import 'package:ai_health_assistance/Pages/Home/UiController/home_page_controller.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<IconData> icons = [
    Boxicons.bx_list_check,
    Boxicons.bx_home_circle,
  ];

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
          icons: icons,
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
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 15.sp),
        child: Column(
          children: [
            SlideTransition(
              position: homePageController.animationHandler.aiCardAnimation,
              child: Padding(
                padding: EdgeInsets.only(top: 25.sp, bottom: 5.sp),
                child: SizedBox(
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Colors.grey.shade400,
                              spreadRadius: 5,
                            )
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 22.0,
                          backgroundImage:
                              AssetImage("assets/images/person.jpg"),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Good morning ",
                                style: TextStyle(
                                    fontSize: 11.sp, color: Colors.black54),
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
                  duration: 750.milliseconds,
                  switchOutCurve: Curves.fastEaseInToSlowEaseOut,
                  switchInCurve: Curves.fastLinearToSlowEaseIn,
                  transitionBuilder: (child, animation) => ScaleTransition(
                        scale: Tween<double>(end: 1.0, begin: 0.9)
                            .animate(animation),
                        child: FadeTransition(opacity: animation, child: child),
                      ),
                  child: homePageController
                      .pages[homePageController.activePage.value]),
            )),
          ],
        ),
      ),
    );
  }
}
