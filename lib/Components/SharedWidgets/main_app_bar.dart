import 'package:ai_health_assistance/Pages/Home/UiController/home_page_controller.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 25.sp, bottom: 0.sp, right: 5.sp, left: 5.sp),
      child: SizedBox(
        child: Row(
          children: [
            SizedBox(
              width: 7.sp,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/person.jpg"),
                    fit: BoxFit.cover,
                  )),
              height: 30.sp,
              width: 30.sp,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good morning ",
                      style: TextStyle(
                          fontSize: 9.5.sp,
                          color: Colors.black38,
                          fontWeight: FontWeight.w300),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3.sp),
                      child: Text(
                        "Haitham Hussien",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () =>
                  Get.find<HomePageController>().showMapBottomSheet(context),
              style: const ButtonStyle(
                splashFactory: NoSplash.splashFactory,
                overlayColor: MaterialStatePropertyAll(
                  Colors.transparent,
                ),
              ),
              child: Row(
                children: [
                  Text(
                    'Sana,a',
                    style: TextStyle(fontSize: 10.sp, color: Colors.black54),
                  ),
                  Icon(
                    Icons.location_on_outlined,
                    size: 15.sp,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
