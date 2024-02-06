import 'package:ai_health_assistance/Components/SharedWidgets/main_colored_button.dart';
import 'package:ai_health_assistance/Models/Appointment.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CancelAppointmentConfirmSheet extends StatelessWidget {
  const CancelAppointmentConfirmSheet({
    super.key,
    required this.appointment,
    required this.loading,
    required this.onTap,
  });

  final Appointment appointment;
  final RxBool loading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 25.sp),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.sp),
              topRight: Radius.circular(15.sp))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            "Cancel appointment for",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "Dr ${appointment.doctor.name}",
                    style:
                        TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.sp),
                    child: Text(
                      appointment.doctor.specialism!.name,
                      style: TextStyle(
                        fontSize: 9.5.sp,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 32.sp,
                width: 32.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/person.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Boxicons.bxs_calendar,
                        color: AppColors.primaryColor,
                        size: 12.sp,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 2.sp, left: 2.sp, right: 2.sp),
                        child: Text(
                          appointment.bookedAt,
                          style: TextStyle(
                              color: Colors.black54, fontSize: 8.5.sp),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Boxicons.bxs_time,
                        color: AppColors.primaryColor,
                        size: 12.sp,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 2.sp, left: 2.sp, right: 2.sp),
                        child: Text(
                          appointment.bookedAt,
                          style: TextStyle(
                              color: Colors.black54, fontSize: 8.5.sp),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.sp, vertical: 2.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: appointment.status == 1
                        ? Colors.green.withOpacity(0.2)
                        : Colors.orange.withOpacity(0.2),
                  ),
                  child: Text(
                    appointment.status == 1 ? "confirmed" : "in review",
                    style: TextStyle(
                        color: appointment.status == 1
                            ? Colors.green
                            : Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          MainColoredButton(
            isLoading: loading,
            text: "Confirm cancellation",
            onPress: onTap,
          ),
        ],
      ),
    );
  }
}
