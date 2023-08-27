import 'package:ai_health_assistance/Pages/doctors/UiController/doctor_profile_ui_controller.dart';
import 'package:ai_health_assistance/Pages/doctors/customs/day_timeslot_item.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DoctorProfile extends StatelessWidget {
  static const id = "/DoctorProfile";
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    DoctorProfileUiController controller = Get.put(DoctorProfileUiController());
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: "doc1",
            child: Container(
              height: 40.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/person.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 25.sp, bottom: 5.sp, right: 10.sp, left: 10.sp),
            child: SizedBox(
              height: 7.h,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Boxicons.bx_dots_vertical),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () => Container(
                height: controller.height.value,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.sp),
                    topLeft: Radius.circular(20.sp),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: controller.scrollController,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.sp),
                    child: Column(
                      children: [
                        Container(
                          height: 3.sp,
                          width: 20.w,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(15.sp)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.sp, vertical: 20.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          "Dr.Haitham Hussien Dr.Haitham Hussien Dr.Haitham Hussien",
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 4.sp),
                                          child: AutoSizeText(
                                            "Specialization",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.black38,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 4.sp),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                              Text(
                                                "3.4",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12.sp,
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
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(12.sp)),
                                      child: const Column(
                                        children: [
                                          Icon(
                                            Boxicons.bxs_phone_call,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 15.sp),
                                child: const AutoSizeText(
                                    "lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem"),
                              ),
                              AutoSizeText(
                                "Timeslots",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14.sp),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8.sp),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DayTimeSLotItem(
                                      day: "Sat",
                                    ),
                                    DayTimeSLotItem(
                                      day: "Sun",
                                    ),
                                    DayTimeSLotItem(
                                      day: "Mon",
                                    ),
                                    DayTimeSLotItem(
                                      day: "Tus",
                                    ),
                                    DayTimeSLotItem(
                                      day: "Wed",
                                    ),
                                    DayTimeSLotItem(
                                      day: "Thu",
                                    ),
                                    DayTimeSLotItem(
                                      day: "Fri",
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 18.sp),
                                child: AutoSizeText(
                                  "Also find me at",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 14.sp),
                                ),
                              ),
                              // const Row(
                              //   children: [
                              //     Icon(
                              //       Boxicons.bxs_time,
                              //     ),
                              //     AutoSizeText("From 10:00 AM to 05:00 PM"),
                              //   ],
                              // ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 8.0.sp, bottom: 20.sp),
                                child: InkWell(
                                  onTap: () => Get.toNamed(DoctorProfile.id),
                                  child: SizedBox(
                                    child: Card(
                                      elevation: 15.sp,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.sp),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 12.sp,
                                            right: 12.sp,
                                            top: 5.sp,
                                            bottom: 10.sp),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 40.sp,
                                              width: 40.sp,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.sp),
                                                  border: Border.all(
                                                      color: Theme.of(context)
                                                          .scaffoldBackgroundColor,
                                                      width: 3.sp),
                                                  image: const DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        "assets/images/person.jpg"),
                                                  )),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 8.0.sp,
                                                    right: 5.0.sp,
                                                    top: 13.sp),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Doctor name",
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 3.5.sp),
                                                      child: Text(
                                                        "Specialization",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize: 10.sp,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 3.5.sp),
                                                      child: Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.yellow,
                                                          ),
                                                          Text(
                                                            "3.4",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12.sp,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            CircleAvatar(
                                              backgroundColor: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                size: 12.sp,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    fixedSize: MaterialStatePropertyAll(
                                        Size(100.w, 6.h)),
                                    elevation:
                                        const MaterialStatePropertyAll(15),
                                    shadowColor: MaterialStatePropertyAll(
                                        Theme.of(context).primaryColor),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Theme.of(context).primaryColor),
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.sp)))),
                                child: const Text(
                                  "Book now",
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
