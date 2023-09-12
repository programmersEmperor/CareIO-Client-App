import 'package:ai_health_assistance/Pages/AiAssistance/UiController/chat_page_controller.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class RoundedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final FocusNode? node;
  const RoundedTextField(
      {super.key, required this.controller, required this.hint, this.node});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 6,
      autofocus: false,
      focusNode: node,
      minLines: 1,
      style: TextStyle(
        fontSize: 10.sp,
        color: Colors.black54,
      ),
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0.sp, horizontal: 15.sp),
        hintText: hint,
        suffixIcon: GestureDetector(
          onTap: () => Get.find<ChatUiController>().showImageSelector(context),
          child: Icon(
            Icons.attach_file_rounded,
            color: AppColors.primaryColor,
            size: 14.sp,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        hintStyle: const TextStyle(color: Colors.black45),
        counter: const SizedBox(),
        constraints: BoxConstraints(
          minHeight: 10.sp,
          maxHeight: 150.sp,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.sp),
            borderRadius: BorderRadius.circular(15.sp),
            gapPadding: 0),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.secondaryColor, width: 1.sp),
            borderRadius: BorderRadius.circular(15.sp),
            gapPadding: 0),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.sp),
            borderRadius: BorderRadius.circular(15.sp),
            gapPadding: 0),
      ),
    );
  }
}
