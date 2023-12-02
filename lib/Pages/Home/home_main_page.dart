import 'package:ai_health_assistance/Components/SharedWidgets/doctor_grid_card.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/hospital_card.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/section_title.dart';
import 'package:ai_health_assistance/Pages/Home/custom/ad_slider_card.dart';
import 'package:ai_health_assistance/Pages/Home/custom/ai_home_card.dart';
import 'package:ai_health_assistance/Pages/Home/custom/category_grid_element.dart';
import 'package:ai_health_assistance/Pages/Hospitals/hopitals_page.dart';
import 'package:ai_health_assistance/Pages/Pharmacies/pharmacies_page.dart';
import 'package:ai_health_assistance/Pages/doctors/doctors_page.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:carousel_animations/carousel_animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeMainPage extends StatelessWidget {
  const HomeMainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 5),
      children: [
        SizedBox(
          width: double.infinity,
          height: 22.h,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              if (index > 0) {
                return const AdsSliderCard();
              } else {
                return const AiHomeCard();
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
        SizedBox(
          height: 12.h,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                Expanded(
                  child: CategoryGridElement(
                    title: 'Doctors',
                    desc: "Find your best doctor",
                    onTap: () => Get.toNamed(DoctorsPage.id),
                    iconPath: "assets/svgs/doctor_icon.svg",
                  ),
                ),
                Expanded(
                  child: CategoryGridElement(
                    title: 'Health Centers',
                    desc: "Find your best Hospital",
                    onTap: () => Get.toNamed(HospitalsPage.id),
                    iconPath: "assets/svgs/hospital_icon.svg",
                  ),
                ),
                Expanded(
                  child: CategoryGridElement(
                    title: 'Pharmacies',
                    desc: "Explore medicine of your need",
                    onTap: () => Get.toNamed(PharmaciesPage.id),
                    iconPath: "assets/svgs/hospital_icon.svg",
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SectionTitle(
                title: 'Top doctors',
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "View all",
                    style: TextStyle(
                        color: AppColors.primaryColor, fontSize: 9.sp),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SectionTitle(title: "Top hospitals"),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "View all",
                    style: TextStyle(
                        color: AppColors.primaryColor, fontSize: 9.sp),
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 60, left: 5, right: 5),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (_, index) => HospitalCard(
              index: index.toString(),
            ),
          ),
        ),
      ],
    );
  }
}
