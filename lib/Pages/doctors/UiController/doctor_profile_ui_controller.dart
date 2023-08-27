import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DoctorProfileUiController extends GetxController {
  late ScrollController scrollController;
  RxDouble height = 63.h.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    triggerScrollAction();
  }

  void triggerScrollAction() {
    /*  scrollController.addListener(() {
      debugPrint(scrollController.offset.toString());
      if (scrollController.offset > 0.0) {
        height.value++;
      } else if (scrollController.offset < 0.0) {
        height.value--;
      } else {
        height.value = 63.h;
      }
    });*/
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
