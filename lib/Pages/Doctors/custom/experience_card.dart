import 'package:ai_health_assistance/Models/Experience.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    super.key,
    required this.experience,
  });

  final Experience experience;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      child: Card(
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.sp)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                experience.place ?? "",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  experience.position ?? "",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Chip(
                    label: Text(
                      experience.from.split(' ').first.trim(),
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor,
                          fontSize: 8.sp),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  Text('-'),
                  Chip(
                    label: Text(
                      experience.to.split(' ').first.trim(),
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 8.sp),
                    ),
                    backgroundColor: Colors.white,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
