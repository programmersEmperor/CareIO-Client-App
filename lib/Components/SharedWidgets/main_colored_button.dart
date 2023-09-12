import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainColoredButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  const MainColoredButton({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(
          Size(100.w, 6.h),
        ),
        elevation: const MaterialStatePropertyAll(15),
        shadowColor: MaterialStatePropertyAll(AppColors.primaryColor),
        backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.sp),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 11.sp),
      ),
    );
  }
}
