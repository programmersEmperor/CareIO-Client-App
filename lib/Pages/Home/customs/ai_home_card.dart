import 'package:ai_health_assistance/Components/SharedWidgets/stack_button.dart';
import 'package:ai_health_assistance/Pages/Home/animations/animation_handler.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class AiHomeCard extends StatelessWidget {
  const AiHomeCard({
    super.key,
    required this.animationHandler,
  });

  final HomeAnimationHandler animationHandler;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 0),
      child: SlideTransition(
        position: animationHandler.aiCardAnimation,
        child: SizedBox(
          width: 100.w,
          child: Stack(
            children: [
              Card(
                color: AppColors.primaryColor,
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
                              turns: animationHandler.dottedAnimation,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                    color: Colors.white, fontSize: 10.sp),
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
}
