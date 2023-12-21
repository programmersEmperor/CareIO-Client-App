import 'package:ai_health_assistance/Components/SharedWidgets/main_colored_button.dart';
import 'package:ai_health_assistance/Pages/Authentication/controllers/authentication_controller.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class OTPPage extends StatelessWidget {
  static const id = '/OTPPage';
  const OTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationController controller = Get.find<AuthenticationController>();
    return Scaffold(
      body: ListView(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Code sent",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                            fontSize: 22.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12.0.sp),
                        child: Text(
                          "Code has been sent to 771056641 via sms "
                              .capitalize!,
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.sp,
            ),
            child: Column(
              children: [
                FormBuilder(
                  child: Column(
                    children: [
                      OtpTextField(
                        numberOfFields: 6,
                        focusedBorderColor: AppColors.primaryColor,
                        margin: EdgeInsets.symmetric(horizontal: 3.sp),
                        borderColor: CupertinoColors.systemGrey5,
                        showFieldAsBox: true,
                        fieldWidth: 37.sp,
                        keyboardType: TextInputType.number,
                        borderRadius: BorderRadius.circular(10.sp),
                        onCodeChanged: (String code) {},
                        onSubmit: (String verificationCode) {
                          controller.otpCode = verificationCode;
                        }, // end onSubmit
                      ),
                      SizedBox(
                        height: 30.sp,
                      ),
                      MainColoredButton(
                        text: "Confirm code",
                        fontSize: 12.sp,
                        isLoading: controller.isLoading,
                        onPress: controller.verifyOtp,
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Code not sent ? resend",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                              color: Colors.black54),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
