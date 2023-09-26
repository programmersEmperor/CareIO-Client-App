import 'package:ai_health_assistance/Pages/Hospitals/hospitals_ui_controller.dart';
import 'package:ai_health_assistance/Pages/doctors/UiController/doctors_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

AppBar mainCategoryAppBar(GetxController? controller, String name) {
  return AppBar(
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        size: 15.sp,
      ),
      onPressed: () => Get.back(),
    ),
    title: Text(
      name,
      style: TextStyle(color: Colors.black54, fontSize: 15.sp),
    ),
    centerTitle: true,
    actions: [
      if (controller is HospitalsUiController) ...[
        IconButton(
          onPressed: () => controller.isList(!controller.isList.value),
          icon: Obx(
            () => controller.isList.isTrue
                ? Icon(
                    Icons.grid_view_rounded,
                    size: 17.sp,
                  )
                : Icon(
                    Icons.list_rounded,
                    size: 17.sp,
                  ),
          ),
        ),
      ],
      if (controller is DoctorsPageController) ...[
        IconButton(
          onPressed: () => controller.isList(!controller.isList.value),
          icon: Obx(
            () => controller.isList.isTrue
                ? Icon(
                    Icons.grid_view_rounded,
                    size: 17.sp,
                  )
                : Icon(
                    Icons.list_rounded,
                    size: 17.sp,
                  ),
          ),
        ),
      ],
    ],
  );
}
