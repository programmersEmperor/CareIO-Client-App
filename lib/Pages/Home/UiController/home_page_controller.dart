import 'package:ai_health_assistance/Pages/Home/animations/animation_handler.dart';
import 'package:ai_health_assistance/Pages/Home/customs/home_main_page.dart';
import 'package:ai_health_assistance/Pages/Home/customs/my_appoinments_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxInt activePage = 1.obs;

  late HomeAnimationHandler animationHandler;

  late List<dynamic> pages;

  @override
  void onInit() {
    super.onInit();

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
