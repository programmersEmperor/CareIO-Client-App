import 'package:ai_health_assistance/Models/Notification.dart' as model;
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotificationCard extends StatelessWidget {
  final model.Notification notification;
  const NotificationCard({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.sp),
      child: Card(
        elevation: notification.isRead ? 0 : 15,
        shadowColor: Colors.grey.withOpacity(0.2),
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
        child: Padding(
          padding: EdgeInsets.all(8.sp),
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
                    Row(
                      children: [
                        Text(
                          "${notification.title}",
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.sp,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${notification.body}",
                            style: TextStyle(
                                fontSize: 8.5.sp, color: Colors.black38),
                          ),
                        ),
                        Text(
                          "${notification.createdAt}",
                          style: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: notification.isRead
                                  ? FontWeight.normal
                                  : FontWeight.bold,
                              color: notification.isRead
                                  ? Theme.of(context).disabledColor
                                  : Theme.of(context)
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
      ),
    );
  }
}
