import 'package:ai_health_assistance/Models/HealthCenter.dart';
import 'package:ai_health_assistance/Pages/Hospitals/hospital_profile.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:sizer/sizer.dart';

class HospitalCard extends StatelessWidget {
  final HealthCenter? healthCenter;
  const HospitalCard({
    super.key,
    this.healthCenter,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(HospitalProfile.id, arguments: [
        {'index': healthCenter?.id.toString()}
      ]),
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Hero(
                      tag: "hospital${healthCenter!.id}",
                      child: healthCenter!.avatar != null
                          ? CachedNetworkImage(
                              imageUrl: healthCenter!.avatar!,
                              width: 20.w,
                              height: 10.h,
                              fit: BoxFit.fill,
                            )
                          : Container(
                              height: 10.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: AppColors.secondaryColor),
                              child: Icon(
                                Boxicons.bx_building_house,
                                size: 30.sp,
                                color: AppColors.primaryColor,
                              )),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AutoSizeText(
                          "${healthCenter!.name}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w800,
                          ),
                          overflowReplacement: Marquee(
                            text: "${healthCenter!.name}",
                            blankSpace: 20.0,
                            accelerationCurve: Curves.easeOut,
                            velocity: 50.0,
                            startPadding: 2.0,
                            showFadingOnlyWhenScrolling: true,
                            startAfter: 5.seconds,
                            fadingEdgeEndFraction: 0.5,
                            fadingEdgeStartFraction: 0.5,
                            pauseAfterRound: 5.seconds,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5.sp,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: AppColors.primaryColor,
                                size: 12.sp,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Expanded(
                                child: AutoSizeText(
                                  "${healthCenter!.address}",
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 9,
                                      color: Colors.black45),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 2,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 10.sp,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "${healthCenter!.rating}",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10.sp,
                                    color: Colors.black45),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 13,
                    color: AppColors.primaryColor,
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
