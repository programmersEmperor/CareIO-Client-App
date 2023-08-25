import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CategoryGridElement extends StatelessWidget {
  final String title, desc;
  final VoidCallback onTap;
  const CategoryGridElement({
    super.key,
    required this.title,
    required this.desc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                      Text(
                        title.capitalize!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 5.sp, left: 3.sp, right: 3.sp),
                        child: Text(
                          desc,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 8.5.sp, color: Colors.black54),
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
    );
  }
}
