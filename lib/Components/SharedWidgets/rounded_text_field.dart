import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RoundedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  const RoundedTextField(
      {super.key, required this.controller, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(20.sp), // Adjust the radius as needed
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 10.sp),
        child: TextField(
          controller: controller,
          style: TextStyle(
            fontSize: 10.sp,
            color: Colors.black54,
          ),
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black45),
            counter: const SizedBox(),
            constraints: BoxConstraints(
              maxHeight: 30.sp,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
