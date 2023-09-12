import 'package:ai_health_assistance/Pages/doctors/doctor_profile.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:sizer/sizer.dart';

class DoctorGridCard extends StatelessWidget {
  final int index;
  const DoctorGridCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(DoctorProfile.id, arguments: [
        {'index': index.toString()}
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
                      child: Hero(
                        tag: "doc$index",
                        child: Image.asset(
                          'assets/images/person.jpg',
                          fit: BoxFit.cover,
                          width: 31.w,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 5.sp, right: 5.sp, top: 8.sp),
                    child: AutoSizeText(
                      "Dr haitham Hussien",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      overflowReplacement: Marquee(
                        text: "Dr haitham Hussien",
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
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 5.sp,
                      right: 5.sp,
                      top: 2.sp,
                    ),
                    child: Text(
                      "Specialization",
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
