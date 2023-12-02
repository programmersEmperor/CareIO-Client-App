import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.sp),
      child: Container(
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.sp)),
        child: Row(
          children: [
            Icon(
              Icons.notifications_active,
              size: 32.sp,
              color: AppColors.primaryColor,
            ),
            SizedBox(
              width: 10.sp,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notification header",
                    style:
                        TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4.sp,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Notification subtitle ",
                          style: TextStyle(
                              fontSize: 8.5.sp, color: Colors.black38),
                        ),
                      ),
                      Text(
                        "3 min ago",
                        style: TextStyle(
                            fontSize: 7.sp,
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.5.sp)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
