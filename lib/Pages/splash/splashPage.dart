import 'package:ai_health_assistance/Pages/splash/controller/SplashPageUiController.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    SplashUiPageController controller = Get.put(SplashUiPageController());
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: PreferredSize(
        preferredSize: const Size(0, 0),
        child: AppBar(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: AppColors.primaryColor),
        ),
      ),
      body: Center(
        child: Lottie.asset('assets/animations/robot.json'),
      ),
    );
  }
}
