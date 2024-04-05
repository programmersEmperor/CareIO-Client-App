import 'package:ai_health_assistance/Components/SharedWidgets/main_colored_button.dart';
import 'package:ai_health_assistance/Localization/app_strings.dart';
import 'package:ai_health_assistance/Pages/Home/controller/appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class RatingWidget extends StatelessWidget {
  final int appointmentId;
  const RatingWidget({super.key, required this.appointmentId});

  @override
  Widget build(BuildContext context) {
    AppointmentController controller = Get.find<AppointmentController>();
    int rating = 1;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(15.sp),
          topStart: Radius.circular(15.sp),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 15.sp,
            ),
            decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(100.h)
            ),
            height: 4.sp,
            width: 80.sp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.sp),
            child: Text(
              AppStrings.ratingAppointments.tr,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
            ),
          ),
          RatingBar.builder(
            initialRating: 1,
            minRating: 1,
            direction: Axis.horizontal,
            itemCount: 5,
            glow: true,
            glowColor: Colors.amber,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (value) {
              rating = int.parse(value.toString().split('.').first);
            },
          ),
          Padding(
            padding: EdgeInsets.all(15.sp),
            child: MainColoredButton(
              isLoading: controller.ratingLoading,
              text: AppStrings.rate.tr,
              onPress: () {
                controller.rateAppointment(
                    appointmentId: appointmentId, rating: rating);
              },
            ),
          )
        ],
      ),
    );
  }
}
