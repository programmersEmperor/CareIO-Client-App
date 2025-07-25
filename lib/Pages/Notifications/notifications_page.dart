import 'package:ai_health_assistance/Components/SharedWidgets/connectivity_widget.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/no_data_widget.dart';
import 'package:ai_health_assistance/Models/Notification.dart' as model;
import 'package:ai_health_assistance/Components/SharedWidgets/page_header.dart';
import 'package:ai_health_assistance/Localization/app_strings.dart';
import 'package:ai_health_assistance/Pages/Notifications/custom/notification_card.dart';
import 'package:ai_health_assistance/Pages/Notifications/notification_controller.dart';
import 'package:ai_health_assistance/Services/connectivityService/connectivity_service.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sizer/sizer.dart';

class NotificationsPage extends StatelessWidget {
  static const id = "/notificationPage";
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.find<NotificationController>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Column(
        children: [
          PageHeader(heading: AppStrings.notification.tr),
          Expanded(
              child: RefreshIndicator(
                color: AppColors.primaryColor,
                onRefresh:  () async {
                  await Get.find<ConnectivityHandler>().refreshOnline();
                  controller.pagingController.refresh();
                },
                child: ConnectivityWidget(
                  child: PagedListView<int, model.Notification>(

                    builderDelegate: PagedChildBuilderDelegate<model.Notification>(
                      newPageProgressIndicatorBuilder: (_)=> Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SpinKitFadingCircle(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      animateTransitions: true,
                      noItemsFoundIndicatorBuilder: (_)=> Center(
                        child: NoDataWidget(message: "No Notifications Yet!", top: 0),
                      ),
                      firstPageProgressIndicatorBuilder: (_) =>
                          SpinKitFadingCircle(
                            color: AppColors.primaryColor,
                          ),
                      itemBuilder: (context, item, index) => NotificationCard(notification: item),
                    ),
                    pagingController: controller.pagingController,
                  ),
                ),
              ),
          ),
        ],
      ),
    );


    // return RefreshWidget(
    //   onRefresh: controller.fetchNotifications,
    //   isLoading: controller.isLoading,
    //   child: ListView(
    //     padding: EdgeInsets.zero,
    //     children: [
    //       PageHeader(heading: AppStrings.notification.tr),
    //       ListView.builder(
    //         itemCount: controller.notifications.isEmpty
    //             ? 1
    //             : controller.notifications.length,
    //         shrinkWrap: true,
    //         physics: const NeverScrollableScrollPhysics(),
    //         padding: EdgeInsets.all(10.sp),
    //         itemBuilder: (_, index) {
    //           if (controller.notifications.isEmpty) {
    //             return NoDataWidget(message: AppStrings.noNotification.tr);
    //           } else {
    //             return NotificationCard(
    //               notification: controller.notifications[index],
    //             );
    //           }
    //         },
    //       )
    //     ],
    //   ),
    // );
  }
}
