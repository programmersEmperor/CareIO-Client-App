import 'dart:developer';

import 'package:ai_health_assistance/Models/HomeInfo.dart';
import 'package:ai_health_assistance/Models/Plan.dart';
import 'package:ai_health_assistance/Models/Specialism.dart';
import 'package:ai_health_assistance/Models/Wallet.dart';
import 'package:ai_health_assistance/Models/client.dart';
import 'package:ai_health_assistance/Pages/AiAssistance/chatbot_page.dart';
import 'package:ai_health_assistance/Pages/Home/animations/animation_handler.dart';
import 'package:ai_health_assistance/Pages/Home/custom/ai_intro_bottom_sheet.dart';
import 'package:ai_health_assistance/Pages/Home/custom/map_bottom_sheet.dart';
import 'package:ai_health_assistance/Pages/Home/home_main_page.dart';
import 'package:ai_health_assistance/Pages/Home/my_appoinments_page.dart';
import 'package:ai_health_assistance/Pages/Notifications/notifications_page.dart';
import 'package:ai_health_assistance/Pages/Profile/profile_page.dart';
import 'package:ai_health_assistance/Services/Api/home.dart';
import 'package:ai_health_assistance/Services/Api/patient.dart';
import 'package:ai_health_assistance/Services/Api/specializations.dart';
import 'package:ai_health_assistance/Services/Api/wallets.dart';
import 'package:ai_health_assistance/Services/CachingService/user_session.dart';
import 'package:ai_health_assistance/Services/connectivityService/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomePageController extends GetxController
    with GetTickerProviderStateMixin {
  RxInt activePage = 0.obs;
  Rx<Patient> patient = Get.find<UserSession>().patient.obs;
  final List<IconData> icons = [
    Boxicons.bx_home_circle,
    Boxicons.bx_calendar,
    Boxicons.bx_bell,
    Boxicons.bx_user,
  ];

  HomeApiService apiService = Get.find<HomeApiService>();
  WalletsApiService walletsApiService = Get.find<WalletsApiService>();
  PatientApiService patientApiService = Get.find<PatientApiService>();
  SpecializationApiService specializationApiService =
      Get.find<SpecializationApiService>();

  RxBool get isLoading => apiService.isLoading;
  RxBool get walletIsLoading => walletsApiService.isLoading;

  late HomeAnimationHandler animationHandler;

  List<dynamic> pages = [
    const HomeMainPage(),
    const MyAppointmentsPage(),
    const NotificationsPage(),
    const ProfilePage(),
  ];
  late HomeInfo homeInfo;

  @override
  void onInit() async {
    super.onInit();

    animationHandler = Get.put(HomeAnimationHandler());

    await fetchHomeInfo();
    await fetchWallets();
    await fetchPlans();
  }

  Future<void> fetchPlans() async {
    var response = await patientApiService.getPlans();
    if (response == null) return;
    debugPrint("Response is ${response.data['result']}");

    List<Plan> plans = [];
    response.data['result'].forEach((e) => plans.add(Plan.fromJson(e)));
    Get.find<UserSession>().plans = plans;
  }

  void changePage(int index) {
    activePage(index);
    debugPrint(index.toString());
  }

  Future<void> fetchHomeInfo() async {
    await Get.find<ConnectivityHandler>().refreshOnline();
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

  Future<void> fetchSpecializations() async {
    var response = await specializationApiService.fetchSpecializations();
    log(response.toString());
    if (response == null) return;

    List<Specialism> specializations = [];
    response.data['result']
        .forEach((e) => specializations.add(Specialism.fromJson(e)));
    Get.find<UserSession>().specializations = specializations;
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
