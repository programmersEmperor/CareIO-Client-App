import 'package:cached_network_image/cached_network_image.dart';
import 'package:ai_health_assistance/Localization/app_strings.dart';
import 'package:ai_health_assistance/Models/client.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MainAppBar extends StatelessWidget {
  final Patient patient;
  const MainAppBar({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6.h, bottom: 5, right: 5, left: 5),
      child: SizedBox(
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  const SizedBox(
                    width: 7,
                  ),
                  if (patient.avatar.isEmpty) ...[
                    Container(
                      height: 6.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.secondaryColor,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Icon(
                          Boxicons.bx_user,
                          size: 25.sp,
                          color: AppColors.primaryColor,
                        )
                      ),
                    ),
                  ] else ...[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(patient.avatar),
                            fit: BoxFit.cover,
                          )),
                      height: 5.h,
                      width: 10.w,
                    ),
                  ],
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            patient.name,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            TimeOfDay.now().period == DayPeriod.am? AppStrings.goodMorning.tr : AppStrings.goodEvening.tr,
                            style: TextStyle(
                                fontSize: 8.sp,
                                color: Colors.black38,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
