import 'package:ai_health_assistance/Components/SharedWidgets/main_colored_button.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/text_input_field.dart';
import 'package:ai_health_assistance/Localization/app_strings.dart';
import 'package:ai_health_assistance/Pages/Authentication/controllers/authentication_controller.dart';
import 'package:ai_health_assistance/Pages/Authentication/login/loginPage.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignupPage extends StatelessWidget {
  static const id = '/SignupPage';
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationController controller = Get.find<AuthenticationController>();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 25.h,
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
                        AppStrings.register.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                            fontSize: 22.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 12.0.sp, left: 40.sp, right: 40.sp),
                        child: Text(
                          AppStrings.createNewAccountSubtitle.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 20.sp,
                vertical: 10.sp,
              ),
              children: [
                FormBuilder(
                  key: controller.signupFormKey,
                  child: Column(
                    children: [
                      TextInputField(
                        name: AppStrings.phone,
                        inputType: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      TextInputField(
                        name: AppStrings.password,
                        inputType: TextInputType.text,
                        password: true,
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      TextInputField(
                        name: AppStrings.confirmPassword,
                        inputType: TextInputType.text,
                        password: true,
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      MainColoredButton(
                        text: AppStrings.signup.tr,
                        fontSize: 12.sp,
                        isLoading: controller.isLoading,
                        onPress: controller.signup,
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      TextButton(
                        onPressed: () => Get.offNamed(LoginPage.id),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.alreadyHaveAccount.tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  color: Colors.black54),
                            ),
                            SizedBox(
                              width: 6.sp,
                            ),
                            Text(
                              AppStrings.login.tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 7.h,
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
