import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StackButton extends StatelessWidget {
  const StackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.sp, horizontal: 5.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.sp),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(Colors.white),
          elevation: MaterialStatePropertyAll(10.sp),
          shadowColor: MaterialStatePropertyAll(
              Theme.of(context).primaryColor.withOpacity(0.3)),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.sp),
            ),
          ),
        ),
        child: Text(
          "Start chat",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
