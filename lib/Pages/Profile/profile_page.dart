import 'package:ai_health_assistance/Components/SharedWidgets/back_circle_button.dart';
import 'package:ai_health_assistance/Pages/Profile/controller/profile_page_controller.dart';
import 'package:ai_health_assistance/Pages/Profile/custom/profile_item.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatelessWidget {
  static const id = "/profilePage";
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfilePageController uiController = Get.put(ProfilePageController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 0),
        child: AppBar(
          actions: const [],
          leading: const SizedBox(),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.primaryColor,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
      ),
      body: SizedBox(
        height: 100.h,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
              padding: EdgeInsets.only(
                  left: 20.sp, right: 20.sp, bottom: 40.sp, top: 20.sp),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 93.h,
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 11.sp,
                    ),
                    Stack(
                      children: [
                        Lottie.asset('assets/animations/lines.json'),
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
                        const Positioned(
                          left: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            child: BackCircleButton(),
                          ),
                        )
                      ],
                    ),
                    const Text(
                      "Haitham Hussein",
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Row(
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
                          "771056641",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          color: AppColors.primaryColor,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11.sp)),
                          shadowColor: AppColors.primaryColor,
                          child: Stack(
                            children: [
                              Icon(
                                Icons.check,
                                color:
                                    AppColors.secondaryColor.withOpacity(0.2),
                                size: 70.sp,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "253",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 2.sp,
                                    ),
                                    Text(
                                      "Appointments booked",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          color: AppColors.secondaryColor,
                          elevation: 10,
                          shadowColor: AppColors.secondaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11.sp)),
                          child: Stack(
                            children: [
                              Icon(
                                Icons.access_alarm,
                                color: AppColors.primaryColor.withOpacity(0.1),
                                size: 70.sp,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "1",
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 2.sp,
                                    ),
                                    Text(
                                      "Appointments waiting",
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
                      ],
                    ),
                    SizedBox(
                      height: 30.sp,
                    ),
                    ProfileItem(
                      icon: Icons.person,
                      title: "Edit personal information",
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 13.sp,
                    ),
                    ProfileItem(
                      icon: Icons.settings,
                      title: "Settings",
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 13.sp,
                    ),
                    ProfileItem(
                      icon: Icons.assistant,
                      title: "Help & support",
                      onTap: () {},
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ElevatedButton(
                        onPressed: uiController.showLogoutBottomSheet,
                        style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(
                            Size(100.w, 6.h),
                          ),
                          elevation: const MaterialStatePropertyAll(0),
                          shadowColor:
                              const MaterialStatePropertyAll(Colors.red),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.redAccent),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              side:
                                  const BorderSide(width: 1, color: Colors.red),
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
          ],
        ),
      ),
    );
  }
}
