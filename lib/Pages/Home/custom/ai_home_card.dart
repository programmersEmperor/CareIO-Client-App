import 'package:ai_health_assistance/Components/SharedWidgets/stack_button.dart';
import 'package:ai_health_assistance/Localization/app_strings.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class AiHomeCard extends StatelessWidget {
  const AiHomeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Card(
              color: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.sp),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 18.h,
                  child: Stack(
                    children: [
                      PositionedDirectional(
                        start: -40,
                        top: -20,
                        child: Opacity(
                            opacity: 0.3,
                            child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(70),
                                color: Colors.white,
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                ))),
                      ),
                      PositionedDirectional(
                        end: -90,
                        top: -40,
                        child: Opacity(
                          opacity: 0.3,
                          child: Lottie.asset(
                            "assets/animations/robot.json",
                            reverse: true,
                            width: MediaQuery.of(context).size.width * 0.90,
                            frameRate: FrameRate(60),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                "Careio",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(
                                AppStrings.aiCardTitle.tr,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: StackButton(),
                            ),
                          ],
                        ),
                      ),
                    ],
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
