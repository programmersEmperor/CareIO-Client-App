import 'package:ai_health_assistance/Localization/app_strings.dart';
import 'package:ai_health_assistance/Pages/AiAssistance/chatbot_page.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        maximumSize: MaterialStatePropertyAll(Size(
            MediaQuery.of(context).size.width * 0.28,
            MediaQuery.of(context).size.height * 0.04)),
        minimumSize: MaterialStatePropertyAll(Size(
            MediaQuery.of(context).size.width * 0.28,
            MediaQuery.of(context).size.height * 0.03)),
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        shadowColor:
            MaterialStatePropertyAll(AppColors.primaryColor.withOpacity(0.3)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(color: AppColors.scaffoldColor, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: Text(
        AppStrings.startChat.tr,
        style: const TextStyle(
            color: Colors.white, fontSize: 11, fontWeight: FontWeight.w900),
      ),
    );
  }
}
