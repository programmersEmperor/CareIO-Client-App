import 'package:ai_health_assistance/Components/SharedWidgets/hospital_card.dart';
import 'package:ai_health_assistance/Models/Appointment.dart';
import 'package:ai_health_assistance/Pages/Home/controller/appointment_controller.dart';
import 'package:ai_health_assistance/Pages/Home/custom/appointment_state_title_widget.dart';
import 'package:ai_health_assistance/Pages/Hospitals/hospital_profile.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'appointment_cancel_button.dart';

class AppointmentCard extends StatelessWidget {
  final int index;
  final showDetails = false.obs;
  final Appointment appointment;
  AppointmentCard({
    super.key,
    required this.index,
    required this.appointment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.sp, left: 10.sp, right: 10.sp),
      child: Card(
        elevation: 15,
        shadowColor: Colors.grey.shade100,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              top: 15.sp, left: 15.sp, right: 15.sp, bottom: 2.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "Dr ${appointment.doctor.name}",
                        style: TextStyle(
                            fontSize: 11.sp, fontWeight: FontWeight.w600),
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
                      Visibility(
                        visible: appointment.rating != 0,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5.sp),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 12.sp,
                              ),
                              SizedBox(
                                width: 2.sp,
                              ),
                              Text(
                                "${appointment.rating.toString()}.0",
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 10.sp),
                              ),
                            ],
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
                            padding: EdgeInsets.only(
                                top: 2.sp, left: 2.sp, right: 2.sp),
                            child: Text(
                              appointment.date,
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
                            padding: EdgeInsets.only(
                                top: 2.sp, left: 2.sp, right: 2.sp),
                            child: Text(
                              appointment.time,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 8.5.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppointmentStateTitle(appointment: appointment),
                  ],
                ),
              ),
              Obx(
                () => AnimatedSize(
                  duration: 600.milliseconds,
                  curve: Curves.linearToEaseOut,
                  child: Container(
                    width: 100.w,
                    padding: EdgeInsets.only(top: 15.sp, bottom: 5.sp),
                    child: showDetails.isFalse
                        ? null
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                "Reservation in name",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black26,
                                    fontSize: 10.sp),
                              ),
                              SizedBox(
                                height: 3.sp,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText(
                                    appointment.patientName,
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 7.sp, vertical: 5.sp),
                                    decoration: BoxDecoration(
                                        color: AppColors.secondaryColor,
                                        borderRadius:
                                            BorderRadius.circular(8.sp)),
                                    child: AutoSizeText(
                                      appointment.price.toString(),
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 10.sp, bottom: 10.sp),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(15.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.sp),
                                    color: appointment.wallet.isEmpty &&
                                            appointment.status < 3
                                        ? Colors.orangeAccent.withOpacity(0.5)
                                        : AppColors.secondaryColor,
                                  ),
                                  child: Stack(
                                    children: [
                                      PositionedDirectional(
                                        end: 0,
                                        child: Opacity(
                                          opacity: 0.2,
                                          child: Icon(
                                            appointment.wallet.isEmpty &&
                                                    appointment.status < 3
                                                ? Icons.timer
                                                : Icons.check,
                                            color: appointment.wallet.isEmpty &&
                                                    appointment.status < 3
                                                ? Colors.orange
                                                : AppColors.primaryColor,
                                            size: 55.sp,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            appointment.wallet.isEmpty &&
                                                    appointment.status < 3
                                                ? 'Unpaid'
                                                : "Paid",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: appointment
                                                            .wallet.isEmpty &&
                                                        appointment.status < 3
                                                    ? Colors.orange
                                                    : AppColors.primaryColor,
                                                fontSize: 15.sp),
                                          ),
                                          SizedBox(
                                            height: 4.sp,
                                          ),
                                          AutoSizeText(
                                            appointment.status < 3
                                                ? appointment.wallet.isEmpty
                                                    ? "You have completed the payment using"
                                                    : "You have completed the payment using the wallet ${appointment.wallet}"
                                                : appointment.wallet.isEmpty
                                                    ? "Payment will be when visit"
                                                    : "",
                                            style: TextStyle(fontSize: 10.sp),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.sp),
                                child: AutoSizeText(
                                  "Also find doctor at",
                                  style: TextStyle(
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 10.sp),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 10.0.sp,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor
                                          .withOpacity(0.2),
                                      borderRadius:
                                          BorderRadius.circular(15.sp)),
                                  child: InkWell(
                                    onTap: () => Get.toNamed(HospitalProfile.id,
                                        arguments: [
                                          {
                                            'index': appointment.healthCenter.id
                                                .toString()
                                          }
                                        ]),
                                    child: HospitalCard(
                                      healthCenter: appointment.healthCenter,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => showDetails(!showDetails.value),
                      style: ButtonStyle(
                          elevation: const MaterialStatePropertyAll(0),
                          backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).scaffoldBackgroundColor),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.sp)))),
                      child: Text(
                        "Show more",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Visibility(
                    visible: appointment.status < 3,
                    child: Expanded(
                      child: ElevatedButton(
                        onPressed: () => Get.find<AppointmentController>()
                            .confirmRescheduleAppointment(id: appointment.id),
                        style: ButtonStyle(
                            elevation: const MaterialStatePropertyAll(0),
                            backgroundColor: MaterialStatePropertyAll(
                                AppColors.primaryColor),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10.sp)))),
                        child: Text(
                          "Reschedule",
                          style: TextStyle(
                              fontSize: 9.sp, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: appointment.status < 3,
                    child: const SizedBox(
                      width: 10,
                    ),
                  ),
                  Visibility(
                    visible: appointment.status == 5 && appointment.rating == 0,
                    child: Expanded(
                      child: ElevatedButton(
                        onPressed: () => Get.find<AppointmentController>()
                            .showRatingBottomSheet(
                                appointmentId: appointment.id),
                        style: ButtonStyle(
                            elevation: const MaterialStatePropertyAll(0),
                            backgroundColor: MaterialStatePropertyAll(
                                AppColors.primaryColor),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10.sp)))),
                        child: Text(
                          "Rate",
                          style: TextStyle(
                              fontSize: 9.sp, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: appointment.status < 3,
                    child: const SizedBox(
                      width: 10,
                    ),
                  ),
                  Visibility(
                    visible: appointment.status < 3,
                    child: Expanded(
                      child: AppointmentCancelButton(
                        onTap: () => Get.find<AppointmentController>()
                            .confirmCancelAppointment(id: appointment.id),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
