import 'package:ai_health_assistance/Components/SharedWidgets/page_header.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/refresh_indicator_widget.dart';
import 'package:ai_health_assistance/Pages/Home/controller/appointment_controller.dart';
import 'package:ai_health_assistance/Pages/Home/custom/AppointmentsWidget.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:ai_health_assistance/Utils/appointment_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MyAppointmentsPage extends StatelessWidget {
  const MyAppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppointmentController controller = Get.put(AppointmentController());
    return Column(
      children: [
        const PageHeader(heading: "My Appointments"),
        Padding(
          padding: EdgeInsets.only(
            top: 15.sp,
            left: 10.sp,
            right: 10.sp,
          ),
          child: Container(
            height: 35.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              color: Colors.grey.shade300,
            ),
            child: Padding(
              padding: EdgeInsets.all(2.sp),
              child: Material(
                color: Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                child: Theme(
                  data: ThemeData().copyWith(
                    splashColor: Colors.transparent,
                    useMaterial3: false,
                    highlightColor: Colors.transparent,
                  ),
                  child: TabBar(
                    tabs: controller.tabs,
                    controller: controller.tabController,
                    indicator: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    labelPadding: EdgeInsets.zero,
                    labelColor: Colors.white,
                    padding: EdgeInsets.zero,
                    labelStyle: TextStyle(fontSize: 10.sp),
                    enableFeedback: false,
                    indicatorPadding: EdgeInsets.all(4.sp),
                    unselectedLabelColor: Colors.black54,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller.tabController,
            children: [
              Obx(
                () => RefreshWidget(
                  onRefresh: () => controller.initializeAppointments(
                      status: AppointmentStatus.upcoming),
                  isLoading:
                      controller.isLoading[AppointmentStatus.upcoming.index],
                  child: AppointmentsWidget(
                    appointments: controller.upcomingAppointments,
                    onRefresh: () => controller.initializeAppointments(
                        status: AppointmentStatus.upcoming),
                    isLoading:
                        controller.isLoading[AppointmentStatus.upcoming.index],
                  ),
                ),
              ),
              Obx(
                () => RefreshWidget(
                  onRefresh: () => controller.initializeAppointments(
                    status: AppointmentStatus.canceled,
                  ),
                  isLoading:
                      controller.isLoading[AppointmentStatus.canceled.index],
                  child: AppointmentsWidget(
                    appointments: controller.completedAppointments,
                    onRefresh: () => controller.initializeAppointments(
                        status: AppointmentStatus.completed),
                    isLoading:
                        controller.isLoading[AppointmentStatus.completed.index],
                  ),
                ),
              ),
              Obx(
                () => RefreshWidget(
                  onRefresh: () => controller.initializeAppointments(
                    status: AppointmentStatus.canceled,
                  ),
                  isLoading:
                      controller.isLoading[AppointmentStatus.canceled.index],
                  child: AppointmentsWidget(
                    appointments: controller.canceledAppointments,
                    onRefresh: () => controller.initializeAppointments(
                        status: AppointmentStatus.canceled),
                    isLoading:
                        controller.isLoading[AppointmentStatus.canceled.index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
