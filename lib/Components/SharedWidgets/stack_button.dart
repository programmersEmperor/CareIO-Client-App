import 'package:ai_health_assistance/Pages/AiAssistance/chatbot_page.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class StackButton extends StatelessWidget {
  const StackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.toNamed(ChatBotPage.id);
      },
      style: ButtonStyle(
        maximumSize: MaterialStatePropertyAll(Size(28.w, 4.h)),
        minimumSize: MaterialStatePropertyAll(Size(28.w, 4.h)),
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        shadowColor:
            MaterialStatePropertyAll(AppColors.primaryColor.withOpacity(0.3)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(color: AppColors.scaffoldColor, width: 1.sp),
            borderRadius: BorderRadius.circular(20.sp),
          ),
        ),
      ),
      child: Text(
        "Start chat",
        style: TextStyle(
            color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.w900),
      ),
    );
  }
}
