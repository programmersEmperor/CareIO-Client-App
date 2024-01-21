import 'package:ai_health_assistance/Components/SharedWidgets/no_data_widget.dart';
import 'package:ai_health_assistance/Models/Doctor.dart';
import 'package:ai_health_assistance/Pages/Doctors/custom/doctor_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctor> doctors;
  const DoctorsListView({
    super.key,
    required this.doctors,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.sp),
      child: ListView.builder(
          itemCount: doctors.isEmpty ? 1 : doctors.length,
          itemBuilder: (_, index) {
            if (doctors.isEmpty) {
              return NoDataWidget(
                  message: "No doctors found, Please try again latter ");
            } else {
              return DoctorListWidget(
                doctor: doctors[index],
              );
            }
          }),
    );
  }
}
