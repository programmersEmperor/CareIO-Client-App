import 'package:ai_health_assistance/Components/SharedWidgets/main_colored_button.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/social_media_button.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/text_input_field.dart';
import 'package:ai_health_assistance/Pages/Authentication/forgetPassword/forget_password_page.dart';
import 'package:ai_health_assistance/Pages/Authentication/signup/signupPage.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  static const id = '/loginPage';
  const LoginPage({super.key});

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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Login here",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                            fontSize: 22.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12.0.sp),
                        child: Text(
                          "fill in your credentials to continue".capitalize!,
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
                        const TextInputField(
                          name: 'Password',
                          inputType: TextInputType.text,
                          password: true,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () => Get.toNamed(ForgetPasswordPage.id),
                            child: Text(
                              "Forget Your Password?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 9.sp,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        MainColoredButton(
                          text: "Sign in",
                          fontSize: 12.sp,
                          onPress: () {},
                        ),
                        SizedBox(
                          height: 15.sp,
                        ),
                        TextButton(
                          onPressed: () => Get.toNamed(SignupPage.id),
                          child: Text(
                            "Create new account",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: Colors.black54),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "or continue with",
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor),
                        ),
                        SizedBox(
                          height: 15.sp,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SocialMediaButton(
                              icon: Boxicons.bxl_google,
                              onTap: () {},
                            ),
                            SizedBox(
                              width: 10.sp,
                            ),
                            SocialMediaButton(
                              icon: Boxicons.bxl_facebook,
                              onTap: () {},
                            ),
                          ],
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
