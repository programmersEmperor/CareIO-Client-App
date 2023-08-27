import 'package:ai_health_assistance/Constants/custom_search_bar.dart';
import 'package:ai_health_assistance/Pages/doctors/UiController/DoctorsPageController.dart';
import 'package:ai_health_assistance/Pages/doctors/customs/doctor_grid_view.dart';
import 'package:ai_health_assistance/Pages/doctors/customs/doctor_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DoctorsPage extends StatelessWidget {
  static const id = "/DoctorsPage";
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    DoctorsPageController controller = Get.put(DoctorsPageController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 15.sp,
          ),
          onPressed: () => Get.back(),
        ),
        title: const Text("Doctors"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => controller.isList(!controller.isList.value),
              icon: Obx(() => controller.isList.isTrue
                  ? const Icon(Icons.grid_view_rounded)
                  : const Icon(Icons.list_rounded)))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: Column(
          children: [
            const CustomSearchBar(),
            Expanded(
              child: Obx(
                () => AnimatedSwitcher(
                  duration: 500.milliseconds,
                  switchInCurve: Curves.linearToEaseOut,
                  switchOutCurve: Curves.linearToEaseOut,
                  child: controller.isList.isTrue
                      ? const DoctorsListView()
                      : const DoctorGridView(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
