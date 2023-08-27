import 'package:ai_health_assistance/Components/SharedWidgets/stack_button.dart';
import 'package:ai_health_assistance/Pages/Home/animations/animation_handler.dart';
import 'package:ai_health_assistance/Pages/Home/customs/ad_slider_card.dart';
import 'package:ai_health_assistance/Pages/Home/customs/category_grid_element.dart';
import 'package:ai_health_assistance/Pages/doctors/doctors_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_animations/carousel_animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class HomeMainPage extends StatelessWidget {
  const HomeMainPage({
    super.key,
    required this.animationHandler,
  });

  final HomeAnimationHandler animationHandler;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SlideTransition(
          position: animationHandler.adsCardAnimation,
          child: Padding(
            padding: EdgeInsets.only(top: 10.sp),
            child: SizedBox(
              width: 100.w,
              height: 23.h,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return const AdsSliderCard();
                },
                itemCount: 3,
                autoplay: true,
                outer: true,
                loop: true,
                autoplayDelay: 6000,
                duration: 1000,
                pagination:
                    const SwiperPagination(builder: SwiperPagination.rect),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: SlideTransition(
            position: animationHandler.aiCardAnimation,
            child: SizedBox(
              width: 100.w,
              height: 18.h,
              child: Stack(
                children: [
                  Card(
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                    child: SizedBox(
                      height: 15.h,
                      width: 100.w,
                      child: Stack(
                        children: [
                          Positioned(
                            left: -70.sp,
                            top: -40.sp,
                            child: Lottie.asset(
                              "assets/animations/robot.json",
                              width: 80.w,
                              frameRate: FrameRate(60),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.sp),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 5.sp, bottom: 5.sp, left: 75.sp),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          "Healio Ai",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.sp),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 3.sp),
                                          child: AutoSizeText(
                                            "Experience the power of Ai now",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8.sp),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 40.sp,
                    bottom: 0,
                    child: const StackButton(),
                  )
                ],
              ),
            ),
          ),
        ),
        SlideTransition(
          position: animationHandler.catCardAnimation,
          child: SizedBox(
            height: 16.h,
            width: 100.w,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(top: 10.sp),
              children: [
                CategoryGridElement(
                  title: 'Doctors',
                  desc: "Find your best doctor",
                  onTap: () => Get.toNamed(DoctorsPage.id),
                  iconPath: "assets/svgs/doctor_icon.svg",
                ),
                CategoryGridElement(
                  title: 'Hospitals',
                  desc: "Find your best Hospital",
                  onTap: () {},
                  iconPath: "assets/svgs/hospital_icon.svg",
                ),
                CategoryGridElement(
                  title: 'Medicine',
                  desc: "Explore medicine of your need",
                  onTap: () {},
                  iconPath: "assets/svgs/medicine_icon.svg",
                ),
                CategoryGridElement(
                  title: 'Medicine',
                  desc: "Explore medicine of your need",
                  onTap: () {},
                  iconPath: "assets/svgs/medicine_icon.svg",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
