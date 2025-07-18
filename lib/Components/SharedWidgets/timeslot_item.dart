import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TimeSlotItem extends StatelessWidget {
  final bool isDisabled;
  final String from;
  final String to;
  const TimeSlotItem({
    super.key,
    this.isDisabled = false,
    required this.to,
    required this.from
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: ActionChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
          Text(from, textDirection: TextDirection.ltr),
          Text(' - '),
          Text(to, textDirection: TextDirection.ltr)
        ],),
        labelStyle: TextStyle(fontSize: 7.5.sp, color: Colors.black54),
        avatar: Icon(
          Icons.watch_later_outlined,
          color: AppColors.primaryColor,
          size: 15.sp,
        ),
        onPressed: isDisabled ? null : () {},
        backgroundColor: Colors.white,
        disabledColor: Colors.grey.shade200,
      ),
    );
  }
}
