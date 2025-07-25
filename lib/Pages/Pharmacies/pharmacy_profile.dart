import 'package:ai_health_assistance/Components/SharedWidgets/back_circle_button.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/hospital_card.dart';
import 'package:ai_health_assistance/Pages/Hospitals/hospital_profile.dart';
import 'package:ai_health_assistance/Pages/Pharmacies/controller/pharmacy_profile.dart';
import 'package:ai_health_assistance/Pages/Pharmacies/medicine_profile.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Components/SharedWidgets/section_title.dart';

class PharmacyProfile extends StatelessWidget {
  static const id = "/PharmacyProfile";
  final int index;
  const PharmacyProfile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Get.put(PharmacyUiProfileController());
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overflow) {
          overflow.disallowIndicator();
          return true;
        },
        child: Stack(
          children: [
            CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: 30.sp,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: AppColors.primaryColor,
                    statusBarIconBrightness: Brightness.light,
                  ),
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackCircleButton(),
                    ],
                  ),
                  backgroundColor: AppColors.primaryColor,
                  expandedHeight: 60.sp,
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 50.sp,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () => Get.toNamed(MedicineProfile.id),
                                  child: Card(
                                    elevation: 10.sp,
                                    shadowColor: Colors.blueGrey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.sp)),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                      child: Hero(
                                        tag: "medicine$index",
                                        child: SizedBox.shrink()
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.sp,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 4.sp),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 15.sp,
                                          ),
                                          Text(
                                            "3.4",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 9.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.sp,
                                          ),
                                          AutoSizeText(
                                            "صيدليات اليمن السعيد",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 20.sp,
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding: EdgeInsets.all(5.sp),
                                              decoration: BoxDecoration(
                                                  color: AppColors.primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.sp)),
                                              child: Icon(
                                                Boxicons.bxs_phone_call,
                                                color: Colors.white,
                                                size: 15.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 4.sp,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Chip(
                                            backgroundColor:
                                                AppColors.secondaryColor,
                                            labelPadding: EdgeInsets.symmetric(
                                                horizontal: 15.sp),
                                            label: Text(
                                              "Opened",
                                              style: TextStyle(
                                                  fontSize: 8.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      AppColors.primaryColor),
                                            ),
                                            padding: EdgeInsets.zero,
                                          ),
                                          SizedBox(
                                            width: 10.sp,
                                          ),
                                          Icon(
                                            Icons.location_pin,
                                            size: 10.sp,
                                            color: AppColors.primaryColor,
                                          ),
                                          SizedBox(
                                            width: 5.sp,
                                          ),
                                          Text(
                                            "Sana'a Aljamanah",
                                            style: TextStyle(
                                                fontSize: 9.sp,
                                                color: Colors.black38),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5.sp,
                                ),
                                const SectionTitle(title: "Search"),
                                SizedBox(
                                  height: 5.sp,
                                ),
                                // CustomSearchBar(
                                //     title: "find your medicine",
                                //     showFilter: false,
                                //     controller: controller),
                                SizedBox(
                                  height: 15.sp,
                                ),
                                const SectionTitle(title: "Loaction"),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.sp),
                                  child: SizedBox(
                                    width: 100.w,
                                    height: 25.h,
                                    child: Card(
                                      color: Colors.white,
                                      elevation: 15.sp,
                                      shadowColor: AppColors.secondaryColor
                                          .withOpacity(0.4),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.sp)),
                                      child: const Center(
                                          child: Text("Map Place")),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.sp,
                                ),
                                const SectionTitle(title: "More Pharamacies"),
                                ListView.builder(
                                  itemCount: 3,
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemBuilder: (_, index) => InkWell(
                                    onTap: () => Get.toNamed(HospitalProfile.id,
                                        arguments: [
                                          {'index': '1'}
                                        ]),
                                    child: const HospitalCard(),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
