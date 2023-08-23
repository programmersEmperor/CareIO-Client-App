import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../Pages/OnBoarding/customs/step_one.dart';

class OnBoardingController extends GetxController {
  RxBool startWidgetSwitcher = false.obs;
  RxBool startSlide = false.obs;
  Rx<Widget> activeSwitcherWidget = const SizedBox().obs;

  late VideoPlayerController videoPlayerController;

  @override
  void onInit() {
    super.onInit();
    initializeVideoPlayerController();
    initializeOnboardingSteps();
  }

  void initializeVideoPlayerController() {}

  void initializeOnboardingSteps() {
    Timer.periodic(1.seconds, (timer) {
      activeSwitcherWidget = const SizedBox(
        child: StepOne(),
      ).obs;
    });
  }

  void changeStep(Widget child) {
    debugPrint("Test");
    activeSwitcherWidget = SizedBox(
      child: child,
    ).obs;
    update();
  }
}
