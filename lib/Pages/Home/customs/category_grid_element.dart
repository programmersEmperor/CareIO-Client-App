import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CategoryGridElement extends StatelessWidget {
  final String title, desc, iconPath;
  final VoidCallback onTap;
  const CategoryGridElement({
    super.key,
    required this.title,
    required this.desc,
    required this.onTap,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 30.w,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
          ),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Color(0xffeaeffc),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    iconPath,
                    height: 30.sp,
                    width: 15.sp,
                    color: Color(0xff4e71a8),
                  ),
                  SizedBox(
                    height: 4.sp,
                  ),
                  Text(
                    title.capitalize!,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
