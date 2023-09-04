import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TimeSlotItem extends StatelessWidget {
  final bool isDisabled;
  const TimeSlotItem({
    super.key,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: const Text(
        "12:30 PM",
      ),
      labelStyle: TextStyle(fontSize: 7.5.sp, color: Colors.black54),
      avatar: Icon(
        Icons.watch_later_outlined,
        color: Theme.of(context).primaryColor,
        size: 15.sp,
      ),
      onPressed: isDisabled ? null : () {},
      backgroundColor: Colors.white,
      disabledColor: Colors.grey.shade200,
    );
  }
}
