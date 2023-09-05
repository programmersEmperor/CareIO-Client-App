import 'package:ai_health_assistance/Pages/Home/UiController/chat_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class ChatBotNotificationAlert extends StatelessWidget {
  final ChatUiController controller;
  const ChatBotNotificationAlert({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPadding(
        padding: controller.isPopUpAnimated.isTrue
            ? EdgeInsets.all(10.sp)
            : EdgeInsets.all(30.sp),
        duration: 4.seconds,
        child: SizedBox(
          child: Card(
            color: Theme.of(context).primaryColor,
            elevation: 15,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.sp)),
            shadowColor: Theme.of(context).cardColor,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Lottie.asset(
                      'assets/animations/star.json',
                      controller: controller.controller,
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Dear, Haitham",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              GestureDetector(
                                onTap: () => controller.disposePopUp(),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    shape: BoxShape.circle,
                                  ),
                                  padding: EdgeInsets.only(
                                      left: 3.sp,
                                      top: 5.sp,
                                      bottom: 5.sp,
                                      right: 3.sp),
                                  child: Icon(
                                    Icons.close,
                                    color: Theme.of(context).primaryColor,
                                    size: 10.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(
                            "Try to not waste your message on what will not benefit you, "
                            "Have as much advantage as you can for a better well-being, Have a good Experience :)",
                            style: TextStyle(
                                fontSize: 9.sp,
                                color: Colors.white.withOpacity(0.7)),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
