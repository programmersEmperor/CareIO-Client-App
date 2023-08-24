import 'package:ai_health_assistance/Components/SharedWidgets/stack_button.dart';
import 'package:ai_health_assistance/Pages/Home/customs/ad_slider_card.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_animations/carousel_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<IconData> icons = [
    Boxicons.bx_list_check,
    Boxicons.bx_home_circle,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        leadingWidth: 20.w,
        leading: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.sp),
          child: Container(
            height: 7.h,
            width: 7.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                  image: AssetImage("assets/images/person.jpg")),
              color: Theme.of(context).primaryColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 2))
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.sp,
            ),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Boxicons.bx_bell,
                  size: 25.sp,
                  color: Colors.black45,
                )),
          )
        ],
      ),*/
      //destination screen

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.person_2_sharp),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: icons,
        activeIndex: 1,
        activeColor: Theme.of(context).primaryColor,
        iconSize: 20.sp,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10.sp,
        rightCornerRadius: 10.sp,
        onTap: (index) {},
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.sp),
              child: SizedBox(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.grey.shade400,
                              spreadRadius: 5)
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 25.0,
                        backgroundImage: AssetImage("assets/images/person.jpg"),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good morning ",
                              style: TextStyle(
                                  fontSize: 11.sp, color: Colors.black54),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 1.sp),
                              child: Text(
                                "Haitham Hussien",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Badge(child: Icon(Boxicons.bx_bell)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 100.w,
              height: 24.h,
              child: Stack(
                children: [
                  Card(
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                    child: SizedBox(
                      height: 20.h,
                      width: 100.w,
                      child: Stack(
                        children: [
                          Positioned(
                            left: -100.sp,
                            top: -40.sp,
                            child: Lottie.network(
                              "https://lottie.host/8a4fd2c4-4be1-4655-a52c-5a18dea4e53c/xRDFi5rq0T.json",
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
            Padding(
              padding: EdgeInsets.only(top: 15.sp),
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
          ],
        ),
      ),
    );
  }
}
