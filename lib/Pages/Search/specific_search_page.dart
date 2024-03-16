import 'package:ai_health_assistance/Components/SharedWidgets/connectivity_widget.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/hospital_card.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/main_category_appbar.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/rounded_text_field.dart';
import 'package:ai_health_assistance/Localization/app_strings.dart';
import 'package:ai_health_assistance/Models/Doctor.dart';
import 'package:ai_health_assistance/Models/HealthCenter.dart';
import 'package:ai_health_assistance/Pages/Doctors/custom/doctor_list_widget.dart';
import 'package:ai_health_assistance/Pages/Search/controller/specific_search_controller.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SpecificSearchPage extends StatelessWidget {
  static const id = "/SpecificSearchPage";
  const SpecificSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    SpecificSearchController controller = Get.put(SpecificSearchController());
    return Scaffold(
      appBar: mainCategoryAppBar(
          null,
          controller.isDoctor
              ? AppStrings.searchInDoctors.tr
              : AppStrings.searchInHealthCenters.tr),
      body: ConnectivityWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            slivers: [
              SliverToBoxAdapter(
                child: RoundedTextField(
                  controller: controller.textEditingController,
                  onChange: controller.filterSearchResults,
                  showAttachment: false,
                  name: "search",
                  hint: AppStrings.searchHint.tr,
                ),
              ),
              if (!controller.isDoctor) ...[
                PagedSliverList<int, HealthCenter>(
                  builderDelegate: PagedChildBuilderDelegate<HealthCenter>(
                    firstPageProgressIndicatorBuilder: (_) =>
                        SpinKitFadingCircle(
                          color: AppColors.primaryColor,
                        ),
                    itemBuilder: (context, item, index) => HospitalCard(
                      healthCenter: item,
                    ),
                  ),
                  pagingController: controller.hospitalsUiController.pagingController,
                ),
              ]
              else ...[
                PagedSliverList<int, Doctor>(
                  builderDelegate: PagedChildBuilderDelegate<Doctor>(
                    firstPageProgressIndicatorBuilder: (_) =>
                        SpinKitFadingCircle(
                          color: AppColors.primaryColor,
                        ),
                    itemBuilder: (context, item, index) => DoctorListWidget(
                      doctor: item,
                    ),
                  ),
                  pagingController:
                  controller.doctorsPageController.pagingController,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
