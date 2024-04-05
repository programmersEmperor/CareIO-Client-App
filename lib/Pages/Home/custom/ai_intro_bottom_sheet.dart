import 'package:ai_health_assistance/Components/SharedWidgets/ai_introduction_card.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/main_colored_button.dart';
import 'package:ai_health_assistance/Localization/app_strings.dart';
import 'package:ai_health_assistance/Pages/AiAssistance/chatbot_page.dart';
import 'package:ai_health_assistance/Services/CachingService/user_session.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class AiIntroBottomSheet extends StatelessWidget {
  const AiIntroBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.sp, left: 10.sp, right: 10.sp, bottom: 20.sp),
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.sp)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.sp),
            child: SizedBox(
              height: 20.h,
              child: Stack(
                children: [
                  SizedBox(
                    width: 100.w,
                    child: Opacity(
                      opacity: 0.4.sp,
                      child: Lottie.asset(
                          'assets/animations/ai_intoduction.json',
                          alignment: Alignment.center),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.sp, vertical: 20.sp),
                    child: Text(
                      AppStrings.aiIntro.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
            child: Column(
              children: [
                AiIntroductionCard(
                  icon: Icons.health_and_safety,
                  header: AppStrings.checkYourHealth.tr,
                  subtitle: AppStrings.askCareioAboutYourHealth.tr,
                ),
                AiIntroductionCard(
                  icon: Icons.healing,
                  header: AppStrings.DoctorAndHealthCenter.tr,
                  subtitle: AppStrings.GetInfoAboutOurDoctorsAndHealthCenters.tr,
                ),
                AiIntroductionCard(
                  icon: Icons.medical_services_rounded,
                  header: AppStrings.medicine.tr,
                  subtitle: AppStrings.getInfoAboutYourMedicine.tr,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 20.sp),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'some random text that is used to explain pricing and ',
                style: TextStyle(color: Colors.black26, fontSize: 8.5.sp),
                children: [
                  TextSpan(
                      text: " free trial",
                      style: TextStyle(color: AppColors.primaryColor),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
                  TextSpan(
                    text: " pricing and limitations",
                    onEnter: (e) {
                      debugPrint('test');
                    },
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          MainColoredButton(
              text: AppStrings.coolLetsStart.tr,
              onPress: () {
                Get.close(0);
                Get.find<UserSession>().setUserOpenChat();
                Get.toNamed(ChatBotPage.id);
              })
        ],
      ),
    );
  }
}
