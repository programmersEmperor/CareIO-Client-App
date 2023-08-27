import 'package:ai_health_assistance/Pages/doctors/doctor_profile.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DoctorGridView extends StatelessWidget {
  const DoctorGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.sp),
      child: GridView.builder(
        itemCount: 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.sp,
            crossAxisSpacing: 30.sp,
            mainAxisExtent: 25.h),
        itemBuilder: (_, index) => InkWell(
          onTap: () => Get.toNamed(DoctorProfile.id),
          child: Stack(
            children: [
              SizedBox(
                width: 80.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.sp),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            "Doctor",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 5.sp, left: 3.sp, right: 3.sp),
                            child: AutoSizeText(
                              "Specialization",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 8.5.sp, color: Colors.black54),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3.5.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  "3.4",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/person.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 3.sp),
                    color: Theme.of(context).primaryColor,
                  ),
                  height: 8.h,
                  width: 17.w,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 3.sp),
                    color: Theme.of(context).primaryColor,
                  ),
                  height: 7.h,
                  width: 10.w,
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
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
