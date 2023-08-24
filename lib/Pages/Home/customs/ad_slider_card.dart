import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AdsSliderCard extends StatelessWidget {
  const AdsSliderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/person.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20.sp),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 17.h,
              width: 100.w,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Colors.black87, Colors.transparent],
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(20.sp),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.sp),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: AutoSizeText(
                      "Advertiser name",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
