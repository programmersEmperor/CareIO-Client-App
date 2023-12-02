import 'package:ai_health_assistance/Components/SharedWidgets/main_category_appbar.dart';
import 'package:ai_health_assistance/Constants/custom_search_bar.dart';
import 'package:ai_health_assistance/Pages/Doctors/controller/doctors_page_controller.dart';
import 'package:ai_health_assistance/Pages/Doctors/custom/doctor_grid_view.dart';
import 'package:ai_health_assistance/Pages/Doctors/custom/doctor_list_view.dart';
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
      appBar: mainCategoryAppBar(controller, 'Doctors'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: Column(
          children: [
            CustomSearchBar(
              title: 'Find your doctor',
              controller: controller,
            ),
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
