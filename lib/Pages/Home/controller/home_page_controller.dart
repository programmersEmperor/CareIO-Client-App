import 'dart:developer';

import 'package:ai_health_assistance/Models/HomeInfo.dart';
import 'package:ai_health_assistance/Models/Wallet.dart';
import 'package:ai_health_assistance/Models/client.dart';
import 'package:ai_health_assistance/Pages/AiAssistance/chatbot_page.dart';
import 'package:ai_health_assistance/Pages/Home/animations/animation_handler.dart';
import 'package:ai_health_assistance/Pages/Home/custom/ai_intro_bottom_sheet.dart';
import 'package:ai_health_assistance/Pages/Home/custom/map_bottom_sheet.dart';
import 'package:ai_health_assistance/Pages/Home/home_main_page.dart';
import 'package:ai_health_assistance/Pages/Home/my_appoinments_page.dart';
import 'package:ai_health_assistance/Pages/Notifications/notifications_page.dart';
import 'package:ai_health_assistance/Pages/Search/search_page.dart';
import 'package:ai_health_assistance/Services/Api/home.dart';
import 'package:ai_health_assistance/Services/Api/wallets.dart';
import 'package:ai_health_assistance/Services/CachingService/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomePageController extends GetxController
    with GetTickerProviderStateMixin {
  RxInt activePage = 0.obs;
  Patient patient = Get.find<UserSession>().patient;
  final List<IconData> icons = [
    Boxicons.bx_home_circle,
    Boxicons.bx_search,
    Boxicons.bx_calendar,
    Boxicons.bx_bell,
  ];

  HomeApiService apiService = Get.find<HomeApiService>();
  WalletsApiService walletsApiService = Get.find<WalletsApiService>();

  RxBool get isLoading => apiService.isLoading;
  RxBool get walletIsLoading => walletsApiService.isLoading;

  late HomeAnimationHandler animationHandler;

  List<dynamic> pages = [
    const HomeMainPage(),
    const SearchPage(),
    const MyAppointmentsPage(),
    const NotificationsPage(),
  ];
  late HomeInfo homeInfo;

  @override
  void onInit() async {
    super.onInit();

    animationHandler = Get.put(HomeAnimationHandler());

    await fetchHomeInfo();
    await fetchWallets();
  }

  void changePage(int index) {
    activePage(index);
    debugPrint(index.toString());
  }

  Future<void> fetchHomeInfo() async {
    var response = await apiService.fetchHomeInfo(body: {'page': 1});
    if (response == null) return;
    debugPrint("Response is ${response.data['result']}");

    homeInfo = HomeInfo.fromJson(response.data['result']);
  }

  Future<void> fetchWallets() async {
    var response = await walletsApiService.fetchWallets();
    log(response.toString());
    if (response == null) return;

    List<Wallet> wallets = [];
    response.data['result'].forEach((e) => wallets.add(Wallet.fromJson(e)));
    Get.find<UserSession>().wallets = wallets;
  }

  void showMapBottomSheet(BuildContext context) {
    AnimationController controller =
        BottomSheet.createAnimationController(this);

    controller.duration = 600.milliseconds;

    controller.reverseDuration = 300.milliseconds;

    controller.drive(CurveTween(curve: Curves.bounceInOut));
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
        return const MapBottomSheet();
      },
    );
  }

  void showBottomSheet(BuildContext context) {
    if (Get.find<UserSession>().userOpenedChat) {
      Get.toNamed(ChatBotPage.id);
      return;
    }
    AnimationController controller =
        BottomSheet.createAnimationController(this);

    controller.duration = 600.milliseconds;

    controller.reverseDuration = 300.milliseconds;

    controller.drive(CurveTween(curve: Curves.bounceInOut));
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
