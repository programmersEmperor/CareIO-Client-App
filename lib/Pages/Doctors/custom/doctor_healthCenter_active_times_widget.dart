import 'package:ai_health_assistance/Components/SharedWidgets/hospital_card.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/timeslot_item.dart';
import 'package:ai_health_assistance/Models/ActiveTime.dart';
import 'package:ai_health_assistance/Models/Clinic.dart';
import 'package:ai_health_assistance/Models/HealthCenter.dart';
import 'package:ai_health_assistance/Pages/Hospitals/hospital_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DoctorHealthCenterActiveTimeWidget extends StatelessWidget{
  final HealthCenter healthCenter;
  final int day;
  final List<ActiveTimes> activeTimes = [];
  DoctorHealthCenterActiveTimeWidget({super.key, required this.healthCenter, required this.day});


  @override
  Widget build(BuildContext context){
    for (Clinic clinic in healthCenter.clinics){
      activeTimes.addAll(clinic.activeTimes.where((activeTime) => activeTime.day == day));
    }

    if(activeTimes.isEmpty){
      return const SizedBox.shrink();
    }

    return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 10.0.sp,
                bottom: 10.0.sp,
              ),
              child: SizedBox(
                child: InkWell(
                  onTap: () => Get.toNamed(
                      HospitalProfile.id,
                      arguments: [
                        {'index': '1'}
                      ]),
                  child: HospitalCard(
                    healthCenter: healthCenter,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Wrap(
                children: activeTimes.map((time) => TimeSlotItem(from: time.time12(time.from), to:time.time12(time.to))).toList(),
              ),
            )
          ],
        );
  }
}