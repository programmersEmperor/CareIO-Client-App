import 'package:ai_health_assistance/Components/SharedWidgets/main_colored_button.dart';
import 'package:ai_health_assistance/Localization/app_strings.dart';
import 'package:ai_health_assistance/Pages/Authentication/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationController controller = Get.put(AuthenticationController());
    var isLoading = false.obs;
    return SizedBox(
      width: 100.w,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.confirmLogout.tr,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 15, right: 15),
              child: ElevatedButton(
                onPressed: () async {
                    isLoading(true);
                    await controller.logOut();
                    isLoading(false);
                    },
                style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                    Size(100.w, 6.h),
                  ),
                  elevation: const MaterialStatePropertyAll(0),
                  shadowColor:
                  const MaterialStatePropertyAll(Colors.red),
                  backgroundColor: const MaterialStatePropertyAll(
                      Colors.redAccent),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.logout_rounded,
                      color: Colors.white,
                      size: 15.sp,
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    Text(
                      AppStrings.logout.tr,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontSize: 11.sp),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
