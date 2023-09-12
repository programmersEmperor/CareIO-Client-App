import 'package:ai_health_assistance/Components/SharedWidgets/hospital_card.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/main_colored_button.dart';
import 'package:ai_health_assistance/Pages/doctors/UiController/doctor_profile_ui_controller.dart';
import 'package:ai_health_assistance/Pages/doctors/customs/day_timeslot_item.dart';
import 'package:ai_health_assistance/Pages/doctors/customs/doctor_statics.dart';
import 'package:ai_health_assistance/Pages/doctors/customs/doctor_statics_divider.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DoctorProfile extends StatelessWidget {
  static const id = "/DoctorProfile";
  final String index;
  const DoctorProfile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    DoctorProfileUiController controller = Get.put(DoctorProfileUiController());
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overflow) {
          overflow.disallowIndicator();
          return true;
        },
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 30.sp,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.only(
                          left: 10.sp, top: 5.sp, bottom: 5.sp, right: 5.sp),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.primaryColor,
                        size: 12.sp,
                      ),
                    ),
                  ),
                  //AppIcon(icon: Icons.shopping_cart_outlined),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Hero(
                          tag: "doc$index",
                          child: Card(
                            elevation: 10.sp,
                            shadowColor: Colors.blueGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.sp)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.sp),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AutoSizeText(
                                "Dr.Haitham Hussien ",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 4.sp),
                                child: Text(
                                  "Specialization " * 3,
                                  style: TextStyle(
                                    fontSize: 8.sp,
                                    color: Colors.black38,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 4.sp),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 15.sp,
                                    ),
                                    Text(
                                      "3.4",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 9.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70.sp,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: EdgeInsets.all(5.sp),
                                        decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(8.sp)),
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
                            borderRadius: BorderRadius.circular(10.sp)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DoctorStatics(
                              title: 'Experience',
                              info: "+3 years",
                            ),
                            DoctorStaticsDivider(),
                            DoctorStatics(
                              title: "certificates",
                              info: '4 ct',
                            ),
                            DoctorStaticsDivider(),
                            DoctorStatics(
                              title: 'total booking ',
                              info: '230 patient',
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
                padding:
                    EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.sp),
                      child: Text(
                        "lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem",
                        style: TextStyle(fontSize: 9.sp, color: Colors.black45),
                      ),
                    ),
                    AutoSizeText(
                      "Timeslots",
                      style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 10.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.sp),
                      child: SizedBox(
                        height: 5.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.dayTimeSlotList.length,
                          itemBuilder: (_, index) => DayTimeSLotItem(
                            dayTimeSlot: controller.dayTimeSlotList[index],
                            onTap: () => controller.onTapDayTimeSlot(index),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.sp),
                      child: Obx(
                        () => AnimatedSwitcher(
                          duration: 300.milliseconds,
                          layoutBuilder: (child, list) {
                            return Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: child,
                            );
                          },
                          child: controller.activeTimeSlotWidget.value,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18.sp),
                      child: AutoSizeText(
                        "My location",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 10.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18.sp),
                      child: SizedBox(
                        width: 100.w,
                        height: 25.h,
                        child: Card(
                          color: Colors.white,
                          elevation: 15.sp,
                          shadowColor:
                              AppColors.secondaryColor.withOpacity(0.4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.sp)),
                          child: const Center(child: Text("Map Place")),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18.sp),
                      child: AutoSizeText(
                        "Also find me at",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 10.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10.0.sp,
                        bottom: 20.0.sp,
                      ),
                      child: const SizedBox(
                        child: HospitalCard(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.sp),
                      child: MainColoredButton(
                        text: "Book now",
                        onPress: () {},
                      ),
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
