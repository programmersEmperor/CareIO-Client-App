import 'package:ai_health_assistance/Components/SharedWidgets/main_category_appbar.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/refresh_indicator_widget.dart';
import 'package:ai_health_assistance/Constants/custom_search_bar.dart';
import 'package:ai_health_assistance/Pages/Hospitals/custom/hosptials_grid_view.dart';
import 'package:ai_health_assistance/Pages/Hospitals/custom/hosptials_list_view.dart';
import 'package:ai_health_assistance/Pages/Hospitals/hospitals_ui_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HospitalsPage extends StatelessWidget {
  static const id = "/hospitals";
  const HospitalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    HospitalsUiController uiController = Get.put(HospitalsUiController());
    return Scaffold(
      appBar: mainCategoryAppBar(uiController, 'Hospitals'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: Column(
          children: [
            CustomSearchBar(
              title: 'Find your hospital',
              controller: uiController,
            ),
            Expanded(
              child: Obx(
                () => AnimatedSwitcher(
                  duration: 500.milliseconds,
                  switchInCurve: Curves.linearToEaseOut,
                  switchOutCurve: Curves.linearToEaseOut,
                  child: RefreshWidget(
                    isLoading: uiController.isLoading,
                    onRefresh: () =>
                        uiController.fetchHealthCenters(isPagination: false),
                    child: uiController.isList.isTrue
                        ? HospitalListVIew(
                            healthCenters: uiController.healthCenters,
                          )
                        : HospitalGridView(
                            healthCenters: uiController.healthCenters,
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
