import 'dart:async';

import 'package:ai_health_assistance/Pages/Authentication/introduction.dart';
import 'package:get/get.dart';

class SplashUiPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(2.seconds, () => Get.offAll(const IntroductionPage()));
  }
}
