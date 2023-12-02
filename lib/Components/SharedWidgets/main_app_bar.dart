import 'package:ai_health_assistance/Pages/Home/controller/home_page_controller.dart';
import 'package:ai_health_assistance/Pages/Profile/profile_page.dart';
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
      padding: const EdgeInsets.only(top: 25, bottom: 5, right: 5, left: 5),
      child: SizedBox(
        child: Row(
          children: [
            const SizedBox(
              width: 7,
            ),
            InkWell(
              onTap: () => Get.toNamed(ProfilePage.id),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/person.jpg"),
                      fit: BoxFit.cover,
                    )),
                height: 40,
                width: 40,
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Haitham Hussien",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Good morning ",
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black38,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () =>
                  Get.find<HomePageController>().showMapBottomSheet(context),
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.sp))),
                backgroundColor:
                    MaterialStatePropertyAll(AppColors.secondaryColor),
                overlayColor: const MaterialStatePropertyAll(
                  Colors.transparent,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 15,
                    color: AppColors.primaryColor,
                  ),
                  const Text(
                    'Sana,a',
                    style: TextStyle(fontSize: 10, color: Colors.black54),
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
