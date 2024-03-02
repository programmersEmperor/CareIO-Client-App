import 'package:ai_health_assistance/Localization/app_strings.dart';
import 'package:ai_health_assistance/Pages/Profile/controller/profile_page_controller.dart';
import 'package:ai_health_assistance/Pages/Profile/custom/profile_item.dart';
import 'package:ai_health_assistance/Pages/Profile/profile_edit.dart';
import 'package:ai_health_assistance/Pages/Profile/settings.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatelessWidget {
  static const id = "/profilePage";
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfilePageController controller = Get.put(ProfilePageController());

    return Scaffold(
      body: SizedBox(
        height: 100.h,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  left: 20.sp, right: 20.sp, bottom: 40.sp, top: 0.sp),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: 80.h,
                  width: 95.w,
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(-3, -5),
                        blurRadius: 39,
                        spreadRadius: -3,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.sp),
                      topRight: Radius.circular(20.sp),
                    ),
                  ),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 11.sp,
                      ),
                      Stack(
                        children: [
                          Lottie.asset('assets/animations/lines.json'),
                          if (controller.patient.avatar.isEmpty) ...[
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 80.sp,
                                height: 80.sp,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/images/person.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ] else ...[
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 80.sp,
                                height: 80.sp,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        controller.patient.avatar),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      Text(
                        controller.patient.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.sp,
                      ),
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.black38,
                              size: 15.sp,
                            ),
                            SizedBox(
                              width: 5.sp,
                            ),
                            Text(
                              controller.patient.phone,
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Card(
                                color: AppColors.primaryColor,
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11.sp)),
                                shadowColor: AppColors.primaryColor,
                                child: Stack(
                                  children: [
                                    PositionedDirectional(
                                      end: 0,
                                      child: Icon(
                                        Icons.messenger_outline_rounded,
                                        color: Colors.white.withOpacity(0.1),
                                        size: 70.sp,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "${controller.patient.messageBalance}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 2.sp,
                                          ),
                                          Text(
                                            AppStrings.messageCount.tr,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                color: AppColors.secondaryColor,
                                elevation: 10,
                                shadowColor: AppColors.secondaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11.sp)),
                                child: Stack(
                                  children: [
                                    PositionedDirectional(
                                      end: 0,
                                      child: Icon(
                                        Icons.check,
                                        color: AppColors.primaryColor
                                            .withOpacity(0.1),
                                        size: 70.sp,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "${controller.patient.appointmentBooked}",
                                            style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 2.sp,
                                          ),
                                          Text(
                                            AppStrings.appointmentBooked.tr,
                                            style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 10.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                color: AppColors.secondaryColor,
                                elevation: 10,
                                shadowColor: AppColors.secondaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11.sp)),
                                child: Stack(
                                  children: [
                                    PositionedDirectional(
                                      end: 0,
                                      child: Icon(
                                        Icons.alarm,
                                        color: AppColors.primaryColor
                                            .withOpacity(0.1),
                                        size: 70.sp,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "${controller.patient.appointmentWaiting}",
                                            style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 2.sp,
                                          ),
                                          Text(
                                            AppStrings.appointmentWaiting.tr,
                                            style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 10.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.sp,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Card(
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.patient.subscription.titleEn,
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor),
                                ),
                                SizedBox(
                                  height: 15.sp,
                                ),
                                Text(controller
                                    .patient.subscription.descriptionAr),
                                SizedBox(
                                  height: 8.sp,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: AppColors.primaryColor),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 2.sp, horizontal: 10.sp),
                                      child: Text(
                                        "${controller.patient.subscription.price} YE.R / month",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        style: const ButtonStyle(
                                            textStyle: MaterialStatePropertyAll(
                                                TextStyle(
                                                    decoration: TextDecoration
                                                        .underline))),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Change plan",
                                              style: TextStyle(
                                                  color:
                                                      AppColors.primaryColor),
                                            ),
                                            SizedBox(
                                              width: 2.sp,
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 10.sp,
                                              color: AppColors.primaryColor,
                                            ),
                                          ],
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.sp,
                      ),
                      ProfileItem(
                        icon: Icons.person,
                        title: "Edit personal information",
                        onTap: () {
                          Get.toNamed(ProfileEditPage.id);
                        },
                      ),
                      SizedBox(
                        height: 13.sp,
                      ),
                      ProfileItem(
                        icon: Icons.settings,
                        title: "Settings",
                        onTap: () => Get.toNamed(SettingsPage.id),
                      ),
                      SizedBox(
                        height: 13.sp,
                      ),
                      ProfileItem(
                        icon: Icons.assistant,
                        title: "Help & support",
                        onTap: () {},
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 50),
                        child: ElevatedButton(
                          onPressed: controller.showLogoutBottomSheet,
                          style: ButtonStyle(
                            fixedSize: MaterialStatePropertyAll(
                              Size(100.w, 6.h),
                            ),
                            elevation: const MaterialStatePropertyAll(0),
                            shadowColor:
                                const MaterialStatePropertyAll(Colors.red),
                            backgroundColor: const MaterialStatePropertyAll(
                                Colors.redAccent),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.logout_rounded,
                                color: Colors.white,
                                size: 15.sp,
                              ),
                              SizedBox(
                                width: 5.sp,
                              ),
                              Text(
                                "Logout",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                    fontSize: 11.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                    ],
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
