import 'package:ai_health_assistance/Models/Doctor.dart';
import 'package:ai_health_assistance/Pages/Doctors/doctor_profile.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DoctorListWidget extends StatelessWidget {
  final Doctor doctor;
  const DoctorListWidget({required this.doctor, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
      ),
      child: InkWell(
        onTap: () => Get.toNamed(DoctorProfile.id, arguments: [
          {'index': doctor.id}
        ]),
        child: SizedBox(
          child: Card(
            elevation: 0.sp,
            color: Colors.white,
            shadowColor: Colors.grey.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.sp),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 7.sp),
              child: Row(
                children: [
                  Hero(
                    tag: "doc${doctor.id}",
                    child: Container(
                      height: 50.sp,
                      width: 50.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        border: Border.all(
                            color: AppColors.scaffoldColor, width: 3.sp),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            doctor.avatar!,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 8.0.sp, right: 5.0.sp, top: 0.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor.name!,
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3.5.sp),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 10.sp,
                                ),
                                Text(
                                  doctor.rating.toString(),
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 8.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3.5.sp),
                            child: Text(
                              doctor.specialism!.name,
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 8.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: AppColors.scaffoldColor,
                        radius: 12.sp,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 10.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
