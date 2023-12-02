import 'package:ai_health_assistance/Components/SharedWidgets/custom_datepicker.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/main_colored_button.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/payment_method_card.dart';
import 'package:ai_health_assistance/Constants/circular_icon_button.dart';
import 'package:ai_health_assistance/Pages/Booking/custom/book_timeslot_chip.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BookAppointment extends StatelessWidget {
  const BookAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: ListView(
        padding: EdgeInsets.all(20.sp),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/person.jpg"),
                      fit: BoxFit.cover,
                    )),
                height: 30.sp,
                width: 30.sp,
              ),
              SizedBox(
                width: 10.sp,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Book for",
                      style: TextStyle(
                        fontSize: 10.sp,
                      ),
                    ),
                    SizedBox(
                      height: 2.sp,
                    ),
                    AutoSizeText(
                      "Dr Haitham Hussien",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              CircularIconButton(
                  onTap: Get.back,
                  height: 30.sp,
                  width: 20.sp,
                  iconSize: 15.sp,
                  icon: Icons.close,
                  backgroundColor: AppColors.secondaryColor,
                  iconColor: AppColors.primaryColor),
            ],
          ),
          SizedBox(
            height: 30.sp,
          ),
          AnimatedContainer(
            duration: 500.milliseconds,
            width: 100.w,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(15.sp),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Icon(
                    Icons.watch_later_outlined,
                    size: 160.sp,
                    color: AppColors.primaryColor.withOpacity(0.1),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(17.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "Available timeslots",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              "Today",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 1.sp),
                                    borderRadius: BorderRadius.circular(8.sp),
                                  ),
                                ),
                                maximumSize:
                                    MaterialStatePropertyAll(Size(25.w, 4.h)),
                                minimumSize:
                                    MaterialStatePropertyAll(Size(25.w, 4.h)),
                                padding: const MaterialStatePropertyAll(
                                    EdgeInsets.zero)),
                            onPressed: () {
                              Get.dialog(
                                const CustomDatePicker(),
                                useSafeArea: false,
                              );
                            },
                            child: Text(
                              "Another date",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Wrap(
                        key: const ValueKey<int>(5),
                        spacing: 7.sp,
                        children: const [
                          BookTimeSlot(),
                          BookTimeSlot(),
                          BookTimeSlot(),
                          BookTimeSlot(),
                          BookTimeSlot(),
                          BookTimeSlot(),
                          BookTimeSlot(),
                          BookTimeSlot(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.sp,
          ),
          AutoSizeText(
            "Choose payment method",
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
          ),
          PaymentMethodCard(
            title: 'Jawali Wallet',
            image: "assets/images/person.jpg",
            subtitle: "Some random text " * 2,
            selected: true.obs,
          ),
          PaymentMethodCard(
            title: 'YKB',
            image: "assets/images/hosptial.jpg",
            subtitle: "Some random text " * 2,
            selected: false.obs,
          ),
          PaymentMethodCard(
            title: 'Cash Wallet',
            image: "assets/images/person.jpg",
            subtitle: "Some random text " * 2,
            selected: false.obs,
          ),
          PaymentMethodCard(
            title: 'Saba cash',
            image: "assets/images/person.jpg",
            subtitle: "Some random text " * 2,
            selected: false.obs,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 20.sp),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text:
                    'when pricing "Confirm booking" button you agree to our',
                style: TextStyle(color: Colors.black26, fontSize: 8.5.sp),
                children: [
                  TextSpan(
                      text: " privacy policy",
                      style: TextStyle(color: AppColors.primaryColor),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
                  TextSpan(
                    text: " and ",
                    onEnter: (e) {
                      debugPrint('test');
                    },
                  ),
                  TextSpan(
                      text: "terms of service",
                      style: TextStyle(color: AppColors.primaryColor),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
                ],
              ),
            ),
          ),
          MainColoredButton(
            text: "Confirm booking",
            onPress: () {},
          )
        ],
      ),
    );
  }
}
