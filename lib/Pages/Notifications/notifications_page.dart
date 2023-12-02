import 'package:ai_health_assistance/Components/SharedWidgets/page_header.dart';
import 'package:ai_health_assistance/Pages/Notifications/custom/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotificationsPage extends StatelessWidget {
  static const id = "/notificationPage";
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const PageHeader(heading: "My Notifications"),
        ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(10.sp),
          itemBuilder: (_, index) => const NotificationCard(),
        )
      ],
    );
  }
}
