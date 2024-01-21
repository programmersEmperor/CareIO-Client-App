import 'package:ai_health_assistance/Pages/Search/specific_search_page.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomSearchBar extends StatelessWidget {
  final bool showFilter;
  final String title;
  final dynamic controller;
  const CustomSearchBar({
    super.key,
    this.showFilter = true,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => Get.toNamed(SpecificSearchPage.id),
            child: Card(
              elevation: 0,
              color: Colors.grey.shade200,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 9.sp),
                child: Row(
                  children: [
                    SizedBox(
                      width: 2.w,
                    ),
                    Icon(
                      Boxicons.bx_search,
                      color: AppColors.primaryColor,
                      size: 17.sp,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      title,
                      style: TextStyle(color: Colors.black54, fontSize: 10.sp),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (showFilter) ...[
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: controller.showFilter,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(9.sp),
                child: Icon(
                  Boxicons.bx_filter_alt,
                  color: Colors.white,
                  size: 15.sp,
                ),
              ),
            ),
          ),
        ]
      ],
    );
  }
}
