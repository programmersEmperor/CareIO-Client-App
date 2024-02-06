import 'package:ai_health_assistance/Components/SharedWidgets/main_colored_button.dart';
import 'package:ai_health_assistance/Models/Doctor.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TopRequestedDoctorsCard extends StatelessWidget {
  final Doctor doctor;
  const TopRequestedDoctorsCard({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.sp)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Hero(
                    tag: "doc${doctor.id}",
                    child: Container(
                      height: 50.sp,
                      width: 50.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        border: Border.all(
                            color: AppColors.scaffoldColor, width: 3.sp),
                        image: doctor.avatar == null
                            ? const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  "assets/images/person.jpg",
                                ),
                              )
                            : DecorationImage(
                                image: CachedNetworkImageProvider(
                                  '${doctor.avatar}',
                                ),
                              ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 8.0.sp, right: 5.0.sp, top: 0.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${doctor.name}",
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3.5.sp),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 10.sp,
                                ),
                                Text(
                                  "${doctor.rating}",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 8.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3.5.sp),
                            child: Text(
                              "${doctor.specialism?.name}",
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 8.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              MainColoredButton(
                text: "Book appointment",
                elevation: 0,
                onPress: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
