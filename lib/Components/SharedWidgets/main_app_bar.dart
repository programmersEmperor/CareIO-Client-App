import 'package:ai_health_assistance/Pages/Home/UiController/home_page_controller.dart';
import 'package:ai_health_assistance/Pages/Profile/profile_page.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 0, right: 5, left: 5),
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
                height: 30,
                width: 30,
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good morning ",
                      style: TextStyle(
                          fontSize: 9.5,
                          color: Colors.black38,
                          fontWeight: FontWeight.w300),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text(
                        "Haitham Hussien",
                        style: TextStyle(
                          fontSize: 10,
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
                overlayColor: MaterialStatePropertyAll(
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
