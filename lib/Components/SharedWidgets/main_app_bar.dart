import 'package:ai_health_assistance/Localization/app_strings.dart';
import 'package:ai_health_assistance/Models/client.dart';
import 'package:ai_health_assistance/Pages/Profile/profile_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
              child: GestureDetector(
                onTap: () => Get.toNamed(ProfilePage.id),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 7,
                    ),
                    if (patient.avatar.isEmpty) ...[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/person.jpg"),
                              fit: BoxFit.cover,
                            )),
                        height: 6.h,
                        width: 10.w,
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
                              AppStrings.goodMorning.tr,
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
            ),
          ],
        ),
      ),
    );
  }
}
