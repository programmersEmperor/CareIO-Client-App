import 'dart:async';

import 'package:ai_health_assistance/Localization/localization_helper.dart';
import 'package:ai_health_assistance/Pages/Authentication/introduction.dart';
import 'package:ai_health_assistance/Pages/Home/home_page.dart';
import 'package:ai_health_assistance/Services/CachingService/user_session.dart';
import 'package:get/get.dart';

class SplashUiPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(3.seconds, () async {
      Get.find<LocalizationHelper>()
          .appliedLocale(await Get.find<UserSession>().getLocale());
      Get.updateLocale(Get.find<LocalizationHelper>().appliedLocale.value);
      if (await Get.find<UserSession>().getPatient()) {
        if (Get.find<UserSession>().patient.name != "") {
          Get.offAllNamed(HomePage.id);
        } else {
          Get.offAll(() => const IntroductionPage());
        }
      } else {
        Get.offAll(() => const IntroductionPage());
      }
    });
  }
}
