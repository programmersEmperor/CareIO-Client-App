import 'dart:async';

import 'package:ai_health_assistance/Controllers/onboarding/onboarding_controller.dart';
import 'package:ai_health_assistance/Pages/OnBoarding/customs/step_one.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage>
    with TickerProviderStateMixin {
  late VideoPlayerController videoPlayerController;

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

  late Animation<Offset> animationOffsetThree;
  late Animation<double> animationSizeThree;
  late Animation<Offset> animationSlideThree;
  late AnimationController animationControllerThree;
  late AnimationController animationControllerSizeThree;
  late AnimationController animationControllerSlideThree;

  @override
  void initState() {
    super.initState();

    videoPlayerController = VideoPlayerController.asset(
      'assets/videos/onboard_video.mp4',
    );
    videoPlayerController.setLooping(true);
    videoPlayerController.setPlaybackSpeed(0.5);
    videoPlayerController.initialize().then((value) {
      setState(() {});
    });

    videoPlayerController.play();

    animationController = AnimationController(
      vsync: this,
      duration: 1.seconds,
    );

    animationControllerSize = AnimationController(
      vsync: this,
      duration: 1.seconds,
    );

    animationControllerSlide = AnimationController(
      vsync: this,
      duration: 1800.milliseconds,
    );

    animationControllerTwo = AnimationController(
      vsync: this,
      duration: 1.seconds,
    );

    animationControllerSizeTwo = AnimationController(
      vsync: this,
      duration: 2.seconds,
    );

    animationControllerSlideTwo = AnimationController(
      vsync: this,
      duration: 1800.milliseconds,
    );

    animationControllerThree = AnimationController(
      vsync: this,
      duration: 1.seconds,
    );

    animationControllerSizeThree = AnimationController(
      vsync: this,
      duration: 1.seconds,
    );

    animationControllerSlideThree = AnimationController(
      vsync: this,
      duration: 1800.milliseconds,
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

    animationOffsetThree = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
        parent: animationControllerThree,
        curve: Curves.fastEaseInToSlowEaseOut));

    animationSizeThree = Tween<double>(end: 1.0, begin: 0.0).animate(
        CurvedAnimation(
            parent: animationControllerSizeThree,
            curve: Curves.fastEaseInToSlowEaseOut));

    animationSlideThree = Tween<Offset>(
      begin: const Offset(0.0, 10),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
        parent: animationControllerSlideThree,
        curve: Curves.fastEaseInToSlowEaseOut));
  }

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            fit: StackFit.expand,
            children: [
              FittedBox(
                fit: BoxFit.fitHeight,
                alignment: Alignment.center,
                child: SizedBox(
                  height: videoPlayerController.value.size.height,
                  width: videoPlayerController.value.size.width,
                  child: AspectRatio(
                    aspectRatio: videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(
                      videoPlayerController,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: animationOffset,
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
                      scale: animationSize,
                      child: SizedBox(
                        height: 7.h,
                        width: 50.w,
                        child: Lottie.network(
                            'https://lottie.host/cbc83006-7807-467a-9f36-9498e2018bc0/4HaQhKFijq.json',
                            onLoaded: (com) {
                          animationController.forward();
                          animationControllerSize.forward();
                          animationControllerSlide.forward();
                        }),
                      ),
                    ),
                    SlideTransition(
                      position: animationSlide,
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
                      position: animationSlide,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.sp),
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            onPressed: () {
                              animationController.reverse();
                              animationControllerSize.reverse();
                              animationControllerSlide.reverse();

                              animationControllerTwo.forward();
                              animationControllerSizeTwo.forward();
                              animationControllerSlideTwo.forward();
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
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: animationOffsetTwo,
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
                      scale: animationSizeTwo,
                      child: SizedBox(
                        height: 7.h,
                        width: 50.w,
                        child: FittedBox(
                          child: Lottie.network(
                            'https://lottie.host/cbc83006-7807-467a-9f36-9498e2018bc0/4HaQhKFijq.json',
                          ),
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: animationSlideTwo,
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
                      position: animationSlideTwo,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.sp),
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            onPressed: () {
                              animationControllerTwo.reverse();
                              animationControllerSizeTwo.reverse();
                              animationControllerSlideTwo.reverse();

                              animationControllerThree.forward();
                              animationControllerSizeThree.forward();
                              animationControllerSlideThree.forward();
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
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: animationOffsetThree,
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
                      scale: animationSizeThree,
                      child: SizedBox(
                        height: 7.h,
                        width: 50.w,
                        child: Lottie.network(
                          'https://lottie.host/cbc83006-7807-467a-9f36-9498e2018bc0/4HaQhKFijq.json',
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: animationSlideThree,
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
                      position: animationSlideThree,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.sp),
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: FloatingActionButton.extended(
                            backgroundColor: Colors.white,
                            onPressed: () {
                              Get.bottomSheet(
                                const SignInPage(),
                                isDismissible: true,
                                enableDrag: true,
                                isScrollControlled: true,
                                elevation: 20,
                              );
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            isExtended: true,
                            label: const Text(
                              "Let`s Start !",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({
    super.key,
  });

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      builder: (context) => Container(
          padding: EdgeInsets.symmetric(vertical: 30.sp, horizontal: 0.sp),
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 30.sp,
                ),
                child: FormBuilder(
                    child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 50.w,
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25.sp,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 25.0.sp, left: 20.sp, right: 20.sp),
                      child: FormBuilderTextField(
                        name: 'email|phone',
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          filled: true,
                          fillColor: const Color(0xff302ac2).withOpacity(0.1),
                          hintText: "Email | Phone",
                          hintStyle: TextStyle(
                            fontSize: 9.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 25.0.sp, left: 20.sp, right: 20.sp),
                      child: FormBuilderTextField(
                        name: 'email|phone',
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          filled: true,
                          fillColor: const Color(0xff302ac2).withOpacity(0.1),
                          suffixIcon: Icon(
                            Boxicons.bx_show,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            fontSize: 9.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 25.0.sp, left: 20.sp, right: 20.sp),
                      child: FormBuilderCheckbox(
                          activeColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          name: 'agree',
                          title: Wrap(
                            children: [
                              Text("I agree to the "),
                              Text(
                                "Terms & Conditions ",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    decoration: TextDecoration.underline),
                              ),
                              Text("and "),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  "Privacy Policy",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 25.0.sp, left: 20.sp, right: 20.sp),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            elevation: const MaterialStatePropertyAll(15.0),
                            shadowColor: MaterialStatePropertyAll(
                                Theme.of(context).primaryColor),
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).primaryColor),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            fixedSize:
                                MaterialStateProperty.all(Size(100.w, 7.h))),
                        child: Text(
                          "Create account",
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 25.0.sp, left: 20.sp, right: 20.sp),
                      child: OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            elevation: const MaterialStatePropertyAll(0.0),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            side: MaterialStatePropertyAll(BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            fixedSize:
                                MaterialStateProperty.all(Size(100.w, 7.h))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              "assets/svgs/google.svg",
                              width: 50.sp,
                              height: 50.sp,
                            ),
                            Text(
                              "Sign up with Google",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50.sp),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Already have an account? ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black45),
                            ),
                            InkWell(
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
              )
            ],
          )),
      onClosing: () {},
    );
  }
}
