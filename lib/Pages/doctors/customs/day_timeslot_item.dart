import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DayTimeSLotItem extends StatelessWidget {
  final String day;
  const DayTimeSLotItem({
    super.key,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 10.sp),
      radius: Radius.circular(10.sp),
      borderType: BorderType.RRect,
      color: Theme.of(context).primaryColor,
      child: Text(
        day,
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
