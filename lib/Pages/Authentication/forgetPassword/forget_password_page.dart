import 'package:ai_health_assistance/Components/SharedWidgets/main_colored_button.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/text_input_field.dart';
import 'package:ai_health_assistance/Pages/Authentication/otp/otp.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ForgetPasswordPage extends StatelessWidget {
  static const id = '/ForgetPasswordPage';
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.directional(
                  textDirection: TextDirection.ltr,
                  top: -200,
                  end: -120,
                  child: CircleAvatar(
                    radius: 150.sp,
                    backgroundColor: AppColors.secondaryColor,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Forget Your Password?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                              fontSize: 22.sp),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12.0.sp),
                          child: SizedBox(
                            width: 70.w,
                            child: Text(
                              "fill in your phone number and an OTP will be sent to your phone via SMS "
                                  .capitalize!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 11.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.sp,
              ),
              child: Column(
                children: [
                  FormBuilder(
                    child: Column(
                      children: [
                        const TextInputField(
                          name: 'Phone',
                          inputType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: 15.sp,
                        ),
                        MainColoredButton(
                          text: "Send OTP",
                          fontSize: 12.sp,
                          onPress: () => Get.toNamed(OTPPage.id),
                        ),
                        SizedBox(
                          height: 15.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
