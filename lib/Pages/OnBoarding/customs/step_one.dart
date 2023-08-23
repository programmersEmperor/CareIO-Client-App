import 'dart:async';

import 'package:ai_health_assistance/Controllers/onboarding/onboarding_controller.dart';
import 'package:ai_health_assistance/Pages/OnBoarding/customs/step_two.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class StepOne extends StatefulWidget {
  const StepOne({super.key});

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> with TickerProviderStateMixin {
  late Animation<Offset> animationOffset;
  late Animation<double> animationSize;
  late Animation<Offset> animationSlide;
  late AnimationController animationController;
  late AnimationController animationControllerSize;
  late AnimationController animationControllerSlide;

  late Animation<Offset> animationOffsetTwo;
  late Animation<double> animationSizeTwo;
  late Animation<Offset> animationSlideTwo;
  late AnimationController animationControllerTwo;
  late AnimationController animationControllerSizeTwo;
  late AnimationController animationControllerSlideTwo;

  Widget switchWidget = SizedBox();

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: 2.seconds,
    );

    animationControllerSize = AnimationController(
      vsync: this,
      duration: 3.seconds,
    );

    animationControllerSlide = AnimationController(
      vsync: this,
      duration: 3800.milliseconds,
    );

    animationControllerTwo = AnimationController(
      vsync: this,
      duration: 3.seconds,
    );

    animationControllerSizeTwo = AnimationController(
      vsync: this,
      duration: 4.seconds,
    );

    animationControllerSlideTwo = AnimationController(
      vsync: this,
      duration: 4800.milliseconds,
    );

    animationOffset = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastEaseInToSlowEaseOut));

    animationSize = Tween<double>(end: 1.0, begin: 0.0).animate(CurvedAnimation(
        parent: animationControllerSize,
        curve: Curves.fastEaseInToSlowEaseOut));

    animationSlide = Tween<Offset>(
      begin: const Offset(0.0, 10),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
        parent: animationControllerSlide,
        curve: Curves.fastEaseInToSlowEaseOut));

    animationOffsetTwo = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
        parent: animationControllerTwo, curve: Curves.fastEaseInToSlowEaseOut));

    animationSizeTwo = Tween<double>(end: 1.0, begin: 0.0).animate(
        CurvedAnimation(
            parent: animationControllerSizeTwo,
            curve: Curves.fastEaseInToSlowEaseOut));

    animationSlideTwo = Tween<Offset>(
      begin: const Offset(0.0, 10),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
        parent: animationControllerSlideTwo,
        curve: Curves.fastEaseInToSlowEaseOut));

    switchWidget = OnBoardStepOne(
      animationOffset: animationOffset,
      animationSize: animationSize,
      animationController: animationController,
      animationControllerSize: animationControllerSize,
      animationControllerSlide: animationControllerSlide,
      animationSlide: animationSlide,
      animationOffsetTwo: animationOffsetTwo,
      animationSizeTwo: animationSizeTwo,
      animationControllerTwo: animationControllerTwo,
      animationControllerSizeTwo: animationControllerSizeTwo,
      animationControllerSlideTwo: animationControllerSlideTwo,
      animationSlideTwo: animationSlideTwo,
    );
  }

  @override
  Widget build(BuildContext context) {
    return switchWidget;
  }
}

class OnBoardStepOne extends StatefulWidget {
  const OnBoardStepOne({
    super.key,
    required this.animationOffset,
    required this.animationSize,
    required this.animationController,
    required this.animationControllerSize,
    required this.animationControllerSlide,
    required this.animationSlide,
    required this.animationOffsetTwo,
    required this.animationSizeTwo,
    required this.animationControllerTwo,
    required this.animationControllerSizeTwo,
    required this.animationControllerSlideTwo,
    required this.animationSlideTwo,
  });

  final Animation<Offset> animationOffset;
  final Animation<double> animationSize;
  final AnimationController animationController;
  final AnimationController animationControllerSize;
  final AnimationController animationControllerSlide;
  final Animation<Offset> animationSlide;

  final Animation<Offset> animationOffsetTwo;
  final Animation<double> animationSizeTwo;
  final AnimationController animationControllerTwo;
  final AnimationController animationControllerSizeTwo;
  final AnimationController animationControllerSlideTwo;
  final Animation<Offset> animationSlideTwo;

  @override
  State<OnBoardStepOne> createState() => _OnBoardStepOneState();
}

class _OnBoardStepOneState extends State<OnBoardStepOne> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SlideTransition(
          position: widget.animationOffset,
          child: Container(
            height: 60.h,
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
                ScaleTransition(
                  scale: widget.animationSize,
                  child: SizedBox(
                    height: 7.h,
                    width: 50.w,
                    child: Lottie.network(
                        'https://lottie.host/cbc83006-7807-467a-9f36-9498e2018bc0/4HaQhKFijq.json',
                        onLoaded: (com) {
                      widget.animationController.forward();
                      widget.animationControllerSize.forward();
                      widget.animationControllerSlide.forward();
                    }),
                  ),
                ),
                SlideTransition(
                  position: widget.animationSlide,
                  child: Padding(
                    padding: EdgeInsets.only(top: 18.sp),
                    child: AutoSizeText(
                      "AppName is  ai diagnoses app in the market yet ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                SlideTransition(
                  position: widget.animationSlide,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.sp),
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {
                          widget.animationController.reverse();
                          widget.animationControllerSize.reverse();
                          widget.animationControllerSlide.reverse();
                          widget.animationControllerTwo.forward();
                          widget.animationControllerSizeTwo.forward();
                          widget.animationControllerSlideTwo.forward();
                        },
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
        ),
        SlideTransition(
          position: widget.animationOffsetTwo,
          child: Container(
            height: 60.h,
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
                ScaleTransition(
                  scale: widget.animationSizeTwo,
                  child: SizedBox(
                    height: 7.h,
                    width: 50.w,
                    child: Lottie.network(
                        'https://lottie.host/cbc83006-7807-467a-9f36-9498e2018bc0/4HaQhKFijq.json',
                        onLoaded: (com) {
                      // widget.animationControllerTwo.forward();
                      // widget.animationControllerSizeTwo.forward();
                      // widget.animationControllerSlideTwo.forward();
                    }),
                  ),
                ),
                SlideTransition(
                  position: widget.animationSlideTwo,
                  child: Padding(
                    padding: EdgeInsets.only(top: 18.sp),
                    child: AutoSizeText(
                      "AppName is  ai diagnoses app in the market yet ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                SlideTransition(
                  position: widget.animationSlideTwo,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.sp),
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {
                          widget.animationControllerTwo.reverse();
                          widget.animationControllerSizeTwo.reverse();
                          widget.animationControllerSlideTwo.reverse();
                        },
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
        ),
      ],
    );
  }
}
