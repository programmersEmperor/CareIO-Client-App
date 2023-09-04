import 'package:ai_health_assistance/Pages/Home/UiController/home_page_controller.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController homePageController = Get.put(HomePageController());
    return Scaffold(
      extendBody: true,
      floatingActionButton: SizedBox(
        height: 42.sp,
        width: 42.sp,
        child: FloatingActionButton(
          child: Text(
            "AI",
            style: TextStyle(fontSize: 10.sp),
          ),
          onPressed: () => homePageController.showBottomSheet(context),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar(
          icons: homePageController.icons,
          activeIndex: homePageController.activePage.value,
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: Colors.black45,
          iconSize: 17.sp,
          gapLocation: GapLocation.center,
          height: 40.sp,
          notchSmoothness: NotchSmoothness.defaultEdge,
          leftCornerRadius: 10.sp,
          rightCornerRadius: 10.sp,
          onTap: homePageController.changePage,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: 10.sp,
        ),
        child: Column(
          children: [
            SlideTransition(
              position: homePageController.animationHandler.aiCardAnimation,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 25.sp, bottom: 0.sp, right: 15.sp, left: 15.sp),
                child: SizedBox(
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/person.jpg"),
                              fit: BoxFit.cover,
                            )),
                        height: 30.sp,
                        width: 30.sp,
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
                                    fontSize: 9.5.sp,
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w300),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3.sp),
                                child: Text(
                                  "Haitham Hussien",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              'Sana,a',
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.black54),
                            ),
                            Icon(
                              Icons.location_on_outlined,
                              size: 15.sp,
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
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
