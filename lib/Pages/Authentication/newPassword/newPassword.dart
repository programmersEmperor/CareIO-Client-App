import 'package:ai_health_assistance/Components/SharedWidgets/main_colored_button.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/text_input_field.dart';
import 'package:ai_health_assistance/Localization/app_strings.dart';
import 'package:ai_health_assistance/Pages/Authentication/controllers/authentication_controller.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class NewPasswordPage extends GetView<AuthenticationController> {
  static const id = '/newPassword';
  const NewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(() => AuthenticationController());
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AutofillHints.newPassword.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                            fontSize: 22.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 12.0.sp, right: 20.sp, left: 20.sp),
                        child: Text(
                          AppStrings.newPasswordSubtitle.tr.capitalize!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 1.5,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold),
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
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  FormBuilder(
                    key: controller.newPasswordFormKey,
                    child: Column(
                      children: [
                        TextInputField(
                          name: AppStrings.newPassword,
                          inputType: TextInputType.text,
                          password: true,
                          required: true,
                        ),
                        SizedBox(
                          height: 15.sp,
                        ),
                        const TextInputField(
                          name: AppStrings.confirmPassword,
                          inputType: TextInputType.text,
                          password: true,
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        MainColoredButton(
                          text: AppStrings.savePassword.tr,
                          fontSize: 12.sp,
                          isLoading: controller.isLoading,
                          onPress: controller.resetPassword,
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
