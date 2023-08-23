import 'package:ai_health_assistance/Controllers/onboarding/onboarding_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class StepTwo extends StatefulWidget {
  const StepTwo({super.key});

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  bool startSlide = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(seconds: 3),
      curve: Curves.fastEaseInToSlowEaseOut,
      offset: startSlide ? const Offset(0, 0) : const Offset(0, 5),
      child: Container(
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.clamp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedSize(
              duration: 3000.milliseconds,
              child: SizedBox(
                height: startSlide ? 7.h : 0.h,
                width: startSlide ? 50.w : 0.w,
                child: Lottie.network(
                    'https://lottie.host/cbc83006-7807-467a-9f36-9498e2018bc0/4HaQhKFijq.json',
                    onLoaded: (com) {
                  setState(() {
                    startSlide = true;
                  });
                }),
              ),
            ),
            AnimatedSlide(
              duration: const Duration(seconds: 1),
              curve: Curves.fastEaseInToSlowEaseOut,
              offset: startSlide ? const Offset(0, 0) : const Offset(0, 5),
              child: Padding(
                padding: EdgeInsets.only(top: 18.sp),
                child: AutoSizeText(
                  "AppName is t ai diagnoses app in the market yet ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            AnimatedSlide(
              offset: startSlide ? const Offset(0, 0) : const Offset(-12, 0),
              duration: 3.seconds,
              curve: Curves.fastEaseInToSlowEaseOut,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30.sp),
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
