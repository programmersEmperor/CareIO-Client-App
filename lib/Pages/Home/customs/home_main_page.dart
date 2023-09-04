import 'package:ai_health_assistance/Components/SharedWidgets/stack_button.dart';
import 'package:ai_health_assistance/Pages/Home/animations/animation_handler.dart';
import 'package:ai_health_assistance/Pages/Home/customs/ad_slider_card.dart';
import 'package:ai_health_assistance/Pages/Home/customs/category_grid_element.dart';
import 'package:ai_health_assistance/Pages/doctors/doctors_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_animations/carousel_animations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee/marquee.dart';
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
      padding: EdgeInsets.only(top: 5.sp),
      children: [
        SizedBox(
          width: 100.w,
          height: 25.h,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              if (index > 0) {
                return const AdsSliderCard();
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 0),
                  child: SlideTransition(
                    position: animationHandler.aiCardAnimation,
                    child: SizedBox(
                      width: 100.w,
                      child: Stack(
                        children: [
                          Card(
                            color: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.sp),
                            ),
                            child: SizedBox(
                              width: 100.w,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: -50.sp,
                                    top: -20.sp,
                                    child: Opacity(
                                        opacity: 0.3,
                                        child: RotationTransition(
                                          turns:
                                              animationHandler.dottedAnimation,
                                          child: DottedBorder(
                                              borderType: BorderType.RRect,
                                              radius: Radius.circular(70.sp),
                                              color: Colors.white,
                                              child: SizedBox(
                                                height: 15.h,
                                                width: 30.w,
                                              )),
                                        )),
                                  ),
                                  Positioned(
                                    right: -90.sp,
                                    top: -40.sp,
                                    child: Opacity(
                                      opacity: 0.3,
                                      child: Lottie.asset(
                                        "assets/animations/robot.json",
                                        reverse: true,
                                        width: 80.w,
                                        frameRate: FrameRate(60),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 50.sp,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.sp),
                                          child: AutoSizeText(
                                            "Healio Ai",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.sp),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 3.sp),
                                          child: Text(
                                            "Experience the power of Ai now",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.sp),
                                          ),
                                        ),
                                        const StackButton(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
            itemCount: 1,
            autoplay: true,
            outer: true,
            loop: true,
            autoplayDelay: 6000,
            duration: 3000,
            pagination: const SwiperPagination(builder: SwiperPagination.rect),
          ),
        ),
        SlideTransition(
          position: animationHandler.catCardAnimation,
          child: SizedBox(
            height: 13.h,
            width: 100.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.sp),
              child: Row(
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
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 0.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top doctors",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 13.sp),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "View all",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 10.sp),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 32.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.sp),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemCount: 3,
              itemBuilder: (_, index) => SizedBox(
                height: 35.h,
                width: 39.w,
                child: Card(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.sp),
                          child: Container(
                            height: 20.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                'assets/images/person.jpg',
                                fit: BoxFit.cover,
                                width: 31.w,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 5.sp, right: 5.sp, top: 8.sp),
                            child: AutoSizeText(
                              "Dr haitham Hussien",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              overflowReplacement: Marquee(
                                text: "Dr haitham Hussien",
                                blankSpace: 20.0,
                                accelerationCurve: Curves.easeOut,
                                velocity: 50.0,
                                startPadding: 2.0,
                                showFadingOnlyWhenScrolling: true,
                                startAfter: 5.seconds,
                                fadingEdgeEndFraction: 0.5.sp,
                                fadingEdgeStartFraction: 0.5.sp,
                                pauseAfterRound: 5.seconds,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 5.sp,
                              right: 5.sp,
                              top: 2.sp,
                            ),
                            child: Text(
                              "Specialization",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 8.sp,
                                  color: Colors.black45),
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
        )
      ],
    );
  }
}
