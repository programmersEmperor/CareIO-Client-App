import 'package:ai_health_assistance/Components/SharedWidgets/main_colored_button.dart';
import 'package:ai_health_assistance/Pages/doctors/UiController/doctor_profile_ui_controller.dart';
import 'package:ai_health_assistance/Pages/doctors/customs/day_timeslot_item.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DoctorProfile extends StatelessWidget {
  static const id = "/DoctorProfile";
  final String index;
  const DoctorProfile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    DoctorProfileUiController controller = Get.put(DoctorProfileUiController());
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overflow) {
          overflow.disallowIndicator();
          return true;
        },
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 60,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.only(
                            left: 10.sp, top: 5.sp, bottom: 5.sp, right: 5.sp),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context).primaryColor,
                          size: 15.sp,
                        ),
                      )),
                  //AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(10),
                child: Container(
                  width: double.infinity,
                  height: 20,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.sp),
                      topRight: Radius.circular(25.sp),
                    ),
                  ),
                ),
              ),
              pinned: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              expandedHeight: 200.sp,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: "doc$index",
                  child: Image.asset(
                    "assets/images/person.jpg",
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: 3.sp,
                    width: 20.w,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.sp, vertical: 20.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    "Dr.Haitham Hussien ",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 4.sp),
                                    child: AutoSizeText(
                                      "Specialization",
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        color: Colors.black38,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 4.sp),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                          size: 15.sp,
                                        ),
                                        Text(
                                          "3.4",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(9.sp),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(12.sp)),
                                child: Icon(
                                  Boxicons.bxs_phone_call,
                                  color: Colors.white,
                                  size: 15.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.sp),
                          child: AutoSizeText(
                            "lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem",
                            style: TextStyle(
                                fontSize: 9.sp, color: Colors.black45),
                          ),
                        ),
                        AutoSizeText(
                          "Timeslots",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 10.sp),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.sp),
                          child: SizedBox(
                            height: 5.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.dayTimeSlotList.length,
                              itemBuilder: (_, index) => DayTimeSLotItem(
                                dayTimeSlot: controller.dayTimeSlotList[index],
                                onTap: () => controller.onTapDayTimeSlot(index),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.sp),
                          child: Obx(
                            () => AnimatedSwitcher(
                              duration: 300.milliseconds,
                              layoutBuilder: (child, list) {
                                return Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: child,
                                );
                              },
                              child: controller.activeTimeSlotWidget.value,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 18.sp),
                          child: AutoSizeText(
                            "My location",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 10.sp),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 18.sp),
                          child: SizedBox(
                            width: 100.w,
                            height: 25.h,
                            child: Card(
                              color: Colors.white,
                              elevation: 15.sp,
                              shadowColor:
                                  Theme.of(context).cardColor.withOpacity(0.4),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.sp)),
                              child: const Center(child: Text("Map Place")),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 18.sp),
                          child: AutoSizeText(
                            "Also find me at",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 10.sp),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10.0.sp,
                            bottom: 20.0.sp,
                          ),
                          child: InkWell(
                            onTap: () =>
                                Get.toNamed(DoctorProfile.id, arguments: [
                              {'index': index.toString()}
                            ]),
                            child: SizedBox(
                              child: Card(
                                elevation: 0.sp,
                                color: Colors.white,
                                shadowColor: Colors.grey.shade100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.sp),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.sp, vertical: 7.sp),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 50.sp,
                                        width: 50.sp,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.sp),
                                            border: Border.all(
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                                width: 3.sp),
                                            image: const DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                "assets/images/person.jpg",
                                              ),
                                            )),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.0.sp,
                                              right: 5.0.sp,
                                              top: 0.sp),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Hosptial name",
                                                style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 3.5.sp),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.orange,
                                                      size: 10.sp,
                                                    ),
                                                    Text(
                                                      "3.4 (134 Review)",
                                                      style: TextStyle(
                                                        color: Colors.black38,
                                                        fontSize: 8.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 3.5.sp),
                                                child: Text(
                                                  "Specialization  Specialization ",
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 8.sp,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Center(
                                          child: CircleAvatar(
                                            backgroundColor: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            radius: 12.sp,
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 10.sp,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.sp),
                          child: MainColoredButton(
                            text: "Book now",
                            onPress: () {},
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
