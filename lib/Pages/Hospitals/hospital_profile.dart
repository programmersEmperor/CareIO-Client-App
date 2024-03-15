import 'package:ai_health_assistance/Components/SharedWidgets/back_circle_button.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/connectivity_widget.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/main_colored_button.dart';
import 'package:ai_health_assistance/Localization/app_strings.dart';
import 'package:ai_health_assistance/Pages/Clinics/clinic_profile.dart';
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
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HospitalProfile extends StatelessWidget {
  static const id = "/hospitalProfile";
  final String index;
  const HospitalProfile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    HospitalsUiController controller = Get.put(HospitalsUiController());
    controller.showHealthCenter(Get.arguments[0]['index']);

    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overflow) {
          overflow.disallowIndicator();
          return true;
        },
        child: ConnectivityWidget(
          child: Obx(
            () => controller.profileLoading.isTrue
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Card(
                                            elevation: 10.sp,
                                            shadowColor: Colors.blueGrey,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.sp)),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.sp),
                                              child: Hero(
                                                tag:
                                                    "hospital${controller.healthCenter.id}",
                                                child: controller.healthCenter
                                                            .avatar !=
                                                        null
                                                    ? CachedNetworkImage(
                                                        imageUrl:
                                                            '${controller.healthCenter.avatar}',
                                                        fit: BoxFit.cover,
                                                        height: 90.sp,
                                                        width: 90.sp,
                                                      )
                                                    : Image.asset(
                                                        "assets/images/hosptial.jpg",
                                                        fit: BoxFit.cover,
                                                        height: 90.sp,
                                                        width: 90.sp,
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.orange,
                                                      size: 15.sp,
                                                    ),
                                                    Text(
                                                      "${controller.healthCenter.rating}",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 9.sp,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20.sp,
                                                    ),
                                                    AutoSizeText(
                                                      "${controller.healthCenter.name}",
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 20.sp,
                                                    ),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        padding: EdgeInsets.all(
                                                            5.sp),
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .primaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.sp)),
                                                        child: Icon(
                                                          Boxicons
                                                              .bxs_phone_call,
                                                          color: Colors.white,
                                                          size: 15.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 4.sp,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.location_pin,
                                                      size: 10.sp,
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                                    SizedBox(
                                                      width: 5.sp,
                                                    ),
                                                    Text(
                                                      "${controller.healthCenter.address}",
                                                      style: TextStyle(
                                                          fontSize: 10.sp,
                                                          color:
                                                              Colors.black38),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 50.sp, right: 50.sp, top: 30.sp),
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(10.sp),
                                    decoration: BoxDecoration(
                                        color: AppColors.secondaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10.sp)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              AppStrings.totalBooking.tr,
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.sp,
                                            ),
                                            Text(
                                              controller.healthCenter.completedAppointment.toString(),
                                              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold ),
                                            ),
                                          ],
                                        ),
                                        // const DoctorStaticsDivider(),
                                        // DoctorStatics(
                                        //   title: AppStrings.totalBooking.tr,
                                        //   info: '230 patient',
                                        // ),

                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 15.sp,
                                          left: 10.sp,
                                          right: 10.sp),
                                      child: AutoSizeText(
                                        AppStrings.topDoctors.tr,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 10.sp),
                                      ),
                                    ),
                                    Visibility(
                                      visible: controller
                                          .healthCenter.doctor.isNotEmpty,
                                      child: SizedBox(
                                        height: 180,
                                        child: Swiper(
                                          itemCount: controller.healthCenter.doctor.length,
                                          autoplayDelay: 6000,
                                          duration: 3000,
                                          autoplay: true,
                                          itemBuilder: (_, index) =>
                                              TopRequestedDoctorsCard(
                                            doctor: controller
                                                .healthCenter.doctor[index],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10.sp,
                                        right: 10.sp,
                                        top: 10.sp,
                                        bottom: 80.sp,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            AppStrings.clinics.tr,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 10.sp),
                                          ),

                                          Visibility(
                                            visible: controller.healthCenter
                                                .clinics.isNotEmpty,
                                            child: GridView.builder(
                                              itemCount: controller
                                                  .healthCenter.clinics.length,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.sp),
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (_, index) =>
                                                  CategoryGridElement(
                                                title: controller.healthCenter
                                                        .clinics[index].name ??
                                                    "",
                                                desc: AppStrings
                                                    .findYourHospital.tr,
                                                onTap: () => Get.toNamed(ClinicProfile.id, arguments: [{
                                                  'clinic' : controller.healthCenter.clinics[index]
                                                }]),
                                                iconPath:
                                                    "assets/svgs/hospital_icon.svg",
                                              ),
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 4,
                                              ),
                                              shrinkWrap: true,
                                            ),
                                          ),

                                          // AutoSizeText(
                                          //   "Timeslots",
                                          //   style: TextStyle(
                                          //       fontWeight: FontWeight.w900,
                                          //       fontSize: 10.sp),
                                          // ),
                                          // Padding(
                                          //   padding: EdgeInsets.only(top: 8.sp),
                                          //   child: SizedBox(
                                          //     height: 5.h,
                                          //     child: ListView.builder(
                                          //       scrollDirection: Axis.horizontal,
                                          //       itemCount: controller
                                          //           .dayTimeSlotList.length,
                                          //       itemBuilder: (_, index) =>
                                          //           DayTimeSLotItem(
                                          //         dayTimeSlot: controller
                                          //             .dayTimeSlotList[index],
                                          //         onTap: () => controller
                                          //             .onTapDayTimeSlot(index),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                          // Padding(
                                          //   padding: EdgeInsets.only(top: 10.sp),
                                          //   child: Obx(
                                          //     () => AnimatedSwitcher(
                                          //       duration: 300.milliseconds,
                                          //       layoutBuilder: (child, list) {
                                          //         return Align(
                                          //           alignment:
                                          //               AlignmentDirectional
                                          //                   .centerStart,
                                          //           child: child,
                                          //         );
                                          //       },
                                          //       child: controller
                                          //           .activeTimeSlotWidget.value,
                                          //     ),
                                          //   ),
                                          // ),
                                          //

                                          Padding(
                                            padding:
                                                EdgeInsets.only(top: 18.sp),
                                            child: AutoSizeText(
                                              AppStrings.location.tr,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 10.sp),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(top: 18.sp),
                                            child: SizedBox(
                                              width: 100.w,
                                              height: 25.h,
                                              child: Card(
                                                color: Colors.white,
                                                elevation: 15.sp,
                                                shadowColor: AppColors
                                                    .secondaryColor
                                                    .withOpacity(0.4),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.sp),
                                                ),
                                                child: Center(
                                                  child: Text('data'),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Positioned(
                      //   bottom: 0,
                      //   left: 0,
                      //   right: 0,
                      //   child: Center(
                      //     child: SizedBox(
                      //       width: 90.w,
                      //       child: Padding(
                      //         padding: const EdgeInsets.symmetric(vertical: 20),
                      //         child: MainColoredButton(
                      //           text: AppStrings.bookNow.tr,
                      //           onPress: () {},
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
