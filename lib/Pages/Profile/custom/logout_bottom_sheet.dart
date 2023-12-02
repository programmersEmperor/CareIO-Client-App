import 'package:ai_health_assistance/Components/SharedWidgets/main_colored_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Confirm logout",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20.sp,
            ),
            MainColoredButton(
              text: "Logout",
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
