import 'package:ai_health_assistance/Components/SharedWidgets/connectivity_widget.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/main_category_appbar.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/no_data_widget.dart';
import 'package:ai_health_assistance/Constants/custom_search_bar.dart';
import 'package:ai_health_assistance/Localization/app_strings.dart';
import 'package:ai_health_assistance/Models/Doctor.dart';
import 'package:ai_health_assistance/Pages/Doctors/controller/doctors_page_controller.dart';
import 'package:ai_health_assistance/Pages/Doctors/custom/doctor_list_widget.dart';
import 'package:ai_health_assistance/Services/connectivityService/connectivity_service.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sizer/sizer.dart';

class DoctorsPage extends StatelessWidget {
  static const id = "/DoctorsPage";
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    DoctorsPageController controller = Get.put(DoctorsPageController());
    return Scaffold(
      appBar: mainCategoryAppBar(controller, AppStrings.doctors.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: Column(
          children: [
            CustomSearchBar(
              title: AppStrings.findYourDoctor.tr,
              controller: controller,
              isDoctor: true,
            ),
            Expanded(
              child: RefreshIndicator(
                color: AppColors.primaryColor,
                onRefresh: () async {
                  await Get.find<ConnectivityHandler>().refreshOnline();
                  controller.pagingController.refresh();
                },
                child: ConnectivityWidget(
                  child: PagedListView<int, Doctor>(
                    builderDelegate: PagedChildBuilderDelegate<Doctor>(
                      newPageProgressIndicatorBuilder: (_)=> Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SpinKitFadingCircle(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      animateTransitions: true,
                      noItemsFoundIndicatorBuilder: (_)=> Center(
                        child: NoDataWidget(message: AppStrings.noDoctorsYet.tr, top: 0),
                      ),
                      firstPageProgressIndicatorBuilder: (_) =>
                          SpinKitFadingCircle(
                        color: AppColors.primaryColor,
                      ),
                      itemBuilder: (context, item, index) => DoctorListWidget(
                        doctor: item,
                      ),
                    ),
                    pagingController: controller.pagingController,
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
