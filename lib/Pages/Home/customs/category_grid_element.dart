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
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Theme.of(context).cardColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconPath,
                  height: 20.sp,
                  width: 15.sp,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  height: 4.sp,
                ),
                Text(
                  title.capitalize!,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 9.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
