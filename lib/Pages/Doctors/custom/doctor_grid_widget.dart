import 'package:ai_health_assistance/Models/Doctor.dart';
import 'package:ai_health_assistance/Pages/Doctors/doctor_profile.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:sizer/sizer.dart';

class DoctorGridWidget extends StatelessWidget {
  final Doctor doctor;
  const DoctorGridWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(DoctorProfile.id, arguments: [
        {'index': doctor.id}
      ]),
      child: SizedBox(
        height: 35.h,
        width: 39.w,
        child: Card(
          elevation: 0,
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.sp),
                  child: Container(
                    height: 20.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        width: 31.w,
                        imageUrl: doctor.avatar!,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 5.sp, right: 5.sp, top: 8.sp),
                    child: AutoSizeText(
                      doctor.name!,
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      overflowReplacement: Marquee(
                        text: doctor.name!,
                        blankSpace: 20.0,
                        accelerationCurve: Curves.easeOut,
                        velocity: 50.0,
                        startPadding: 2.0,
                        showFadingOnlyWhenScrolling: true,
                        startAfter: 5.seconds,
                        fadingEdgeEndFraction: 0.5.sp,
                        fadingEdgeStartFraction: 0.5.sp,
                        pauseAfterRound: 5.seconds,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 3.5.sp, left: 5.sp, right: 5.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 10.sp,
                      ),
                      Text(
                        "${doctor.rating}",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 8.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 5.sp,
                      right: 5.sp,
                      top: 2.sp,
                    ),
                    child: Text(
                      doctor.specialism!.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 8.sp,
                          color: Colors.black45),
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
