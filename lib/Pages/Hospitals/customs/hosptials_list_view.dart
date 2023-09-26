import 'package:ai_health_assistance/Components/SharedWidgets/hospital_card.dart';
import 'package:ai_health_assistance/Pages/Hospitals/hospital_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HospitalListVIew extends StatelessWidget {
  const HospitalListVIew({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      itemCount: 10,
      itemBuilder: (_, index) => InkWell(
        onTap: () => Get.toNamed(HospitalProfile.id, arguments: [
          {'index': index.toString()}
        ]),
        child: HospitalCard(index: index.toString()),
      ),
    );
  }
}
