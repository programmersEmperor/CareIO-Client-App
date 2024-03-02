import 'package:ai_health_assistance/Components/SharedWidgets/back_circle_button.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/connectivity_widget.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/hospital_card.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/main_colored_button.dart';
import 'package:ai_health_assistance/Localization/app_strings.dart';
import 'package:ai_health_assistance/Pages/Doctors/controller/doctor_profile_ui_controller.dart';
import 'package:ai_health_assistance/Pages/Doctors/custom/day_timeslot_item.dart';
import 'package:ai_health_assistance/Pages/Doctors/custom/doctor_statics.dart';
import 'package:ai_health_assistance/Pages/Doctors/custom/doctor_statics_divider.dart';
import 'package:ai_health_assistance/Pages/Doctors/custom/experience_card.dart';
import 'package:ai_health_assistance/Pages/Hospitals/hospital_profile.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DoctorProfile extends StatelessWidget {
  static const id = "/DoctorProfile";
  final String index;
  const DoctorProfile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    DoctorProfileUiController controller = Get.put(DoctorProfileUiController());
    controller.getData();
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overflow) {
          overflow.disallowIndicator();
          return true;
        },
        child: ConnectivityWidget(
          child: Obx(
            () => controller.isLoading.isTrue
                ? Center(
                    child: SpinKitFadingCircle(
                      color: AppColors.primaryColor,
                    ),
                  )
                : Stack(
                    children: [
                      CustomScrollView(
                        physics: const ClampingScrollPhysics(),
                        slivers: [
                          SliverAppBar(
                            automaticallyImplyLeading: false,
                            toolbarHeight: 30.sp,
                            title: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BackCircleButton(),
                              ],
                            ),
                            pinned: true,
                            backgroundColor: AppColors.scaffoldColor,
                            expandedHeight: 220.sp,
                            flexibleSpace: FlexibleSpaceBar(
                              background: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Hero(
                                        tag: "doc$index",
                                        child: Card(
                                          elevation: 10.sp,
                                          shadowColor: Colors.blueGrey,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.sp)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15.sp),
                                            child: Image.asset(
                                              "assets/images/person.jpg",
                                              fit: BoxFit.cover,
                                              height: 90.sp,
                                              width: 90.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.sp,
                                      ),
                                      SizedBox(
                                        width: 45.w,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            AutoSizeText(
                                              "${controller.doctor.name}",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 4.sp),
                                              child: Text(
                                                controller
                                                    .doctor.specialism!.name,
                                                style: TextStyle(
                                                  fontSize: 8.sp,
                                                  color: Colors.black38,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 4.sp),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.orange,
                                                    size: 15.sp,
                                                  ),
                                                  Text(
                                                    "${controller.doctor.rating}",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 9.sp,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 70.sp,
                                                  ),
                                                  InkWell(
                                                    onTap:
                                                        controller.callDoctor,
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(5.sp),
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .primaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.sp)),
                                                      child: Icon(
                                                        Boxicons.bxs_phone_call,
                                                        color: Colors.white,
                                                        size: 15.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Visibility(
                                              visible: controller
                                                  .doctor.isRecommended,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 4.sp),
                                                child: Chip(
                                                  backgroundColor:
                                                      AppColors.secondaryColor,
                                                  label: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons.thumb_up,
                                                        color: AppColors
                                                            .primaryColor,
                                                        size: 10.sp,
                                                      ),
                                                      SizedBox(
                                                        width: 1.w,
                                                      ),
                                                      Text(
                                                        AppStrings
                                                            .recommended.tr,
                                                        style: TextStyle(
                                                            fontSize: 9.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: AppColors
                                                                .primaryColor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 30.sp, right: 30.sp, top: 30.sp),
                                    child: Container(
                                      padding: EdgeInsets.all(10.sp),
                                      decoration: BoxDecoration(
                                          color: AppColors.secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10.sp)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          DoctorStatics(
                                            title: AppStrings.experiences.tr,
                                            info: "+ years",
                                          ),
                                          const DoctorStaticsDivider(),
                                          DoctorStatics(
                                            title: AppStrings.certificates.tr,
                                            info:
                                                '${controller.doctor.rating} ct',
                                          ),
                                          const DoctorStaticsDivider(),
                                          DoctorStatics(
                                            title: AppStrings.totalBooking.tr,
                                            info:
                                                '${controller.doctor.completedAppointments} patient',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10.sp,
                                right: 10.sp,
                                top: 10.sp,
                                bottom: 60.sp,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 15.sp),
                                    child: Text(
                                      "${controller.doctor.description}",
                                      style: TextStyle(
                                          fontSize: 9.2.sp,
                                          color: Colors.black45),
                                    ),
                                  ),
                                  AutoSizeText(
                                    AppStrings.experiences.tr,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  Visibility(
                                    visible:
                                        controller.doctor.experience.isNotEmpty,
                                    child: Container(
                                      height: 24.h,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.sp),
                                      child: GridView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            controller.doctor.experience.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 1,
                                                mainAxisExtent: 60.w,
                                                mainAxisSpacing: 10),
                                        itemBuilder: (_, index) =>
                                            ExperienceCard(
                                                experience: controller
                                                    .doctor.experience[index]),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(12.sp),
                                    decoration: BoxDecoration(
                                        color: AppColors.secondaryColor,
                                        borderRadius:
                                            BorderRadius.circular(15.sp)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          AppStrings.youCanFindMe.tr,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 10.0.sp,
                                            bottom: 10.0.sp,
                                          ),
                                          child: SizedBox(
                                            child: InkWell(
                                              onTap: () => Get.toNamed(
                                                  HospitalProfile.id,
                                                  arguments: [
                                                    {'index': '1'}
                                                  ]),
                                              child: controller.doctor
                                                      .healthCenters.isNotEmpty
                                                  ? HospitalCard(
                                                      healthCenter: controller
                                                          .doctor
                                                          .healthCenters![0],
                                                    )
                                                  : const SizedBox(),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 2.sp),
                                          child: AutoSizeText(
                                            AppStrings.atTheseTimes.tr,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 10.sp),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.sp),
                                          child: SizedBox(
                                            height: 5.h,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: controller
                                                  .dayTimeSlotList.length,
                                              itemBuilder: (_, index) =>
                                                  DayTimeSLotItem(
                                                dayTimeSlot: controller
                                                    .dayTimeSlotList[index],
                                                onTap: () => controller
                                                    .onTapDayTimeSlot(index),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5.sp),
                                          child: Obx(
                                            () => AnimatedSwitcher(
                                              duration: 300.milliseconds,
                                              layoutBuilder: (child, list) {
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .centerStart,
                                                  child: child,
                                                );
                                              },
                                              child: controller
                                                  .activeTimeSlotWidget.value,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: SizedBox(
                            width: 90.w,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: MainColoredButton(
                                text: AppStrings.bookNow.tr,
                                onPress: () => controller.showBookingModal(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
