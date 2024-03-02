import 'package:ai_health_assistance/Components/SharedWidgets/no_data_widget.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/page_header.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/refresh_indicator_widget.dart';
import 'package:ai_health_assistance/Localization/app_strings.dart';
import 'package:ai_health_assistance/Pages/Notifications/custom/notification_card.dart';
import 'package:ai_health_assistance/Pages/Notifications/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class NotificationsPage extends StatelessWidget {
  static const id = "/notificationPage";
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.find<NotificationController>();
    return RefreshWidget(
      onRefresh: controller.fetchNotifications,
      isLoading: controller.isLoading,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          PageHeader(heading: AppStrings.notification.tr),
          ListView.builder(
            itemCount: controller.notifications.isEmpty
                ? 1
                : controller.notifications.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(10.sp),
            itemBuilder: (_, index) {
              if (controller.notifications.isEmpty) {
                return NoDataWidget(message: AppStrings.noNotification.tr);
              } else {
                return NotificationCard(
                  notification: controller.notifications[index],
                );
              }
            },
          )
        ],
      ),
    );
  }
}
