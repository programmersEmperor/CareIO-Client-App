import 'package:ai_health_assistance/Components/SharedWidgets/back_circle_button.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/connectivity_widget.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/main_colored_button.dart';
import 'package:ai_health_assistance/Localization/app_strings.dart';
import 'package:ai_health_assistance/Models/Clinic.dart';
import 'package:ai_health_assistance/Models/Doctor.dart';
import 'package:ai_health_assistance/Pages/Clinics/clinics_ui_controller.dart';
import 'package:ai_health_assistance/Pages/Doctors/custom/doctor_list_widget.dart';
import 'package:ai_health_assistance/Pages/Doctors/custom/doctor_statics_divider.dart';
import 'package:ai_health_assistance/Pages/Home/custom/category_grid_element.dart';
import 'package:ai_health_assistance/Pages/Hospitals/custom/top_requested_doctors_card.dart';
import 'package:ai_health_assistance/Pages/Hospitals/hopitals_page.dart';
import 'package:ai_health_assistance/Pages/Hospitals/hospitals_ui_controller.dart';
import 'package:ai_health_assistance/Pages/doctors/custom/doctor_statics.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_animations/carousel_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sizer/sizer.dart';

class ClinicProfile extends StatelessWidget {
  static const id = "/clinicProfile";

  const ClinicProfile({super.key});

  @override
  Widget build(BuildContext context) {
    ClinicsUiController controller = Get.put(ClinicsUiController());

    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overflow) {
          overflow.disallowIndicator();
          return true;
        },
        child: ConnectivityWidget(
            child: Stack(
          children: [
            CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: 30.sp,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: AppColors.primaryColor,
                    statusBarIconBrightness: Brightness.light,
                  ),
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackCircleButton(),
                    ],
                  ),
                  backgroundColor: AppColors.primaryColor,
                  expandedHeight: 60.sp,
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 50.sp,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Card(
                                  elevation: 10.sp,
                                  shadowColor: Colors.blueGrey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.sp)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.sp),
                                    child: SizedBox(
                                      height: 90.sp,
                                      width: 90.sp,
                                      child: Padding(
                                        padding: const EdgeInsets.all(25),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: SvgPicture.asset(
                                              'assets/svgs/hospital_icon.svg',
                                              color: AppColors.primaryColor,
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.sp,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 4.sp),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            width: 20.sp,
                                          ),
                                          AutoSizeText(
                                            "${controller.clinic.name}",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 20.sp,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 4.sp,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.secondaryColor,
                                          borderRadius: BorderRadius.circular(5.sp)
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                                      child: Text(
                                        AppStrings.internalClinic.tr,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  RefreshIndicator(
                    color: AppColors.primaryColor,
                    onRefresh: () => Future.sync(
                      () => controller.pagingController.refresh(),
                    ),
                    child: Obx(() => ConnectivityWidget(
                          child: controller.isLoading.isTrue
                              ? SizedBox(
                                  height: 50.h,
                                  child: Center(
                                    child: SpinKitFadingCircle(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                )
                              : PagedListView<int, Doctor>(
                                  shrinkWrap: true,
                                  // physics: const NeverScrollableScrollPhysics(),
                                  builderDelegate:
                                      PagedChildBuilderDelegate<Doctor>(
                                    firstPageProgressIndicatorBuilder: (_) =>
                                        SpinKitFadingCircle(
                                      color: AppColors.primaryColor,
                                    ),
                                    itemBuilder: (context, item, index) =>
                                        DoctorListWidget(
                                      doctor: item,
                                    ),
                                  ),
                                  pagingController: controller.pagingController,
                                ),
                        )),
                  )
                ])), // SliverFillRemaining(
              ],
            ),
          ],
        )),
      ),
    );
  }
}
