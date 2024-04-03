import 'package:ai_health_assistance/Components/SharedWidgets/no_data_widget.dart';
import 'package:ai_health_assistance/Models/Doctor.dart';
import 'package:ai_health_assistance/Pages/Doctors/controller/doctors_page_controller.dart';
import 'package:ai_health_assistance/Pages/Doctors/custom/doctor_list_widget.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sizer/sizer.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctor> doctors;
  const DoctorsListView({
    super.key,
    required this.doctors,
  });

  @override
  Widget build(BuildContext context) {
    DoctorsPageController controller = Get.find<DoctorsPageController>();
    return Padding(
      padding: EdgeInsets.only(bottom: 0.sp),
      child: RefreshIndicator(
        onRefresh: () =>
            Future.sync(() => controller.pagingController.refresh()),
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
              child: NoDataWidget(message: "No Doctors Yet!", top: 0),
            ),
            itemBuilder: (context, item, index) => DoctorListWidget(
              doctor: item,
            ),
          ),
          pagingController: controller.pagingController,
        ),
      ),
    );
  }
}
