import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:sizer/sizer.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            elevation: 0,
            color: Colors.grey.shade200,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.sp)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 7.sp),
              child: Row(
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  Icon(
                    Boxicons.bx_search,
                    color: Colors.black54,
                    size: 15.sp,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    "Find your doctor",
                    style: TextStyle(color: Colors.black54, fontSize: 11.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.sp,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Padding(
            padding: EdgeInsets.all(7.sp),
            child: Icon(
              Boxicons.bx_filter_alt,
              color: Colors.white,
              size: 15.sp,
            ),
          ),
        ),
      ],
    );
  }
}
