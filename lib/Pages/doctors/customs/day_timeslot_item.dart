import 'package:ai_health_assistance/Models/WidgetModels/day_time_slot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DayTimeSLotItem extends StatelessWidget {
  final DayTimeSlot dayTimeSlot;
  final VoidCallback onTap;
  const DayTimeSLotItem({
    super.key,
    required this.dayTimeSlot,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.sp),
      child: InkWell(
        onTap: onTap,
        child: Obx(
          () => AnimatedOpacity(
            opacity: dayTimeSlot.isSelected ? 1.0 : 0.5,
            duration: 300.milliseconds,
            curve: Curves.fastEaseInToSlowEaseOut,
            child: AnimatedPadding(
              padding: dayTimeSlot.isSelected
                  ? EdgeInsets.symmetric(horizontal: 3.sp)
                  : EdgeInsets.symmetric(horizontal: 0.sp),
              duration: 300.milliseconds,
              child: Container(
                width: 10.w,
                decoration: BoxDecoration(
                    color: dayTimeSlot.isSelected
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).cardColor,
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10.sp)),
                child: Center(
                  child: Text(
                    dayTimeSlot.day,
                    style: TextStyle(
                        color: dayTimeSlot.isSelected
                            ? Colors.white
                            : Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 9.sp),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
