import 'package:ai_health_assistance/Pages/doctors/doctor_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.sp),
      child: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.only(top: 10.sp),
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
          ),
          child: InkWell(
            onTap: () => Get.toNamed(DoctorProfile.id),
            child: SizedBox(
              child: Card(
                elevation: 0.sp,
                shadowColor: Colors.grey.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 8.sp, right: 8.sp, top: 10.sp, bottom: 10.sp),
                  child: Row(
                    children: [
                      Hero(
                        tag: "doc$index",
                        child: Container(
                          height: 50.sp,
                          width: 50.sp,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              border: Border.all(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  width: 3.sp),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  "assets/images/person.jpg",
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 8.0.sp, right: 5.0.sp, top: 0.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Doctor name",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3.5.sp),
                                child: Text(
                                  "Specialization",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 8.sp,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3.5.sp),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 10.sp,
                                    ),
                                    Text(
                                      "3.4",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 8.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 12.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
