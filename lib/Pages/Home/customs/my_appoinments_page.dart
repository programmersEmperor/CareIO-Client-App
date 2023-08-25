import 'package:ai_health_assistance/Pages/Home/UiController/home_page_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MyAppointmentsPage extends StatelessWidget {
  const MyAppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomePageController>();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.sp, left: 10.sp, right: 10.sp),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "My appointments",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.sp, left: 10.sp, right: 10.sp),
          child: Container(
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
                child: TabBar(
                  tabs: controller.tabs,
                  controller: controller.tabController,
                  indicator: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10.sp)),
                  labelPadding: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  indicatorPadding: EdgeInsets.all(4.sp),
                  enableFeedback: true,
                  unselectedLabelColor: Colors.black54,
                  overlayColor: const MaterialStatePropertyAll(Colors.black87),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller.tabController,
            children: [
              ListView.builder(
                itemCount: 2,
                padding: EdgeInsets.zero,
                itemBuilder: (_, index) => Padding(
                  padding:
                      EdgeInsets.only(top: 15.sp, left: 10.sp, right: 10.sp),
                  child: Card(
                    elevation: 15,
                    shadowColor: Colors.grey.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 15.sp, left: 15.sp, right: 15.sp, bottom: 10.sp),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    "Doctor name",
                                    style: TextStyle(
                                        fontSize: 12.5.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.sp),
                                    child: AutoSizeText(
                                      "Specialization",
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.black38,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                radius: 18.sp,
                                backgroundImage: const AssetImage(
                                    "assets/images/person.jpg"),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.sp),
                            child: const Divider(),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Boxicons.bxs_calendar,
                                        color: Colors.grey,
                                        size: 15.sp,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 2.sp, left: 2.sp, right: 2.sp),
                                        child: Text(
                                          "12/03/2021",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 9.sp),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Boxicons.bxs_time,
                                        color: Colors.grey,
                                        size: 15.sp,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 2.sp, left: 2.sp, right: 2.sp),
                                        child: Text(
                                          "10:30 AM",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 9.sp),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Boxicons.bxs_circle,
                                        color: index == 1
                                            ? Colors.green
                                            : Colors.orange,
                                        size: 10.sp,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 1.sp, left: 2.sp, right: 2.sp),
                                        child: Text(
                                          index == 1 ? "confirmed" : "review",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 10.sp),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.sp),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        fixedSize: MaterialStatePropertyAll(
                                            Size(100.w, 4.5.h)),
                                        elevation:
                                            const MaterialStatePropertyAll(0),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Theme.of(context)
                                                    .scaffoldBackgroundColor),
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        7.sp)))),
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        fixedSize: MaterialStatePropertyAll(
                                            Size(100.w, 4.5.h)),
                                        elevation:
                                            const MaterialStatePropertyAll(0),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Theme.of(context).primaryColor),
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        7.sp)))),
                                    child: const Text(
                                      "Reschedule",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Text("Upcoming"),
              const Text("Upcoming"),
            ],
          ),
        ),
      ],
    );
  }
}
