import 'package:ai_health_assistance/Models/Appointment.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppointmentStateTitle extends StatelessWidget {
  const AppointmentStateTitle({
    super.key,
    required this.appointment,
  });

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    if (appointment.status == 6) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 2.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.sp),
          color: Colors.orange.withOpacity(0.2),
        ),
        child: Text(
          appointment.appointmentStatusTitle,
          style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 10.sp),
        ),
      );
    }
    if (appointment.status == 5) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 2.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            color: Colors.green.withOpacity(0.2)),
        child: Text(
          appointment.appointmentStatusTitle,
          style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 10.sp),
        ),
      );
    }
    return const SizedBox();
  }
}
