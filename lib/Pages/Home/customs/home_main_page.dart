import 'package:ai_health_assistance/Components/SharedWidgets/stack_button.dart';
import 'package:ai_health_assistance/Pages/Home/animations/animation_handler.dart';
import 'package:ai_health_assistance/Pages/Home/customs/ad_slider_card.dart';
import 'package:ai_health_assistance/Pages/Home/customs/category_grid_element.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_animations/carousel_animations.dart';
import 'package:flutter/material.dart';
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
      children: [
        SlideTransition(
          position: animationHandler.aiCardAnimation,
          child: SizedBox(
            width: 100.w,
            height: 21.h,
            child: Stack(
              children: [
                Card(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                  child: SizedBox(
                    height: 18.h,
                    width: 100.w,
                    child: Stack(
                      children: [
                        Positioned(
                          left: -100.sp,
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
                                      top: 5.sp, bottom: 5.sp, left: 50.sp),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        "Healio Ai",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17.sp),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: AutoSizeText(
                                          "Experience the power of Ai now",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.sp),
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
        SlideTransition(
          position: animationHandler.adsCardAnimation,
          child: Padding(
            padding: EdgeInsets.only(top: 10.sp),
            child: SizedBox(
              width: 100.w,
              height: 25.h,
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
        SlideTransition(
          position: animationHandler.catCardAnimation,
          child: SizedBox(
            height: 55.h,
            width: 100.w,
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18.sp,
                  crossAxisSpacing: 30.sp,
                  mainAxisExtent: 25.h),
              children: const [
                CategoryGridElement(
                    title: 'Doctors', desc: "Find your best doctor"),
                CategoryGridElement(
                    title: 'Hospitals', desc: "Find your best Hospital"),
                CategoryGridElement(
                    title: 'Medicine', desc: "Explore medicine of your need"),
                CategoryGridElement(
                    title: 'clinics', desc: "Book your clinic appointment now"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
