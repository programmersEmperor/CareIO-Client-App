import 'package:ai_health_assistance/Components/SharedWidgets/main_colored_button.dart';
import 'package:ai_health_assistance/Constants/circular_icon_button.dart';
import 'package:ai_health_assistance/Pages/Search/custom/clinic_chip.dart';
import 'package:ai_health_assistance/Pages/Search/custom/rating_chip.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    RxBool showNearby = false.obs;
    return SizedBox(
      width: 100.w,
      child: ListView(
          padding: EdgeInsets.all(20.sp),
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Search filter",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp),
                ),
                CircularIconButton(
                  onTap: Get.back,
                  height: 30.sp,
                  width: 20.sp,
                  iconSize: 15.sp,
                  icon: Icons.close,
                  backgroundColor: AppColors.secondaryColor,
                  iconColor: AppColors.primaryColor,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.sp),
              child: InkWell(
                onTap: () {
                  showNearby(!showNearby.value);
                },
                child: Container(
                  height: 7.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.sp)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.sp),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          "Show nearby results",
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.black54,
                          ),
                        )),
                        Obx(
                          () => Checkbox(
                            value: showNearby.value,
                            activeColor: AppColors.primaryColor,
                            overlayColor: const MaterialStatePropertyAll(
                                Colors.transparent),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.sp)),
                            onChanged: (newValue) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              "By clinic",
              style: TextStyle(fontSize: 12.sp),
            ),
            Wrap(
              key: const ValueKey<int>(5),
              spacing: 7.sp,
              children: const [
                ClinicChip(
                  title: "Cardio",
                ),
                ClinicChip(
                  title: "Cardio",
                ),
                ClinicChip(
                  title: "Cardio",
                ),
                ClinicChip(
                  title: "Cardio",
                ),
                ClinicChip(
                  title: "Cardio",
                ),
                ClinicChip(
                  title: "Cardio",
                ),
                ClinicChip(
                  title: "Cardio",
                ),
              ],
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              "By rating",
              style: TextStyle(fontSize: 12.sp),
            ),
            SizedBox(
              height: 8.h,
              child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) =>
                      RatingChip(title: "+${index + 1}")),
            ),
            SizedBox(
              height: 10.sp,
            ),
            MainColoredButton(
              text: "See results",
              onPress: () {},
            )
          ].animate().slide(
              duration: GetNumUtils(1.2).seconds,
              curve: Curves.ease,
              begin: const Offset(0, 20),
              end: const Offset(0, 0))),
    );
  }
}
