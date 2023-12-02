import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PaymentMethodCard extends StatelessWidget {
  final String title, subtitle, image;
  final RxBool selected;

  const PaymentMethodCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.sp),
      child: InkWell(
        onTap: () => selected(!selected.value),
        child: Obx(
          () => AnimatedContainer(
            duration: 100.milliseconds,
            padding: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
                color: selected.isTrue ? AppColors.primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(10.sp)),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      )),
                  height: 30.sp,
                  width: 30.sp,
                ),
                SizedBox(
                  width: 10.sp,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: AnimatedSlide(
                          offset:
                              selected.isTrue ? const Offset(0, 0) : const Offset(-2, 0),
                          duration: 200.milliseconds,
                          child: AnimatedOpacity(
                            opacity: selected.isTrue ? 1 : 0,
                            duration: 220.milliseconds,
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                color: selected.isTrue
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 4.sp,
                          ),
                          Text(
                            subtitle,
                            style: TextStyle(
                              fontSize: 8.5.sp,
                              color: selected.isTrue
                                  ? Colors.white
                                  : Colors.black38,
                            ),
                          ),
                        ],
                      ),
                    ],
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
