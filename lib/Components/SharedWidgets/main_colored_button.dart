import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainColoredButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPress;
  final double? elevation;
  final double fontSize;

  const MainColoredButton({
    super.key,
    required this.text,
    this.onPress,
    this.elevation,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(
          Size(100.w, 6.h),
        ),
        elevation:
            MaterialStatePropertyAll(onPress == null ? 0 : elevation ?? 15),
        shadowColor: MaterialStatePropertyAll(AppColors.primaryColor),
        backgroundColor: MaterialStatePropertyAll(
            onPress == null ? Colors.black26 : AppColors.primaryColor),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.sp),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize),
      ),
    );
  }
}
