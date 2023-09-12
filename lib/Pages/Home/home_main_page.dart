import 'package:ai_health_assistance/Components/SharedWidgets/doctor_grid_card.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/hospital_card.dart';
import 'package:ai_health_assistance/Pages/Home/animations/animation_handler.dart';
import 'package:ai_health_assistance/Pages/Home/customs/ad_slider_card.dart';
import 'package:ai_health_assistance/Pages/Home/customs/ai_home_card.dart';
import 'package:ai_health_assistance/Pages/Home/customs/category_grid_element.dart';
import 'package:ai_health_assistance/Pages/doctors/doctors_page.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:carousel_animations/carousel_animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                return AiHomeCard(animationHandler: animationHandler);
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
        SlideTransition(
          position: animationHandler.catCardAnimation,
          child: Padding(
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
                          color: AppColors.primaryColor, fontSize: 10.sp),
                    )),
              ],
            ),
          ),
        ),
        SlideTransition(
          position: animationHandler.catCardAnimation,
          child: SizedBox(
            height: 32.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.sp),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: 3,
                itemBuilder: (_, index) => DoctorGridCard(
                  index: index,
                ),
              ),
            ),
          ),
        ),
        SlideTransition(
          position: animationHandler.catCardAnimation,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 0.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top hospitals",
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
                          color: AppColors.primaryColor, fontSize: 10.sp),
                    )),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 60.sp, left: 5.sp, right: 5.sp),
          child: SlideTransition(
            position: animationHandler.catCardAnimation,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (_, index) => const HospitalCard(),
            ),
          ),
        ),
      ],
    );
  }
}
